//
//  CodableCurrentWeather.swift
//  SwiftUI_Weather_CloneApp
//
//  Created by 이정호 on 2024/02/06.
//

import Foundation

struct CodableCurrentWeather: Codable {
    let dt: Double
    
    let weather: [Weather]
    
    let main: Main
    
    let sys: Sys
}

extension CodableCurrentWeather { 
    
    struct Weather: Codable {
        let description: String
        let icon: String
    }
    
    struct Main: Codable {
        let temp: Double
        let temp_min: Double
        let temp_max: Double
    }
    
    struct Sys: Codable {
        let sunrise: Double
        let sunset: Double
    }
}

