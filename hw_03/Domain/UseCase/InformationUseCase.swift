//
//  InformationUseCase.swift
//  hw_03
//
//  Created by Takashima on 2017/06/22.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import RxSwift

protocol InformationUseCase {
    func sendInformation(name: String?, email: String?, message: String?) -> Observable<Void>
}

struct InformationUseCaseImpl: InformationUseCase {
    let repository: InformationRepository
    
    init(repository: InformationRepository) {
        self.repository = repository
    }
    
    func sendInformation(name: String?, email: String?, message: String?) -> Observable<Void> {
        return repository.sendInformation(name: name,email: email, message: message)
            .map { _ in }
    }
}
