//
//  CurrentWeatherView.swift
//  SwiftUI_Weather_CloneApp
//
//  Created by 이정호 on 2024/01/24.
//

import SwiftUI

struct CurrentWeatherView: View {
    let model: CurrentWeather?
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            if let model = model {
                HStack {
                    Image(systemName: model.icon)
                        .symbolRenderingMode(.multicolor)
                    Text(model.weather)
                }
                .font(.largeTitle)
                
                HStack(spacing: 20) {
                    Label(model.maxTemperature, systemImage: "arrow.up")
                    Label(model.minTemperature, systemImage: "arrow.down")
                }
                
                HStack(alignment: .lastTextBaseline) {
                    Text(model.temperature)
                        .font(.system(size: 120))
                        .fontWeight(.ultraLight)
                        .minimumScaleFactor(0.5)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "sunrise.fill")
                            .symbolRenderingMode(.multicolor)
                        Text(model.sunrise)
                        
                        Image(systemName: "sunset.fill")
                            .symbolRenderingMode(.multicolor)
                        Text(model.sunset)
                    }
                    .font(.caption)
                }
            }
        }
        .foregroundColor(.white)
        .padding(.horizontal)
    }
}

#Preview {
    CurrentWeatherView(model: .preview)
}
