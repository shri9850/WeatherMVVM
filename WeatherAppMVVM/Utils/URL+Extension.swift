//
//  URL+Extension.swift
//  WeatherAppMVVM
//
//  Created by shree on 23/01/22.
//

import Foundation
struct Constants {
    struct URLS {
        static func stringToUrl(city: String)-> URL{
            guard let url  = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=27649ff7147242d542223573418b27f2&units=imperial") else { fatalError()}
            return url
        }
    }
}
extension Double{
    func doubleToString()-> String{
        return String(format: "%.0f", self)
    }
}
