//
//  ExampleViewController.swift
//  YUIAll
//
//  Created by YUI on 2020/11/9.
//

import UIKit

class ExampleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        btn.addTarget(self, action:#selector(tapBtn) , for: .touchDown)
        btn.backgroundColor = .red
        self.view .addSubview(btn)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

        @objc public func tapBtn() {
            
//            self.navigationController?.pushViewController(ExampleMVCViewController(), animated: true)
        }
}
