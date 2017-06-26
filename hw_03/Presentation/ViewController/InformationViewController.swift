//
//  InformationViewController.swift
//  hw_03
//
//  Created by Takashima on 2017/06/22.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

//fileprivate extension Selector {
//    static let keyboardWillShow =
//        #selector(InformationPresenterImpl.keyboardWillShow(notification:))
//}

class InformationViewController: UIViewController {
    fileprivate enum Section: Int {
        case name
        case email
        case message
        case send
    }
    fileprivate let CellNames: [String] = [
        "InformationNameCell",
        "InformationEmailCell",
        "InformationMessageCell",
        "InformationSendCell"
    ]

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.separatorStyle = .none
            tableView.isScrollEnabled = false
        }
    }

    fileprivate var disposeBag: DisposeBag = DisposeBag()
    fileprivate var routing: InformationRouting!
    fileprivate var presenter: InformationPresenter! {
        didSet {
            presenter.view = self
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setupUI()
    }
    
    func injection(presenter: InformationPresenter, routing: InformationRouting) {
        self.presenter = presenter
        self.routing = routing
    }
}

extension InformationViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return CellNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else {
            return UITableViewCell()
        }

        let index: Int = indexPath.section
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: CellNames[index], for: indexPath)
        cell.selectionStyle = .none
        switch section {
        case .name:
            let nameCell: InformationNameCell = cell as! InformationNameCell
            nameCell.presenter = presenter
        case .email:
            let emailCell: InformationEmailCell = cell as! InformationEmailCell
            emailCell.presenter = presenter
        case .message:
            let messageCell: InformationMessageCell = cell as! InformationMessageCell
            messageCell.presenter = presenter
        case .send:
            let sendCell: InformationSendCell = cell as! InformationSendCell
            sendCell.presenter = presenter
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

extension InformationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension InformationViewController: InformationPresenterView {
    func setupNavigation(title: String) {
        self.navigationItem.title = title

        self.navigationController?.navigationBar.barTintColor = UIColor.orange
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }

    func seguePrefectureList() {
        routing.seguePrefectureList()
    }
    
    func scrollUpView() {
        NotificationCenter.default.rx.notification(NSNotification.Name.UIKeyboardWillShow, object: nil)
            .subscribe(
                onNext: { [weak self] notification in
                    self?.keyboardWillShow(notification: notification)
                }
            ).addDisposableTo(disposeBag)
    }
    
    func scrollDownView() {
        self.tableView.contentInset = UIEdgeInsets.zero
        self.tableView.scrollIndicatorInsets = UIEdgeInsets.zero
    }

    func keyboardWillShow(notification: Notification) {
        if let userInfo = notification.userInfo {
            if let keyboardFrameInfo = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardHeight = keyboardFrameInfo.cgRectValue.height
                let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
                let indexPath: IndexPath = IndexPath(row: 0, section: Section.message.rawValue)
                
                self.tableView.contentInset = contentInsets
                self.tableView.scrollIndicatorInsets = contentInsets
                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
            }
        }
    }
    
    func setupViewGesture() {
        let gesture: UITapGestureRecognizer = UITapGestureRecognizer()
        gesture.cancelsTouchesInView = false
        
        gesture.rx.event
            .subscribe(
                onNext: { [weak self] _ in
                    self?.view.endEditing(true)
                }
            ).addDisposableTo(disposeBag)
        self.view.addGestureRecognizer(gesture)
    }
}
