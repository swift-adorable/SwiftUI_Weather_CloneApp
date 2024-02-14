//
//  SwiftUI_Weather_CloneApp_Widget.swift
//  SwiftUI_Weather_CloneApp_Widget
//
//  Created by 이정호 on 2024/02/13.
//

import WidgetKit
import SwiftUI

struct SwiftUI_Weather_CloneApp_WidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}

struct SwiftUI_Weather_CloneApp_Widget: Widget {
    let kind: String = "SwiftUI_Weather_CloneApp_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                WeatherEntryView(entry: entry)
                    .containerBackground(for: .widget) {
                        Color.black
                    }
            } else {
                WeatherEntryView(entry: entry)
            }
        }
        .configurationDisplayName("Weather Widget")
        .description("Check the current weather.")
        .supportedFamilies([.systemSmall])
    }
}

#Preview(as: .systemSmall) {
    SwiftUI_Weather_CloneApp_Widget()
} timeline: {
    WeatherEntry(widgetData: .preview)
}
