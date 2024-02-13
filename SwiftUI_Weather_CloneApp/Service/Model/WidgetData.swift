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
    
}
