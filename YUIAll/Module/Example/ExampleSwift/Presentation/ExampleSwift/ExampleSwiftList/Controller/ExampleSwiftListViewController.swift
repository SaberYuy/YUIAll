//
//  ExampleListViewController.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/22.
//

import Foundation

final class ExampleSwiftListViewController: UIViewController, StoryboardInstantiable, Alertable {
    
    private var contentView: UIView!
    private var exampleSwiftListContainer: UIView!
    private(set) var suggestionListContainer: UIView!
    private var searchBarContainer: UIView!
    private var emptyDataLabel: UILabel!
    
    private var viewModel: ExampleSwiftListViewModel!
    private var posterImageRepository: PosterImageRepository?
    
    private var exampleSwiftListTableViewController: ExampleSwiftListTableViewController?
    private var searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - Lifecycle
    
    static func create(with viewModel: ExampleSwiftListViewModel, posterImageRepository: PosterImageRepository?) -> ExampleSwiftListViewController {
        let view = ExampleSwiftListViewController.instantiateViewController()
        view.viewModel = viewModel
        view.posterImageRepository = posterImageRepository
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBehaviours()
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }
    
    private func bind(to viewModel: ExampleSwiftListViewModel) {
        //        viewModel.items.observe(on: self) { [weak self] in self?.upda
        //
        //        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchController.isActive = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == String(describing: ExampleSwiftListTableViewController.self),
           let destinationVC = segue.destination as? ExampleSwiftListTableViewController {
            
            exampleSwiftListTableViewController = destinationVC
            exampleSwiftListTableViewController?.viewModel = viewModel
            exampleSwiftListTableViewController?.posterImagesRepository = posterImageRepository
        }
    }
    
    // MARK: - Private
    
    private func setupView() {
        title = viewModel.screenTitle
        emptyDataLabel.text = viewModel.emptyDataTitle
        setupSearchController()
    }
    
    private func setupBehaviours() {
        addBehaviors([BackButtonEmptyTitleNavigationBarBehavior(),
                      BlackStyleNavigationBarBehavior()])
    }
    
    private func updateItems() {
        exampleSwiftListTableViewController?.reload()
    }
    
    private func updateLoading(_ loading: ExampleSwiftListViewModelLoading?) {
        emptyDataLabel.isHidden = true
        exampleSwiftListContainer.isHidden = true
        suggestionListContainer.isHidden = true
        LoadingView.hide()
        
        switch loading {
        case .fullScreen: LoadingView.show()
        case .nextPage: exampleSwiftListContainer.isHidden = false
        case .none:
            exampleSwiftListContainer.isHidden = viewModel.isEmpty
            emptyDataLabel.isHidden = !viewModel.isEmpty
        }
        
        exampleSwiftListTableViewController?.updateLoading(loading)
        
    }
    
    private func updateQuerySuggestion() {
        
    }
}

// MARK: - Search Controller

extension ExampleSwiftListViewController {
    private func setupSearchController() {
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = viewModel.searchBarPlaceholder
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.translatesAutoresizingMaskIntoConstraints = true
        searchController.searchBar.barStyle = .black
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.frame = searchBarContainer.bounds
        searchController.searchBar.autoresizingMask = [.flexibleWidth]
        searchBarContainer.addSubview(searchController.searchBar)
        definesPresentationContext = true
        if #available(iOS 13.0, *) {
            searchController.searchBar.searchTextField.accessibilityIdentifier = AccessibilityIdentifier.searchField
        }
    }
}

extension ExampleSwiftListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        searchController.isActive = false
        viewModel.didSearch(query: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.didCancelSearch()
    }
}

extension ExampleSwiftListViewController: UISearchControllerDelegate {
    public func willPresentSearchController(_ searchController: UISearchController) {
        
    }
}
