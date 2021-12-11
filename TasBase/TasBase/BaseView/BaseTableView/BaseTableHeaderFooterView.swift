//
//  BaseTableHeaderFooterView.swift
//  TasBase
//
//  Created by 박준현 on 2021/12/11.
//

import UIKit

public class BaseTableHeaderFooterView: UITableViewHeaderFooterView {
    
    var frontView: UIView?
    
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
}
