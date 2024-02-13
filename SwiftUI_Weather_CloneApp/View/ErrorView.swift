//
//  ErrorView.swift
//  SwiftUI_Weather_CloneApp
//
//  Created by 이정호 on 2024/02/08.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var service: WeatherService
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.circle")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            if let error = service.lastError {
                Text(error)
                    .padding()
                    .foregroundColor(.white)
            }
            
            Button {
                service.lastError = nil
                service.fetch()
            } label: {
                Text("reload")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ErrorView()
        .environmentObject(WeatherService.preview)
}
