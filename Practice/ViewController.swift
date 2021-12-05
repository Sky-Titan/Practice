//
//  ViewController.swift
//  Practice
//
//  Created by 박준현 on 2021/11/28.
//

import UIKit
import TasBase

class ViewController: TSViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func shareItem(_ sender: Any) {
        let activityItems: [Any] = ["Hello World~!"]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
}
