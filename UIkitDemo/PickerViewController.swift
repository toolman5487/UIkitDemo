//
//  PickerViewController.swift
//  UIkitDemo
//
//  Created by Willy Hsu on 2025/1/7.
//

import UIKit

class PickerViewController: UIViewController {
    
    @IBOutlet weak var theLabel: UILabel!
    let continents: [String] = ["選擇居住區域", "North America", "South America", "Europe", "Asia", "Africa"]
    let allCountries: [String: [String]] = [
        "選擇居住區域": ["選擇居住國家"],
        "North America": ["Canada", "Mexico", "United States"],
        "South America": ["Brazil"],
        "Europe": ["France", "Germany", "United Kingdom"],
        "Asia": ["Japan", "China", "Vietnam", "Indonesia"],
        "Africa": ["South Africa"]
    ]
    
    var selectedContinent: String = "選擇居住區域"
    var countries: [String] = ["選擇居住國家"]
    
    @IBOutlet weak var thePickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thePickerView.dataSource = self
        thePickerView.delegate = self
    }
}

extension PickerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return continents.count
        case 1:
            return countries.count
        default:
            return 0
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return continents[row]
        case 1:
            return countries[row]
        default:
            return ""
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            selectedContinent = continents[row]
            countries = allCountries[selectedContinent] ?? ["選擇居住國家"]
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: true)
        }
        
        let selectedCountryRow = pickerView.selectedRow(inComponent: 1)
        let selectedCountry = countries[selectedCountryRow]
        
        theLabel.text = "\(selectedContinent) 的 \(selectedCountry) 人"
    }
    
    
}
