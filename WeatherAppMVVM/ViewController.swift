//
//  ViewController.swift
//  WeatherAppMVVM
//
//  Created by shree on 23/01/22.
//

import UIKit

class ViewController: UIViewController {
    private var weatherListVm: WeatherListViewModel = WeatherListViewModel()
    @IBOutlet private weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func addAction(_ sender: UIBarButtonItem){
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddWeatherViewController") as? AddWeatherViewController else { return }
        vc.weatherClosure = { [weak self] weatherVm in
            self?.weatherListVm.addWeather(weatherVm: weatherVm)
            print("Weather View Model \(weatherVm)")
            self?.reloadTableView()
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction private func seetingBtnAction(_ sender: UIButton){
        guard let settingVC = self.storyboard?.instantiateViewController(withIdentifier: "SettingViewController")as? SettingViewController else { return  }
        settingVC.settingClouser = {[weak self] settingVm in
            print("Setting VM \(settingVm)")
            self?.weatherListVm.updateUnit(to: settingVm.selectedUnit)
            self?.reloadTableView()
        }
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
    private func reloadTableView(){
        DispatchQueue.main.async {
            self.tblView.reloadData()
        }
    }
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let weatherVM = weatherListVm.weatherAtIndex(index: indexPath.row)
        cell.textLabel?.text = weatherVM.city
        cell.detailTextLabel?.text = weatherVM.temprature.doubleToString()
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListVm.noOfRows
    }
}
