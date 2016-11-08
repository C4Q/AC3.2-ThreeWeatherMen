//
//  APIRequestManager.swift
//  ThreeWeatherManSeeTheFuture
//
//  Created by Tong Lin on 11/7/16.
//  Copyright © 2016 Tong Lin. All rights reserved.
//

import Foundation

internal class APIRequestManager{
    
    internal static let manager: APIRequestManager = APIRequestManager()
    init () {}
    
    func getWeatherData(apiKey key: String, zip: String, callback: @escaping ((Data?)->Void)) {
        let url: URL = URL(string: "http://api.openweathermap.org/data/2.5/weather?appid=\(key)&zip=\(zip),us")!
        
        let session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
        
        session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil{
                print("URL error here: \(error!)")
            }
            
            if data != nil{
                print("got data!!!!")
                callback(data)
            }
            
        }.resume()
    }
    
    func getPicture(weathertype: String, callback: @escaping (Data?) -> Void) {
        
        let myURL: URL = URL(string: "http://loremflickr.com/320/240/\(weathertype)")!
        
        let session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: myURL) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print("Error during session: \(error!)")
            }
            guard let validData = data else { return }
            callback(validData)
            }.resume()
    }
    
}
