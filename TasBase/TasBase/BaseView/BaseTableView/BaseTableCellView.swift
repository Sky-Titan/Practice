//
//  BaseTableCellView.swift
//  TasBase
//
//  Created by 박준현 on 2021/11/30.
//

import UIKit
import TasUtility

class BaseTableCellView: UITableViewCell {
    
    var frontView: UIView?
    
    func setViewModel(_ viewModel: FrontViewModelProtocol) {
        if let frontView = frontView as? FrontViewProtocol {
            frontView.setViewModel(viewModel)
        } else {
            let viewClass = viewModel.frontViewProperty.className
            let type = NSClassFromString(viewClass) as! UIView.Type
            let view = type.init(frame: frame)
            contentView.addSubview(view)
            view.bindingToSuperview()
            self.frontView = view
            
            if let view = view as? FrontViewProtocol {
                view.setViewModel(viewModel)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
