//
//  BaseTableCellView.swift
//  TasBase
//
//  Created by 박준현 on 2021/11/30.
//

import UIKit

class BaseTableCellView: UITableViewCell {
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, viewModel: FrontViewModelProtocol) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let type = NSClassFromString(viewModel.frontViewProperty.className) as! UIView.Type
        let view = type.init(frame: frame)
        if let view = view as? FrontViewProtocol {
            view.setViewModel(viewModel)
        }
        contentView.addSubview(view)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
