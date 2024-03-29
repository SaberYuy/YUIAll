//
//  AppFlowCoordinator.swift
//  YUIAll
//
//  Created by YUI on 2023/2/8.
//

import UIKit

final class AppFlowCoordinator {
    
    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        // In App Flow we can check if user needs to login, if yes we would run login flow
        let exampleSwiftDIContainer = appDIContainer.makeExampleSwiftDIContainer()
        let flow = exampleSwiftDIContainer.makeSearchExampleSwiftUseCase()
        flow.start()
    }
}
