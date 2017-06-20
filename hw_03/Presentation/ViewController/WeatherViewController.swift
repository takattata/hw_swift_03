//
//  WeatherViewController.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import UIKit

class WeatherViewController: UIViewController {
    fileprivate enum Cells: Int {
        case Forecast
        case Alert
    }
    fileprivate let CellNames: [String] = ["ForecastCell", "AlertCell"]
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.separatorStyle = .none
            tableView.isScrollEnabled = false
        }
    }
    
    fileprivate var routing: WeatherRouting!
    fileprivate var weatherVM: WeatherViewModelProtocol!
    fileprivate var presenter: WeatherPresenter! {
        didSet {
            presenter.view = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func injection(presenter: WeatherPresenter, routing: WeatherRouting) {
        self.presenter = presenter
        self.routing = routing
    }
}

extension WeatherViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.section
        let cell = tableView.dequeueReusableCell(withIdentifier: CellNames[index], for: indexPath)
        cell.selectionStyle = .none
//        cell.viewModel = weatherVM
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

extension WeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension WeatherViewController: WeatherPresenterView {
}
