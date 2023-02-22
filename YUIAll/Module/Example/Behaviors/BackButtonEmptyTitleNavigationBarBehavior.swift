//
//  BackButtonEmptyTitleNavigationBarBehavior.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/22.
//

import UIKit

struct BackButtonEmptyTitleNavigationBarBehavior: ViewControllerLifecycleBehavior {
    
    func viewDidLoad(viewController: UIViewController) {
        
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
