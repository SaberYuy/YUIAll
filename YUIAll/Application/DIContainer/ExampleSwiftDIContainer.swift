//
//  ExampleSwiftDIContainer.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/24.
//

import Foundation

final class ExampleSwiftDIContainer {
    
    struct Dependency {
        let apiDataTransferService: DataTransferService
        let imageDateTransferService:  DataTransferService
    }
    
    private let dependency: Dependency
    
    // MARK: - Persistent Storage

    init(dependency: Dependency) {
        self.dependency = dependency
    }
    
    func makeSearchExampleSwiftUseCase() -> SearchExampleSwiftUseCase {
//        return DefaultSearchExampleSwiftUseCase(exampleSwiftRepository: <#T##ExampleSwiftRepository#>, exampleSwiftQueryRepository: <#T##ExampleSwiftQueryRepository#>)
    }
    
    func makeFetchRecentExampleSwiftQueryUseCase(requestValue: FetchRecentExampleSwiftQueryUseCase.RequestValue,
                                                 completion: @escaping (FetchRecentExampleSwiftQueryUseCase.ResultValue) -> Void) -> UseCase {
        return FetchRecentExampleSwiftQueryUseCase(requestValue: requestValue, completion: completion, exampleSwiftQueryRepository: <#T##ExampleSwiftQueryRepository#>)
        
    }
    
    // MARK: - Repository
    
    func makePosterImageRepository() -> PosterImageRepository {
        return DefaultPosterImageRepository(dataTransferService: )
    }
   
    // MARK: - Movie Detail
    
    // MARK: - Flow Coordinator
    func makeExampleSwiftFlowCoordinator(navigationController: UINavigationController) -> ExampleSwiftFlowCoordinator {
        return ExampleSwiftFlowCoordinator.init(navigationController: navigationController, dependency: self)
    }
}

extension ExampleSwiftDIContainer: ExampleSwiftFlowCoordinatorDependency {
    
    // MARK: - ExampleSwift List
    func makeExampleSwiftListViewController(action: ExampleSwiftListViewModelAction) -> ExampleSwiftListViewController {
        return ExampleSwiftListViewController.create(with: makeExampleSwiftListViewModel(action: action), posterImageRepository: nil)
    }

    func makeExampleSwiftListViewModel(action: ExampleSwiftListViewModelAction) -> ExampleSwiftListViewModel {
        return DefaultExampleSwiftListViewModel(searchExampleSwiftUseCase: makeSearchExampleSwiftUseCase(),
                                                actions: action)
    }
    
    // MARK: - ExampleSwift Detail
    func makeExampleDetailViewController(exampleSwift: ExampleSwift) -> UIViewController {
        return ExampleSwiftDetailViewController.create(with: makeExampleDetailViewModel(exampleSwift: exampleSwift))
    }
    
    func makeExampleDetailViewModel(exampleSwift: ExampleSwift) -> ExampleSwiftDetailViewModel {
        return DefaultExampleSwiftDetailViewModel(exampleSwift: exampleSwift,
                                                  posterImageRepository: nil)
    }
    
    // MARK: - ExampleSwift Query Suggestion List
    func makeExampleQuerySuggestionListViewController(didSelect: @escaping ExampleSwiftQueryListViewModelDidSelectAction) -> UIViewController {
        
    }
}
