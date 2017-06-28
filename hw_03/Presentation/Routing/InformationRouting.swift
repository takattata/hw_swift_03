//
//  InformationRouting.swift
//  hw_03
//
//  Created by Takashima on 2017/06/22.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import UIKit

protocol InformationRouting: Routing {
    func seguePrefectureList()
    //FIXME: 名前長い方がいいのかなー.
    func close(sender: Any)
}

fileprivate extension Selector {
    static let tappedCloseButton =
        #selector(InformationRoutingImpl.close(sender:))
}

class InformationRoutingImpl: InformationRouting {
    weak var viewController: UIViewController? {
        didSet {
            viewController?.navigationItem.rightBarButtonItem =
                UIBarButtonItem(
                    barButtonSystemItem: .stop,
                    target: self,
                    action: Selector.tappedCloseButton
                )

        }
    }
    weak var prefectureListViewController: PrefectureListViewController?
    
    func seguePrefectureList() {
        viewController?.dismiss(animated: true) { [weak self] in
            //TODO: 今回の要件としては呼ぶ必要ないけど.
            self?.prefectureListViewController?.refreshData()
        }
    }
    
    @objc func close(sender: Any) {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
