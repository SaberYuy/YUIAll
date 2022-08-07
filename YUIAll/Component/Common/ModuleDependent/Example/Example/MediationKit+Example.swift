//
//  MediationKit+Example.swift
//  YUIAll
//
//  Created by YUI on 2022/6/16.
//

import UIKit

public extension MediationKit {
    
    @objc public func viewControllerForExample(callback:@escaping (String) -> Void) -> UIViewController? {
        
        let params = [
            "callback" : callback,
            kYUIMediatorParamsKeySwiftTargetModuleName : "YUIAll"
        ] as [AnyHashable : Any]
        
//        if let viewContr
        return nil
    }
}
 
