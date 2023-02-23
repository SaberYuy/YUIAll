//
//  ExampleSwiftQueryListViewModel.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/23.
//

import Foundation

typealias ExampleSwiftQueryListViewModelDidSelectAction = (ExampleSwiftQuery) -> Void

protocol ExampleSwiftQueryListViewModelInput {
    func viewWillAppear ()
    func didSelect(item: ExampleSwiftQueryListItemViewModel)
}

protocol ExampleSwiftQueryListViewModelOutput {
    var items: Observable<[ExampleSwiftQueryListItemViewModel]> { get }
}

protocol ExampleSwiftQueryListViewModel: ExampleSwiftQueryListViewModelInput, ExampleSwiftQueryListViewModelOutput { }

typealias FetchRecentExampleSwiftQueryUseCaseFactory = (
    FetchRecentExampleSwiftQueryUseCase.RequestValue,
    @escaping (FetchRecentExampleSwiftQueryUseCase.ResultValue) -> Void
) -> UseCase

final class DefaultExampleSwiftQueryListViewModel: ExampleSwiftQueryListViewModel {
    
    private let numberOfQueriesToShow: Int
    private let fetchRecentExampleSwiftQueryUseCaseFactory: FetchRecentExampleSwiftQueryUseCaseFactory
    private let didSelect: ExampleSwiftQueryListViewModelDidSelectAction?
    
    // MARK: - OUTPUT
    let items: Observable<[ExampleSwiftQueryListItemViewModel]> = Observable([])
    
    init(numberOfQueryToShow: Int, fetchRecentExampleSwiftQueryUseCaseFactory: @escaping FetchRecentExampleSwiftQueryUseCaseFactory, didSelect: ExampleSwiftQueryListViewModelDidSelectAction? = nil) {
        self.numberOfQueriesToShow = numberOfQueryToShow
        self.fetchRecentExampleSwiftQueryUseCaseFactory = fetchRecentExampleSwiftQueryUseCaseFactory
        self.didSelect = didSelect
    }
    
    private func updateExampleQuery() {
        let request = FetchRecentExampleSwiftQueryUseCase.RequestValue(maxCount: numberOfQueriesToShow)
        let completion: (FetchRecentExampleSwiftQueryUseCase.ResultValue) -> Void = { result in
            switch result {
            case .success(let items):
                self.items.value = items.map { $0.query }.map(ExampleSwiftQueryListItemViewModel.init)
            case .failure: break
            }
        }
        let useCase = fetchRecentExampleSwiftQueryUseCaseFactory(request, completion)
        useCase.start()
    }
}

// MARK: - INPUT. View event methods
extension DefaultExampleSwiftQueryListViewModel {
    
    func viewWillAppear() {
        updateExampleQuery()
    }
    
    func didSelect(item: ExampleSwiftQueryListItemViewModel) {
        didSelect?(ExampleSwiftQuery(query: item.query))
    }
}
