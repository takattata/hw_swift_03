//
//  PrefectureListCell.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import UIKit
//import BonMot

class PrefectureListCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    var viewModel: PrefectureViewModelProtocol! {
        didSet {
            update()
        }
    }
    
    private func update() {
        let name: String = viewModel.name()
        let string = name.withNormalStyle(ofSize: 16)
        nameLabel.attributedText = string
        nameLabel.lineBreakMode = .byTruncatingTail
    }
}
