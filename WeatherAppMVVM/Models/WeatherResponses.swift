//
//  WeatherResponses.swift
//  WeatherAppMVVM
//
//  Created by shree on 23/01/22.
//

import Foundation
struct Weather: Codable {
    let temp: Double
    let humidity: Double
}

struct WeatherResponses: Codable {
    let name: String
    let main: Weather
}
