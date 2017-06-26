//
//  InformationSendCell.swift
//  hw_03
//
//  Created by Takashima on 2017/06/22.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class InformationSendCell: UITableViewCell {
    @IBOutlet weak var sendButton: SystemButton!
    
    var presenter: InformationPresenter! {
        didSet {
            update()
        }
    }
    private var disposeBag: DisposeBag = DisposeBag()
    
    func update() {
        setupSendButton()
    }
    
    private func setupSendButton() {
        sendButton.rx.tap
            .subscribe(
                onNext: { [weak self] in
                    self?.presenter.sendInformation()
                }
            ).addDisposableTo(disposeBag)
    }
}
