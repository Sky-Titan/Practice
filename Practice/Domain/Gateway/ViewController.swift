//
//  ViewController.swift
//  Practice
//
//  Created by 박준현 on 2021/11/28.
//

import UIKit
import TasBase
import TasExample

class ViewController: TSViewController {

   
    @IBOutlet weak var tableView: BaseTableView!
    let listViewModel = ListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.viewModel = listViewModel
        listViewModel.delegate = tableView
        listViewModel.resetModel()
    }
}
