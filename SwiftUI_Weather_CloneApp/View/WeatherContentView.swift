//
//  WeatherContentView.swift
//  SwiftUI_Weather_CloneApp
//
//  Created by 이정호 on 2024/01/24.
//

import SwiftUI

struct WeatherContentView: View {
    var body: some View {
        
        VStack {
            Text("Hello, World!")
                .font(.title2).bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
            
            GeometryReader { reader in
                ScrollView(showsIndicators: false) {
                    VStack {
                        Color.clear
                        
                        CurrentWeatherView(model: .preview)
                    }
                    .frame(height: reader.size.height)
                    
                    Spacer(minLength: reader.safeAreaInsets.bottom)
                    
                    ForecastView()
                }
            }
        }
        
    }
}

#Preview {
    WeatherContentView()
        .preferredColorScheme(.dark)
}

//struct WeatherContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherContentView()
//            .preferredColorScheme(.dark)
//    }
//}
