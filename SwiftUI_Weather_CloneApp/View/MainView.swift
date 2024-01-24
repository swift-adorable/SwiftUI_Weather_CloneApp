//
//  MainView.swift
//  SwiftUI_Weather_CloneApp
//
//  Created by 이정호 on 2024/01/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            
            BackgroundView()
            
            WeatherContentView()
            
        }
    }
}

#Preview {
    MainView()
}
