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

    @IBOutlet weak var anchorPointView: AnchorPointPracticeView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //anchorPoint기준으로 360도회전
    @IBAction func rotate(_ sender: Any) {
        anchorPointView.rotate()
    }
    
    //좌측 상단
    @IBAction func leftTop(_ sender: Any) {
        anchorPointView.setRectLayerAnchorPoint(point: CGPoint(x: 0, y: 0))
    }
    
    //좌측 하단
    @IBAction func leftBottom(_ sender: Any) {
        anchorPointView.setRectLayerAnchorPoint(point: CGPoint(x: 0, y: 1))
    }
    
    //정중앙
    @IBAction func center(_ sender: Any) {
        anchorPointView.setRectLayerAnchorPoint(point: CGPoint(x: 0.5, y: 0.5))
    }
    
    //우측 상단
    @IBAction func rightTop(_ sender: Any) {
        anchorPointView.setRectLayerAnchorPoint(point: CGPoint(x: 1, y: 0))
    }
    
    //우측 하단
    @IBAction func rightBottom(_ sender: Any) {
        anchorPointView.setRectLayerAnchorPoint(point: CGPoint(x: 1, y: 1))
    }
}
