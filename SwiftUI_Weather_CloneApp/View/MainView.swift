//
//  MainView.swift
//  SwiftUI_Weather_CloneApp
//
//  Created by 이정호 on 2024/01/22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var service: WeatherService
    
    var body: some View {
        ZStack {
            
            BackgroundView()
            
            if service.updating {
                ProgressView()
            } else if let _ = service.lastError {
                ErrorView()
            } else {
                WeatherContentView()
            }
        }
        .animation(.easeInOut, value: service.updating)
        .onAppear {
            service.fetch()
        }
    }
}

#Preview {
    MainView()
        .environmentObject(WeatherService.preview)
}
