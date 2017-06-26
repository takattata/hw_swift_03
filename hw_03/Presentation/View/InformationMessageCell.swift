//
//  InformationMessageCell.swift
//  hw_03
//
//  Created by Takashima on 2017/06/22.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class InformationMessageCell: UITableViewCell {
    @IBOutlet weak var messageText: UITextView!
    
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

        self.messageText.delegate = self
    }
    
    private func setupAddress() {
        messageText.rx.text.changed
            .subscribe(onNext: { [weak self] message in
                self?.presenter.message.value = message!
                }
            ).addDisposableTo(disposeBag)
    }
}

extension InformationMessageCell: UITextViewDelegate {
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        presenter.scrollUpView()
        
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        presenter.scrollDownView()
        
        return true
    }
}
