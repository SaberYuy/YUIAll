//
//  YAAppLifecycleSwiftModule.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/8.
//

import Foundation

final class YAAppLifecycleSwiftModule: NSObject, AppLifecycleMediatorProtocol {
   
    // MARK: AppLifecycleMediatorProtocol
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        setup()
        
        return true
    }
    
    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        setup()
    }
    
    func setup() {
        
        AppAppearance.setupAppearance()
    }
}
