//
//  ExampleSwiftListViewModel.swift
//  YUIAll
//
//  Created by YUI on 2023/2/6.
//

import Foundation

struct ExampleSwiftListViewModelAction {
    
    /// Note: if you would need to edit example inside Details screen and update this Movies List screen with updated example then you would need this closure:
    //    let showExampleDetails: (Example, @escaping (_ updated: Example) -> Void) -> Void
    let showExampleDetail: (ExampleSwift) -> Void
    let showExampleQuerySuggestion: (@escaping (_ didSelect: ExampleSwiftQuery) -> Void) -> Void
    let closeExampleQuerySuggestion: () -> Void
}

enum ExampleSwiftListViewModelLoading {
    case fullScreen
    case nextPage
}

protocol ExampleSwiftListViewModelInput {
    func viewDidLoad()
    func didLoadNextPage()
    func didSearch(query: String)
    func didCancelSearch()
    func showQuerySuggestion()
    func closeQuerySuggestion()
    func didSelectItem(at index: Int)
}

protocol ExampleSwiftListViewModelOutput {
    var items: Observable<[ExampleSwiftListItemViewModel]> { get } /// Also we can calculate view model items on demand:
    ///https://github.com/kudoleh/iOS-Clean-Architecture-MVVM/pull/10/files
    var loading: Observable<ExampleSwiftListViewModelLoading?> { get }
    var query: Observable<String> { get }
    var error: Observable<String> { get }
    var isEmpty: Bool { get }
    var screenTitle: String { get }
    var emptyDataTitle: String { get }
    var errorTitle: String { get }
    var searchBarPlaceholder: String { get }
}

protocol ExampleSwiftListViewModel: ExampleSwiftListViewModelInput, ExampleSwiftListViewModelOutput {}

final class DefaultExampleSwiftListViewModel: ExampleSwiftListViewModel {
    
    private let searchExampleSwiftUseCase: SearchExampleSwiftUseCase
    private let actions: ExampleSwiftListViewModelAction?
    
    var currentPage: Int = 0
    var totalPageCount: Int = 1
    var hasMorePage: Bool { currentPage < totalPageCount }
    var nextPage: Int { hasMorePage ? currentPage + 1 : currentPage }
    
    private var pages: [ExampleSwiftPage] = []
    private var exampleSwiftLoadTask: Cancellable? { willSet { exampleSwiftLoadTask?.cancel() } }
    
    // MARK: - OUTPUT
    
    let items: Observable<[ExampleSwiftListItemViewModel]> = Observable([])
    let loading: Observable<ExampleSwiftListViewModelLoading?> = Observable(.none)
    let query: Observable<String> = Observable("")
    let error: Observable<String> = Observable("")
    var isEmpty: Bool { return items.value.isEmpty }
    let screenTitle = NSLocalizedString("ExampleSwift", comment: "")
    let emptyDataTitle = NSLocalizedString("Search results", comment: "")
    let errorTitle = NSLocalizedString("Error", comment: "")
    let searchBarPlaceholder = NSLocalizedString("Search ExampleSwift", comment: "")
    
    // MARK: - Init
    
    init(searchExampleSwiftUseCase: SearchExampleSwiftUseCase, actions: ExampleSwiftListViewModelAction?, currentPage: Int, totalPageCount: Int, pages: [ExampleSwiftPage], exampleSwiftLoadTask: Cancellable) {
        self.searchExampleSwiftUseCase = searchExampleSwiftUseCase
        self.actions = actions
    }
    
    // MARK: - Private
    
    private func appendPage(_ exampleSwiftPage: ExampleSwiftPage) {
        currentPage = exampleSwiftPage.page
        totalPageCount = exampleSwiftPage.totalPage
    }
    
    private func resetPages() {
        currentPage = 0
        totalPageCount = 1
        pages.removeAll()
        items.value.removeAll()
    }
    
    private func load(exampleSwiftQuery: ExampleSwiftQuery, loading: ExampleSwiftListViewModelLoading) {
        self.loading.value = loading
        query.value = exampleSwiftQuery.query
        
        exampleSwiftLoadTask = searchExampleSwiftUseCase.execute(
            requestValue: .init(query: exampleSwiftQuery, page: nextPage),
            cached: appendPage,
            completion: { result in
                switch result {
                case .success(let page):
                    self.appendPage(page)
                case .failure(let error):
                    self.handle(error: error)
                }
                self.loading.value = .none
            })
    }
    
    private func handle(error: Error) {
        self.error.value = error.isInternetConnectionError ?
        NSLocalizedString("No internet connection", comment: "") :
        NSLocalizedString("Failed loading", comment: "")
    }
    
    private func update(exampleSwiftQuery: ExampleSwiftQuery) {
        resetPages()
        load(exampleSwiftQuery: exampleSwiftQuery, loading: .fullScreen)
    }
}

// MARK: - INPUT. View event methods

extension DefaultExampleSwiftListViewModel {
    
    func viewDidLoad() {}
    
    func didLoadNextPage() {
        guard hasMorePage, loading.value == .none else { return }
        load(exampleSwiftQuery: .init(query: query.value), loading: .nextPage)
    }
    
    func didSearch(query: String) {
        guard !query.isEmpty else { return }
        update(exampleSwiftQuery: ExampleSwiftQuery(query: query))
    }
    
    func didCancelSearch() {
        exampleSwiftLoadTask?.cancel()
    }
    
    func showQuerySuggestion() {
        actions?.showExampleQuerySuggestion(update(exampleSwiftQuery:))
    }
    
    func closeQuerySuggestion() {
        actions?.closeExampleQuerySuggestion()
    }
    
    func didSelectItem(at index: Int) {
        actions?.showExampleDetail(pages.exampleSwifts[index])
    }
}

// MARK: - Private

private extension Array where Element == ExampleSwiftPage {
    var exampleSwifts: [ExampleSwift] { flatMap{ $0.exampleSwifts } }
}
