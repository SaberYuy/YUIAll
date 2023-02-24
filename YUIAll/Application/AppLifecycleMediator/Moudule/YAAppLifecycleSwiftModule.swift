//
//  YAAppLifecycleSwiftModule.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/8.
//

import Foundation

final class YAAppLifecycleSwiftModule: NSObject, AppLifecycleMediatorProtocol {
    
    let appDIContainer = AppDIContainer()
    var appFlowCoordinator: AppFlowCoordinator?
    weak var window: UIWindow?
    
    // MARK: AppLifecycleMediatorProtocol
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        setup()
        
        didInitWindow()
        
        return true
    }
    
    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        setup()
    }
    
    func setup() {
        
        AppAppearance.setupAppearance()
    }
    
    func didInitWindow() {
        
        let navigationController = UINavigationController()
        window = getCurrentWindow()
        window?.rootViewController = navigationController
        
        appFlowCoordinator = AppFlowCoordinator(navigationController: navigationController,
                                                appDIContainer: appDIContainer)
        appFlowCoordinator?.start()
        window?.makeKeyAndVisible()
    }
    
    func getCurrentWindow() -> UIWindow? {
        
        if #available(iOS 13.0, *) {
            return UIApplication.shared.connectedScenes.filter { $0.activationState == .foregroundActive }
                .compactMap { $0 as? UIWindowScene }.first?.windows
                .filter { $0.isKeyWindow }.first;
        }else {
            return UIApplication.shared.keyWindow!
        }
    }
}
