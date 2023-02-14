//
//  SceneDelegate.swift
//  YUIAll
//
//  Created by YUI on 2020/11/9.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: scene as! UIWindowScene)
        let mediator = AppLifecycleMediator.sharedInstance()
        mediator.loadModules()
        AppLifecycleMediator.sharedInstance().scene(scene, willConnectTo: session, options: connectionOptions)
        
        //        self.window = UIWindow(windowScene: scene as! UIWindowScene)
        //        self.window?.frame = UIScreen.main.bounds
        //        self.window?.backgroundColor = .white
        //        self .didInitWindow()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created thex'w next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        
        AppLifecycleMediator.sharedInstance().sceneDidDisconnect(scene)
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        
        AppLifecycleMediator.sharedInstance().sceneDidBecomeActive(scene)
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        
        AppLifecycleMediator.sharedInstance().sceneWillResignActive(scene)
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        
        AppLifecycleMediator.sharedInstance().sceneWillEnterForeground(scene)
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        
        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        
        AppLifecycleMediator.sharedInstance().sceneDidEnterBackground(scene)
    }
    //    func didInitWindow() {
    //
    //        self.window?.rootViewController = self.generateWindowRootViewController()
    //        self.window?.makeKeyAndVisible()
    //        self.startLaunchingAnimation()
    //    }
    //
    //    func generateWindowRootViewController() -> UIViewController {
    //
    //        //        let viewController = MediationKit.sharedInstance().viewControllerForExampleObjc()
    //        //        let navigationController = UINavigationController(rootViewController:viewController)
    //
    //        let viewController = MediationKit.sharedInstance().viewControllerForMain()
    //
    //        return viewController
    //    }
    //
    //    func startLaunchingAnimation() {
    //
    //    }
}

