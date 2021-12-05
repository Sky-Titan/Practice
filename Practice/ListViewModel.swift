//
//  ListViewModel.swift
//  Practice
//
//  Created by 박준현 on 2021/11/30.
//

import Foundation
import TasBase

class ListViewModel: BaseListViewModel {
    var frontSections: [FrontSection] = []
    weak var delegate: BaseListViewModelDelegate?
    func resetModel() {
        frontSections = []
        
        delegate?.viewModelRefreshed(self)
    }
}
