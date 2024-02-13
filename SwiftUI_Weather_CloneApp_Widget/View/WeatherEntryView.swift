//
//  WeatherEntryView.swift
//  SwiftUI_Weather_CloneApp_WidgetExtension
//
//  Created by 이정호 on 2024/02/13.
//

import SwiftUI

struct WeatherEntryView: View {
    var entry: Provider.Entry
    
    var body: some View {
        EmptyView()
    }
}

#Preview {
    WeatherEntryView(entry: Provider.Entry(widgetData: .preview))
}
