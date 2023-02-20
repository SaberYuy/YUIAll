//
//  Alertable.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/20.
//

import UIKit

public protocol Alertable {}
public extension Alertable where Self: UIViewController {
    
    func showAlert(title: String = "", message: String, preferredstyle: UIAlertController.Style = .alert, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: title, style: .default, handler: nil))
        self.present(alert, animated: true, completion: completion)
    }
}
