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
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        guard let viewClass = reuseIdentifier else { return }
        let type = NSClassFromString(viewClass) as! UIView.Type
        let view = type.init(frame: frame)
        contentView.addSubview(view)
        view.bindingToSuperview()
        self.frontView = view
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
