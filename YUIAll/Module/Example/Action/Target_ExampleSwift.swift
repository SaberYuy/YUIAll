//
//  Target_Example.swift
//  YUIAll
//
//  Created by YUI on 2022/6/15.
//

import UIKit

class Target_ExampleSwift: NSObject {

    @objc func Action_nativeFetchExampleSwiftListViewController(_ params:[AnyHashable:Any]?) -> UIViewController {

        if let actionParams = params {

            if let callback = actionParams["callback"] as? (String) -> Void {
                callback("success")
            }
        }

        let viewController = ExampleSwiftListViewController()
        return viewController
    }
    
    @objc func Action_Extension_ViewController(_ params:NSDictionary) -> UIViewController {
        
        if let block = params["callback"] {
            
            typealias CallbackType = @convention(block) (NSString) -> Void
            let blockPtr = UnsafeRawPointer(Unmanaged<AnyObject>.passUnretained(block as AnyObject).toOpaque())
            let callback = unsafeBitCast(blockPtr, to: CallbackType.self)
            
            callback("success")
        }
        
        let viewController = ExampleSwiftListViewController()
        return viewController
    }
    
    
//    @objc func Action_nativeFetchExampleObjcViewController(_ params:NSDictionary) -> UIViewController {
//
//            if let actionParams = params {
//                let block = actionParams["callback"]
//
//                // 转换一下
//                typealias CallbackType = @convention(block) (String) -> Void
//                let blockPtr = UnsafeRawPointer(Unmanaged<AnyObject>.passUnretained(block as AnyObject).toOpaque())
//                let callback = unsafeBitCast(blockPtr, to: CallbackType.self)
//
//                // 此时block就变成了closure，就可以正常调用了
//                callback("success")
//            }
//
//            let aViewController = ViewController()
//            return aViewController
//        }
}
