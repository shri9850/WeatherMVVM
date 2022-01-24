//
//  WeatherListViewModel.swift
//  WeatherAppMVVM
//
//  Created by shree on 23/01/22.
//

import Foundation
class WeatherViewModel {
    let weather: WeatherResponses
    var temprature: Double
    init(weather: WeatherResponses){
        self.weather = weather
        self.temprature = weather.main.temp
    }
    
    var city: String{
        return weather.name
    }
}

class WeatherListViewModel {
    var weatherList : [WeatherViewModel] = [WeatherViewModel]()
    
    var noOfRows: Int{
        return weatherList.count
    }
    func  addWeather(weatherVm: WeatherViewModel) {
        self.weatherList.append(weatherVm)
    }
    func weatherAtIndex( index: Int) -> WeatherViewModel {
        return weatherList[index]
    }
    
    func updateUnit(to unit: Unit){
        switch unit {
        case .celsius:
            toCelsius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
    private func toCelsius() {
        
        weatherList = weatherList.map { vm in
            let weatherModel = vm
            weatherModel.temprature = (weatherModel.temprature - 32) * 5/9
            return weatherModel
        }
        
    }
    
    private func toFahrenheit() {
        
        weatherList = weatherList.map { vm in
            let weatherModel = vm
            weatherModel.temprature = (weatherModel.temprature * 9/5) + 32
            return weatherModel
        }
    }
}
