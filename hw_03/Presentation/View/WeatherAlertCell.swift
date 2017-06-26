//
//  WeatherAlertCell.swift
//  hw_03
//
//  Created by Takashima on 2017/06/21.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class WeatherAlertCell: UITableViewCell {
    @IBOutlet weak var alertButton: SystemButton!
    
    var presenter: WeatherPresenter! {
        didSet {
            update()
        }
    }
    private var disposeBag: DisposeBag = DisposeBag()
    
    func update() {
        setupAlertButton()
    }
    
    private func setupAlertButton() {
        alertButton.rx.tap
            .subscribe(
                onNext: { [weak self] in
                    self?.presenter.presentAlert()
                }
            ).addDisposableTo(disposeBag)
    }
}
