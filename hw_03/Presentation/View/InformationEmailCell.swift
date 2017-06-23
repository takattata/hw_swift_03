//
//  InformationEmailCell.swift
//  hw_03
//
//  Created by Takashima on 2017/06/22.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class InformationEmailCell: UITableViewCell {
    @IBOutlet weak var emailText: UITextField!
    
    var presenter: InformationPresenter! {
        didSet {
            updateCell()
        }
    }
    
    private var disposeBag: DisposeBag = DisposeBag()

    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.disposeBag = DisposeBag()
    }

    func updateCell() {
        setupAddress()
    }
    
    private func setupAddress() {
        emailText.rx.text.changed
            .subscribe(onNext: { [weak self] email in
                self?.presenter.email.value = email!
            }
        ).addDisposableTo(disposeBag)
    }
}
