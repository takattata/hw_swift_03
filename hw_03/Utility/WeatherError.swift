//
//  WeatherError.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation

enum WeatherAppError: Error {
    case generic
    case network
    case noParameter
    
    func message() -> String {
        switch self {
        case .network:
            return "サーバーからデータの取得に失敗しました"
        case .noParameter:
            return "パラメータないっすよ"
        default:
            return "アプリのエラーです"
        }
    }
}
