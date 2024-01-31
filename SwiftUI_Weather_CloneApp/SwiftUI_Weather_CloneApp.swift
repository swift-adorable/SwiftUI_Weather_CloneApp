//
//  SwiftUI_Weather_CloneApp.swift
//  SwiftUI_Weather_CloneApp
//
//  Created by 이정호 on 2024/01/22.
//

import SwiftUI

@main
struct SwiftUI_Weather_CloneApp: App {
    let service = WeatherService()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.dark)
                .environmentObject(service)
        }
    }
}
