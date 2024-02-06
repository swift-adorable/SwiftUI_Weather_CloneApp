//
//  CurrentWeather.swift
//  SwiftUI_Weather_CloneApp
//
//  Created by 이정호 on 2024/01/22.
//

import Foundation

struct CurrentWeather {
    let icon: String
    let weather: String
    let temperature: String
    let maxTemperature: String
    let minTemperature: String
    let sunrise: String
    let sunset: String
    let forecatedDate: Date
}

extension CurrentWeather {
    static var preview: CurrentWeather {
        return CurrentWeather(icon: "sun.max.fill",
                              weather: "맑음",
                              temperature: Double.randomTemperatureString,
                              maxTemperature: Double.randomTemperatureString,
                              minTemperature: Double.randomTemperatureString,
                              sunrise: "오전 06:18",
                              sunset: "오후 05:27",
                              forecatedDate: .now)
    }
    
    init?(data: CodableCurrentWeather) {
        guard let weatherInfo = data.weather.first else { return nil }
        icon = weatherInfo.icon.weatherImageName
        
        weather = weatherInfo.description
        temperature = data.main.temp.temperatureString
        minTemperature = data.main.temp_min.temperatureString
        maxTemperature = data.main.temp_max.temperatureString
        
        var date = Date(timeIntervalSince1970: data.sys.sunrise)
        sunrise = date.formatted(.dateTime.hour().minute())
        
        date = Date(timeIntervalSince1970: data.sys.sunset)
        sunset = date.formatted(.dateTime.hour().minute())
        
        forecatedDate = Date(timeIntervalSince1970: data.dt)
    }
}
