//
//  AddWeatherViewController.swift
//  WeatherAppMVVM
//
//  Created by shree on 23/01/22.
//

import UIKit

class AddWeatherViewController: UIViewController {
    @IBOutlet private weak var cityTxt: UITextField!
    var weatherClosure: ((WeatherViewModel)->())?
    private var addWeatherVM = AddWeatherViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction private func addBtnAction(_ sender: UIButton){
        guard let cityName = self.cityTxt.text else { return  }
        addWeatherVM.addWeatherCity(cityName: cityName) { (encodedData) in
            print("city add responses data \(encodedData)")
            self.weatherClosure?(encodedData)
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
