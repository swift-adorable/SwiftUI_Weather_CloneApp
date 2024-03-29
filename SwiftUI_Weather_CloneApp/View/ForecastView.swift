//
//  ForecastView.swift
//  SwiftUI_Weather_CloneApp
//
//  Created by 이정호 on 2024/01/24.
//

import SwiftUI

struct ForecastView: View {
    @EnvironmentObject var service: WeatherService
    
    var body: some View {
        ForEach(service.forecastList ?? []) { forecast in
            HStack {
                VStack(alignment: .leading) {
                    Text(forecast.date)
                    Text(forecast.time)
                }.font(.caption)
                Spacer()
                
                Image(systemName: forecast.icon)
                    .font(.title3)
                    .symbolRenderingMode(.multicolor)
                
                Text(forecast.weather)
                    .font(.title3)
                
                Spacer()
                
                Text(forecast.temperature)
                    .font(.system(size: 40))
                    .fontWeight(.ultraLight)
                    .frame(minWidth: 70, alignment: .trailing)
            }
            .foregroundColor(.white)
            .padding(.horizontal)
        }
    }
}

#Preview {
    VStack {
        ForecastView()
    }
    .preferredColorScheme(.dark)
    .environmentObject(WeatherService.preview)
}

//struct ForecastView_Previews: PreviewProvider {
//    static var previews: some View {
//        ForecastView()
//            .preferredColorScheme(.dark)
//    }
//}
