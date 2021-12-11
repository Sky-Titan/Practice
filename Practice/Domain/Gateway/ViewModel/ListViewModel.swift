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
        
        section.cellViewModels.append(ColorDummyViewModel(color: .red, height: 1000))
        
        section.headerViewModel = ColorDummyViewModel(color: .green, height: 20)
        frontSections.append(section)
        
        let section2 = FrontSection()
        section2.cellViewModels.append(ColorDummyViewModel(color: .blue, height: 1000))
        section2.headerViewModel = ColorDummyViewModel(color: .gray, height: 20)
        frontSections.append(section2)
        
        delegate?.viewModelRefreshed(self)
    }
}
