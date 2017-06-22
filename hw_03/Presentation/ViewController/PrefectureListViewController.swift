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
    fileprivate var prefectureListVM: PrefectureListViewModel!
    fileprivate var presenter: PrefectureListPresenter! {
        didSet {
            presenter.view = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.refreshData()
        presenter.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPathForSelectedRow: IndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }
    
    func injection(presenter: PrefectureListPresenter, routing: PrefectureListRouting) {
        self.presenter = presenter
        self.routing = routing
    }
    
    func refreshData() {
        presenter.refreshData()
    }
}

extension PrefectureListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PrefectureListCell = tableView.dequeueReusableCell(withIdentifier: "PrefectureListCell", for: indexPath) as! PrefectureListCell
        //FIXME: 押した時にIDを渡す.
        let viewModel: PrefectureViewModelProtocol = prefectureListVM.PrefectureViewModelProtocol(index: indexPath.row)
        cell.viewModel = viewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //FIXME: VMのcount必要??
        return prefectureListVM.count()
    }
}

extension PrefectureListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //FIXME: なにか良いやり方ない?.
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //routing.segueQuestionViewController(questionId: questionId)
        presenter.selectedItem(index: indexPath.row)
    }
}

extension PrefectureListViewController: PrefectureListPresenterView {
    func segueWeather(prefectureId: String) {
        routing.segueWeather(prefectureId: prefectureId)
    }

    func setupNavigation(title: String) {
        self.navigationItem.title = title
    }

    func loadPrefectureListVM(prefectureListVM: PrefectureListViewModel) {
        self.prefectureListVM = prefectureListVM
    }
}

