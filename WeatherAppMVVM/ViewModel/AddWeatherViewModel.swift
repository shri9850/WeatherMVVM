//
//  AddWeatherViewModel.swift
//  WeatherAppMVVM
//
//  Created by shree on 23/01/22.
//

import Foundation
class AddWeatherViewModel {
    
    func addWeatherCity(cityName: String, completion: @escaping(WeatherViewModel)->()){
        let url = Constants.URLS.stringToUrl(city: cityName)
        let resources = Resources<WeatherResponses>(url: url) { safeData in
            print("SafeData1 \(safeData)")
            let encodedData = try? JSONDecoder().decode(WeatherResponses.self, from: safeData)
            return encodedData
        }
        WebServices().load(resources: resources) { (encodedData) in
            guard let safeData = encodedData else{ return }
            let vm = WeatherViewModel(weather: safeData)
            completion(vm)
        }
    }
}
