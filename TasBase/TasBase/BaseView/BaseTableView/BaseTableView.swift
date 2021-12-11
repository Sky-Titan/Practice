//
//  BaseTableView.swift
//  TasBase
//
//  Created by 박준현 on 2021/11/29.
//

import UIKit

open class BaseTableView: UITableView {
    
    public var viewModel: BaseListViewModel?
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        doInit()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        doInit()
    }
    
    private func doInit() {
        register(BaseTableCellView.self, forCellReuseIdentifier: "BaseTableCellView")
        self.dataSource = self
        self.delegate = self
    }
}
extension BaseTableView: BaseListViewModelDelegate {
    
    public func viewModelRefreshed(_ viewModel: BaseListViewModel) {
        self.viewModel = viewModel
        reloadData()
    }
}

extension BaseTableView: UITableViewDataSource, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel?.viewModel(at: indexPath)?.frontViewProperty.cellSize.height ?? 0
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.frontSections.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.frontSections[section].cellViewModels.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let frontViewModel = viewModel?.viewModel(at: indexPath) else { fatalError() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "BaseTableCellView", for: indexPath) as! BaseTableCellView
        cell.setViewModel(frontViewModel)
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let touchable = viewModel?.frontSections[indexPath.section].cellViewModels[indexPath.row] as? Touchable else { return }
        touchable.onTouch()
    }
}

public protocol Touchable: AnyObject {
    var touch: (() -> Void)? { get set }
    func onTouch()
}

public protocol BaseListViewModel {
    var frontSections: [FrontSection] { get set }
    var delegate: BaseListViewModelDelegate? { get set }
    func resetModel()
}
extension BaseListViewModel {
    public func viewModel(at indexPath: IndexPath) -> FrontViewModelProtocol? {
        return frontSections[indexPath.section].cellViewModels[indexPath.row]
    }
}

public protocol BaseListViewModelDelegate: AnyObject {
    func viewModelRefreshed(_ viewModel: BaseListViewModel)
}

public class FrontSection {
    public var cellViewModels: [FrontViewModelProtocol] = []
    
    public init() {
        
    }
}

public protocol FrontViewModelProtocol: AnyObject {
    var frontViewProperty: FrontViewProperty { get set }
}

public protocol FrontViewProtocol: AnyObject {
    
    func setViewModel(_ viewModel: FrontViewModelProtocol)
    static func size(_ data: FrontViewModelProtocol) -> CGSize
}

public class FrontViewProperty {
    public var cellSize: CGSize
    public var className: String
    
    public init(cellSize: CGSize, className: String) {
        self.cellSize = cellSize
        self.className = className
    }
}
