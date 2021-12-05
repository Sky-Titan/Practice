//
//  CGFloat+.swift
//  TasUtility
//
//  Created by 박준현 on 2021/12/05.
//

import UIKit

typealias Degrees = CGFloat
typealias Radians = CGFloat

extension Degrees {
    func toRadians() -> Radians {
        return self * .pi / 180
    }
}
