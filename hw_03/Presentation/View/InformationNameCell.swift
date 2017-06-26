//
//  InformationNameCell.swift
//  hw_03
//
//  Created by Takashima on 2017/06/22.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class InformationNameCell: UITableViewCell {
    @IBOutlet weak var nameText: UITextField!

    var presenter: InformationPresenter! {
        didSet {
            updateCell()
        }
    }

    private var disposeBag: DisposeBag = DisposeBag()

    //FIXME: これいつ呼ばれるんだっけ?.
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.disposeBag = DisposeBag()
    }
    
    func updateCell() {
        setupNameField()
    }
    
    private func setupNameField() {
        nameText.rx.text.changed
            .subscribe(onNext: { [weak self] name in
                self?.presenter.name.value = name!
            }
        ).addDisposableTo(disposeBag)
    }
}

extension InformationNameCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
