//
//  WidgetData.swift
//  SwiftUI_Weather_CloneApp
//
//  Created by 이정호 on 2024/02/13.
//

import Foundation

struct WidgetData: Codable {
    let location: String
    let icon: String
    let weather: String
    let temperature: String
    let maxTemperature: String
    let minTemperature: String
    let date: Date
}

extension WidgetData {
    
    static let preview = WidgetData(location: "Seoul",
                                    icon: "sun.max.fill",
                                    weather: "Sunny",
                                    temperature: Double.randomTemperatureString,
                                    maxTemperature: Double.randomTemperatureString,
                                    minTemperature: Double.randomTemperatureString,
                                    date: .now)
    
    static let dataURL = FileManager.sharedContainerURL.appendingPathComponent("widgetData.json")
    
    static func write(location: String?, currentWeather: CurrentWeather?, forecast: [Forecast]?) {
        guard let location = location, let currentWeather = currentWeather, let forecast = forecast else {
            return
        }
        
        var list = [WidgetData]()
        
        let data = WidgetData(location: location,
                              icon: currentWeather.icon,
                              weather: currentWeather.weather,
                              temperature: currentWeather.temperature,
                              maxTemperature: currentWeather.maxTemperature,
                              minTemperature: currentWeather.minTemperature,
                              date: currentWeather.forecatedDate)
        
        list.append(data)
        
        list.append(contentsOf: forecast.map {
            WidgetData(location: location,
                                  icon: $0.icon,
                                  weather: $0.weather,
                                  temperature: $0.temperature,
                                  maxTemperature: $0.maxTemperature,
                                  minTemperature: $0.minTemperature,
                                  date: $0.forecatedDate)
        })
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(list)
            try data.write(to: dataURL)
        } catch {
            fatalError(error.localizedDescription)
        }
        
    }
    
    static func read() -> [WidgetData] {
        var list = [WidgetData]()
        
        guard let data = try? Data(contentsOf: dataURL) else {
            return list
        }
        
        do {
            let decoder = JSONDecoder()
            list = try decoder.decode([WidgetData].self, from: data)
            return list
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
}
