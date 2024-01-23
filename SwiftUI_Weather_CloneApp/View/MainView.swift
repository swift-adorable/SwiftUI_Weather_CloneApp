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
            Image("background.image.weather")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .overlay {
                    Color.black.opacity(0.2)
                        .ignoresSafeArea()
            }
            VStack {
                Text("Hello, World!")
                    .font(.title2).bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                
                GeometryReader { reader in
                    ScrollView(showsIndicators: false) {
                        VStack {
                            Color.red
                            Color.yellow
                                .frame(height: 200)
                        }
                        .frame(height: reader.size.height)
                        
                        Spacer(minLength: reader.safeAreaInsets.bottom)
                        
                        Color.green
                            .frame(height: 1000)
                    }
                }
            }
            
        }
    }
}

#Preview {
    MainView()
}
