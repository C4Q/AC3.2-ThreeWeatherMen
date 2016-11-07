//
//  APIRequestManager.swift
//  ThreeWeatherManSeeTheFuture
//
//  Created by Tong Lin on 11/7/16.
//  Copyright © 2016 Tong Lin. All rights reserved.
//

import Foundation

class APIRequestManager{
    
    static let manager: APIWeatherError = APIWeatherError()
    init () {}
    
    func getWeatherData(apiKey key: String, callback: @escaping ((Data?)->Void)) {
        <#function body#>
    }
    
    
}
