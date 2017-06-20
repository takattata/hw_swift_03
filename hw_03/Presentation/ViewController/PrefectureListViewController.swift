//
//  PrefectureListViewController.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import UIKit

class PrefectureListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource    = self
            tableView.delegate      = self
        }
    }
    
    fileprivate var routing: PrefectureListRouting!
    fileprivate var prefectureVM: PrefectureViewModelProtocol!
    fileprivate var presenter: PrefectureListPresenter! {
        didSet {
            presenter.view = self as? PrefectureListPresenterView
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // presenter.setupUI()
        // presenter.refreshData()
    }
    
    func injection(presenter: PrefectureListPresenter, routing: PrefectureListRouting) {
        self.presenter = presenter
        self.routing = routing
    }
}

extension PrefectureListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PrefectureListCell = tableView.dequeueReusableCell(withIdentifier: "PrefectureListCell", for: indexPath) as! PrefectureListCell
        if let prefectureVM = prefectureVM {
            let viewModel: PrefectureViewModelProtocol = prefectureVM.prefectureViewModelProtocol(index: indexPath.row)
            cell.viewModel = viewModel
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: VMのcount必要??
        return 1
    }
}

extension PrefectureListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //FIXME: なにか良いやり方ない?.
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //routing.segueQuestionViewController(questionId: questionId)
    }
}

