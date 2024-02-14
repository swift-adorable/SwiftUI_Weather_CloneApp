//
//  WeatherEntryView.swift
//  SwiftUI_Weather_CloneApp_WidgetExtension
//
//  Created by 이정호 on 2024/02/13.
//

import SwiftUI
import WidgetKit

struct WeatherEntryView: View {
        
    var entry: Provider.Entry
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(colors: [.indigo, .white],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            
            VStack(alignment: .leading) {
                Text(entry.widgetData.location)
                
                Text(entry.widgetData.temperature)
                    .font(.largeTitle)
                
                Spacer()
                
                Image(systemName: entry.widgetData.icon)
                    .symbolRenderingMode(.multicolor)
                    .font(.subheadline)
                Text(entry.widgetData.weather)
                    .font(.subheadline)
                
                Text("Max: \(entry.widgetData.maxTemperature) Min: \(entry.widgetData.minTemperature)")
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .foregroundColor(.white)
            .padding()

        }
    }
}

//#Preview {
//    WeatherEntryView(entry: Provider.Entry(widgetData: .preview))
//        .previewContext(WidgetPreviewContext(family: .systemSmall))
//}

@available(iOS 17.0, *)
#Preview("SwiftUI_Weather_CloneApp_Widget", as: .systemSmall) {
    SwiftUI_Weather_CloneApp_Widget()
} timeline: {
    WeatherEntry(widgetData: WidgetData.preview)
}
