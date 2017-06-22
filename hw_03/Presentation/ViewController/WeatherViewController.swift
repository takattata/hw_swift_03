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
    fileprivate enum Section: Int {
        case forecast
        case alert
    }
    fileprivate let CellNames: [String] = [
        "WeatherCell",
        "WeatherAlertCell"
    ]
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.separatorStyle = .none
            tableView.isScrollEnabled = false
        }
    }
    
    fileprivate var routing: WeatherRouting!
    fileprivate var weatherVM: WeatherViewModelProtocol! {
        didSet {
            tableView.reloadData()
        }
    }
    fileprivate var presenter: WeatherPresenter! {
        didSet {
            presenter.view = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VC::viewDidLoad")
        
        presenter.refreshData()
        presenter.setupUI()
    }
    
    func injection(presenter: WeatherPresenter, routing: WeatherRouting) {
        self.presenter = presenter
        self.routing = routing
    }
    
    func refreshData() {
        presenter.refreshData()
    }
}

extension WeatherViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return CellNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else {
            return UITableViewCell()
        }

        switch section {
        case .forecast:
            print("VC::tableView: cellForRowAt: .forecast")
            let cell: WeatherCell = tableView.dequeueReusableCell(withIdentifier: CellNames[section.rawValue], for: indexPath) as! WeatherCell
            cell.selectionStyle = .none
            if let viewModel = weatherVM {
                cell.viewModel = viewModel
            }
//            print("VC::loadWeatherVM: \(weatherVM.title())")
            return cell
        case .alert:
            let cell: WeatherAlertCell = tableView.dequeueReusableCell(withIdentifier: CellNames[section.rawValue], for: indexPath) as! WeatherAlertCell
            //FIXME: いる?
            cell.selectionStyle = .none
            return cell
        }
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
    func setupNavigation(title: String) {
        self.navigationItem.title = title
    }
    
    func loadWeatherVM(weatherVM: WeatherViewModel) {
        print("VC::loadWeatherVM: \(weatherVM.title())")
        self.weatherVM = weatherVM
    }
}
