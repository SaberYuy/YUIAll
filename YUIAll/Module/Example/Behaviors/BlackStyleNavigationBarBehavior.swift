//
//  BlackStyleNavigationBarBehavior.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/22.
//

import Foundation

struct BlackStyleNavigationBarBehavior: ViewControllerLifecycleBehavior {

    func viewDidLoad(viewController: UIViewController) {
        
        viewController.navigationController?.navigationBar.barStyle = .black
    }
}
