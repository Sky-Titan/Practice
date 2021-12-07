//
//  ViewController.swift
//  Practice
//
//  Created by 박준현 on 2021/11/28.
//

import UIKit
import TasBase
import TasExample

class ViewController: TSViewController {

    var number: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func openClick(_ sender: Any) {
        let vc = ViewController()
        vc.number = number + 1
        ViewManager.shared.pushViewController(viewController: vc, animated: true)
    }
    
    @IBAction func closeClick(_ sender: Any) {
        ViewManager.shared.popViewController(animated: true)
    }
}
