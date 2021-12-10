//
//  UIView+.swift
//  TasUtility
//
//  Created by 박준현 on 2021/12/10.
//

import UIKit

extension UIView {
    public func bindingToSuperview() {
        guard let superview = superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    }
}

extension UIView {
    public static func className() -> String {
        return String(reflecting: Self.self)
    }
}
