//
//  ExampleSwiftFlowCoordinator.swift
//  YUIAll
//
//  Created by YUIAll on 2023/2/6.
//

import UIKit

protocol ExampleSwiftFlowCoordinatorDependency {
    func makeExampleSwiftListViewController(action: ExampleSwiftListViewModelAction) -> ExampleSwiftListViewController
    func makeExampleDetailViewController(exampleSwift: ExampleSwift) -> UIViewController
    func makeExampleQuerySuggestionListViewController(didSelect: @escaping ExampleSwiftQueryListViewModelDidSelectAction) -> UIViewController
}

final class ExampleSwiftFlowCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependency: ExampleSwiftFlowCoordinatorDependency
    
    private weak var exampleSwiftListVC: ExampleSwiftListViewController?
    private weak var exampleQuerySuggestionVC: UIViewController?
    
    init(navigationController: UINavigationController,
         dependency: ExampleSwiftFlowCoordinatorDependency) {
        self.navigationController = navigationController
        self.dependency = dependency
    }
    
    func start() {
        // Note: here we keep strong reference with actions, this way this flow do not need to be strong referenced
        let action = ExampleSwiftListViewModelAction(showExampleDetail: showExampleDetail,
                                                     showExampleQuerySuggestion: showExampleQuerySuggestion,
                                                     closeExampleQuerySuggestion: closeExampleQuerySuggestion)
        let vc = dependency.makeExampleSwiftListViewController(action: action)
        
        navigationController?.pushViewController( vc, animated: false)
        exampleSwiftListVC = vc
    }
    
    private func showExampleDetail(exampleSwift: ExampleSwift) {
        let vc = dependency.makeExampleDetailViewController(exampleSwift: exampleSwift)
        navigationController?.pushViewController( vc, animated: true)
    }
    
    private func showExampleQuerySuggestion(didSelect: @escaping (ExampleSwiftQuery) -> Void) {
        guard let exampleSwiftListViewController = exampleSwiftListVC, exampleQuerySuggestionVC == nil,
              let container = exampleSwiftListViewController.suggestionListContainer else { return }
        
        let vc = dependency.makeExampleQuerySuggestionListViewController(didSelect: didSelect)
        
        exampleSwiftListViewController.add(child: vc, container: container)
        exampleQuerySuggestionVC = vc
        container.isHidden = false
    }
    
    private func closeExampleQuerySuggestion() {
        exampleQuerySuggestionVC?.remove()
        exampleQuerySuggestionVC = nil
        exampleSwiftListVC?.suggestionListContainer.isHidden = true
    }
}
