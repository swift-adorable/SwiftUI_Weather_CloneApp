//
//  BackgroundView.swift
//  SwiftUI_Weather_CloneApp
//
//  Created by 이정호 on 2024/01/24.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        
        GeometryReader { reader in
            Image("background.image.weather")
                .resizable()
                .scaledToFill()
                .frame(width: reader.size.width)
                .ignoresSafeArea()
                .overlay {
                    Color.black.opacity(0.2)
                        .ignoresSafeArea()
            }
        }
        
    }
}

#Preview {
    BackgroundView()
}
