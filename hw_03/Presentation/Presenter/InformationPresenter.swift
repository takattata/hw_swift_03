//
//  InformationPresenter.swift
//  hw_03
//
//  Created by Takashima on 2017/06/22.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import RxSwift

protocol InformationPresenter {
    weak var view: InformationPresenterView? { get set }
    var name: Variable<String> { get set }
    var email: Variable<String> { get set }
    var message: Variable<String> { get set }
    
    func setupUI()
    func sendInformation()
}

protocol InformationPresenterView: class {
    func setupNavigation(title: String)
    func seguePrefectureList()
}

class InformationPresenterImpl: InformationPresenter {
    weak var view: InformationPresenterView?
    //FIXME: これ必要ないのか?本来modalのみ.他の時、何に使ってるのかわかってない.
    var error: WeatherAppError?

    var name: Variable<String> = Variable<String>("")
    var email: Variable<String> = Variable<String>("")
    var message: Variable<String> = Variable<String>("")
    
    let useCase: InformationUseCase
    private let disposeBag: DisposeBag = DisposeBag()
    
    init(useCase: InformationUseCase) {
        self.useCase = useCase
    }
    
    func setupUI() {
        view?.setupNavigation(title: "お問い合わせ")
    }
    
    func sendInformation() {
        useCase.sendInformation(name: name.value, email: email.value, message: message.value)
            .subscribe(
                onNext: nil,
                onError: { [weak self] error in
                    //FIXME: 仮 確認用.
                    self?.errorHandling(error: error)
                }, onCompleted: { [weak self] value in
                    self?.view?.seguePrefectureList()
                }, onDisposed: nil)
            .addDisposableTo(disposeBag)
    }
    
    private func errorHandling(error: Error) {
        DispatchQueue.main.async { [weak self] in
            if let error: WeatherAppError = error as? WeatherAppError {
                self?.error = error
            }
            
//FIXME:            error.presentModal(handler: nil)
        }
    }
}
