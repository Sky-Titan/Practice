//
//  BaseTableView.swift
//  TasBase
//
//  Created by 박준현 on 2021/11/29.
//

import UIKit

open class BaseTableView: UITableView {
    
    open var viewModel: BaseListViewModel?
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        doInit()
    }
    
    private func doInit() {
        self.dataSource = self
        self.delegate = self
    }
}
extension BaseTableView: BaseListViewModelDelegate {
    
    public func viewModelRefreshed(_ viewModel: BaseListViewModel) {
        reloadData()
    }
}
extension BaseTableView: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.frontSections.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // TODO: 바꾸기
        return UITableViewCell(frame: self.bounds)
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

public protocol BaseListViewModel {
    var frontSections: [FrontSection] { get set }
}

public protocol BaseListViewModelDelegate: AnyObject {
    func viewModelRefreshed(_ viewModel: BaseListViewModel)
}

public class FrontSection {
    var cellViewModels: [FrontViewModelProtocol] = []
}

public protocol FrontViewModelProtocol: AnyObject {
    
}

public protocol FrontViewProtocol: AnyObject {
    
    func setViewModel(_ viewModel: FrontViewModelProtocol)
    static func size(_ data: FrontViewModelProtocol)
}

