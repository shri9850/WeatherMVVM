//
//  SettingViewController.swift
//  WeatherAppMVVM
//
//  Created by shree on 23/01/22.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet private weak var seetingTblView: UITableView!
    private var settingVm = SettingViewModel()
    var settingClouser: ((SettingViewModel)->())?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.seetingTblView.dataSource = self
        self.seetingTblView.delegate = self
        self.seetingTblView.reloadData()
        // Do any additional setup after loading the view.
    }
    @IBAction private func settingAction(_ sender: UIButton){
        settingClouser?(settingVm)
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension SettingViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = settingVm.unit[indexPath.row].displayName
        let settingItem = settingVm.unit[indexPath.row]
        if settingItem == settingVm.selectedUnit {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingVm.unit.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        let value = Unit.allCases[indexPath.row]
        settingVm.selectedUnit = value
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }
}
