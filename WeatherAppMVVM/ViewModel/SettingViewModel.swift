//
//  SettingViewModel.swift
//  WeatherAppMVVM
//
//  Created by shree on 23/01/22.
//

import Foundation
enum Unit: String, CaseIterable{
    case celsius = "metric"
    case fahrenheit = "imperial"
}
extension Unit{
    var displayName: String{
        get{
            switch self {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}
class SettingViewModel {
    let unit = Unit.allCases
    var selectedUnit: Unit{
        get{
            let userDefaults = UserDefaults.standard
            var selectedUnit1 = ""
            if let unitValue = userDefaults.value(forKey: "unit") as? String{
                selectedUnit1 = unitValue
            }
            return Unit(rawValue: selectedUnit1)!
        }
        set{
            let userDefaults = UserDefaults.standard
            userDefaults.setValue(newValue.rawValue, forKey: "unit")
        }
    }
}
