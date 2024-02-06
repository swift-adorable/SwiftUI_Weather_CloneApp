//
//  CodableForecast.swift
//  SwiftUI_Weather_CloneApp
//
//  Created by 이정호 on 2024/02/07.
//

import Foundation

struct CodableForecast: Codable {
    let list: [Item]
    
}

extension CodableForecast {
    
    struct Item: Codable {
        let dt: Double
        
        let main: Main
        
        let weather: [Weather]
    }
    
}

extension CodableForecast {
    
    struct Main: Codable {
        let temp: Double
        let temp_min: Double
        let temp_max: Double
    }
    
    struct Weather: Codable {
        let description: String
        let icon: String
    }
    
}
