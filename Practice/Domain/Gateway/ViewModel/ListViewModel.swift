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
        let section = FrontSection()
        
        for _ in 0..<6 {
            section.cellViewModels.append(ColorDummyViewModel(color: .red, height: 300))
            section.cellViewModels.append(ColorDummyViewModel(color: .blue, height: 150))
        }
        
        
        frontSections.append(section)
        delegate?.viewModelRefreshed(self)
    }
}
