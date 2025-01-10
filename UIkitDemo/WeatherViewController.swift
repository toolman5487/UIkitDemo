//
//  WeatherViewController.swift
//  UIkitDemo
//
//  Created by Willy Hsu on 2025/1/9.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var nowHighTempLabel: UILabel!
    @IBOutlet weak var nowLowTempLabel: UILabel!
    @IBOutlet weak var nowWeatherLabel: UILabel!
    @IBOutlet weak var nowTempLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let dayUrlString = API_URL(forecast: false, lat: 25.087292, lon: 121.526838).concatURL
    let forecastUrlString = API_URL(forecast: true, lat: 25.087292, lon: 121.526838).concatURL
    var items = [WeatherList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchItems(forecast: true, urlString: forecastUrlString)
        fetchItems(forecast: false, urlString: dayUrlString)
        
    }
    
    func fetchItems(forecast: Bool, urlString: String){
        
        if let url = URL(string: urlString){
            URLSession.shared.dataTask(with: url) { data, response, error in
                let decoder = JSONDecoder()
                if let data {
                    do {
                        switch forecast{
                        case true:
                            let searchResponse = try decoder.decode(ForecastWeather.self, from: data)
                            self.items = searchResponse.list
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                            
                        default:
                            let searchResponse = try decoder.decode(CurrentWeather.self, from: data)
                            DispatchQueue.main.async {
                                self.nowWeatherLabel.text = searchResponse.weather.first?.main.description
                                self.nowTempLabel.text = self.tempFormat(c: searchResponse.main.temp, highLow: "now")
                                self.nowLowTempLabel.text = self.tempFormat(c: searchResponse.main.temp, highLow: "L")
                                self.nowHighTempLabel.text = self.tempFormat(c: searchResponse.main.temp, highLow: "H")
                            }
                        }
                    }catch{
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    func tempFormat(c: Double, highLow: String) -> String {
        var tempString = lroundf(Float(c)).description
        switch highLow{
        case "L": tempString = "L: \(tempString)°c"
        case "H": tempString = "H: \(tempString)°c"
        default: tempString = "\(tempString)°c"
        }
        
        return tempString
    }
    
}
extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "forecastTaleViewCell", for: indexPath) as? ForecastTableViewCell else {
            fatalError("dequeueReusableCell ForecastTableViewCell Failed")
        }
        let item = items[indexPath.row]
        let nowTime = item.dt_txt.description
        let startIndex = nowTime.index(nowTime.startIndex, offsetBy: 0)
        let middleIndex = nowTime.index(nowTime.startIndex, offsetBy: 11)
        let endIndex = nowTime.index(nowTime.endIndex, offsetBy: 0)
        
        cell.timeLabel.text = "\(nowTime[startIndex..<middleIndex])\n\(nowTime[middleIndex..<endIndex])"
        cell.weatherLabel.text = item.weather.first?.main.description
        cell.lowTempLabel?.text = tempFormat(c: item.main.temp_min, highLow: "L")
        cell.highTempLabel?.text = tempFormat(c: item.main.temp_max, highLow: "H")
        
        return cell
    }
}
