//
//  BaseXibView.swift
//  TasBase
//
//  Created by 박준현 on 2021/11/29.
//

import UIKit

open class BaseXibView: UIView {
    
    @IBOutlet open weak var contentView: UIView!
    
    open func nibName() -> String? {
        return nil
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }
    
    private func loadNib() {
        if let name = nibName() {
            Bundle(for: type(of: self)).loadNibNamed(name, owner: self, options: nil)
            self.addSubview(contentView)
            contentView.frame = frame
            didFinishLoadingNib()
        }
    }
    
    open override func awakeFromNib() {
    }
    
    open func didFinishLoadingNib() {
        
    }
}
