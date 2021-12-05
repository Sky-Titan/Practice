//
//  RedColorView.swift
//  Practice
//
//  Created by 박준현 on 2021/11/30.
//

import UIKit
import TasBase
import TasUtility

class RedColorView: BaseXibView, FrontViewProtocol {
    func setViewModel(_ viewModel: FrontViewModelProtocol) {
        
    }
    
    static func size(_ data: FrontViewModelProtocol) -> CGSize {
        return CGSize(width: UIScreen.mainWidth, height: UIScreen.mainHeight)
    }
    
    override func nibName() -> String? {
        return "RedColorView"
    }
    
}
