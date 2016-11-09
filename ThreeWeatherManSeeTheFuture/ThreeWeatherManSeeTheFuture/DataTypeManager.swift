//
//  DataTypeManager.swift
//  ThreeWeatherManSeeTheFuture
//
//  Created by Tong Lin on 11/9/16.
//  Copyright © 2016 Tong Lin. All rights reserved.
//

import Foundation

internal class DataTypeManager{
    
    internal static let manager: DataTypeManager = DataTypeManager()
    init() {}
    
    func tempertureConversion(temperture temp: Double, tempType segmentIndex: Int) -> String?{
        switch segmentIndex {
        case 0:
            print("switch to Kelvin")
            return String(format: "%.1f", temp) + " K"
        case 1:
            print("switch to Fahrenheit")
            return String(format: "%.1f", ((temp - 273.15) * 9/5 + 32)) + " F"
        case 2:
            print("switch to Celsius")
            return String(format: "%.1f", (temp - 273.15)) + " C"
        default:
            print("no idea what's going on")
        }
        return nil
    }
    
    func timestampToString(unix a: Int) -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(a))
        
        let timePeriodFormatter = DateFormatter()
        timePeriodFormatter.dateFormat = "HH:mm"
        
        let finalTime = timePeriodFormatter.string(from: date)
        print(finalTime)
        
        return finalTime
    }
    
    
    
    
    
}
