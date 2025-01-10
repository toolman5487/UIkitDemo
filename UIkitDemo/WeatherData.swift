//
//  WeatherData.swift
//  UIkitDemo
//
//  Created by Willy Hsu on 2025/1/9.
//

import Foundation
struct API_URL {
    
    var forecast: Bool
    var API_key: String = "37a9a30bf0bea09f0dd564539813d064"
    var lat: Double
    var lon: Double
    
    var concatURL: String {
        
        switch forecast {
        case true:
            //預測後五天
            let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=\(API_key)&units=metric"
            return urlString
        default:
            let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(API_key)&units=metric"
            return urlString
        }
    }
}

struct CurrentWeather: Codable {
    
    let weather: [Weather] //JSON的這裡還有包一個[]
    let main: Temp
    
    struct Weather: Codable {
        let main: String
    }

    struct Temp: Codable {
        let temp: Double
        let temp_min: Double
        let temp_max: Double
    }
}

struct ForecastWeather: Codable {
    let list: [WeatherList]
}
    
struct WeatherList: Codable {
    var main: Temp
    var weather: [Weather]
    var dt_txt: String
    
    struct Temp: Codable {
        var temp: Double
        var temp_min: Double
        var temp_max: Double
    }

    struct Weather: Codable {
        var main: String
    }

}
