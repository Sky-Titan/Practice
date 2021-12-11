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

    @IBOutlet weak var circleProgressView: CircleProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //circleProgressView.startProgressAnimate()
    }
    
    @IBAction func click(_ sender: Any) {
        circleProgressView.startProgressAnimate()
    }
}
