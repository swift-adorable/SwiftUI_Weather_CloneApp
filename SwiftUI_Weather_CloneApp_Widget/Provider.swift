//
//  Provider.swift
//  SwiftUI_Weather_CloneApp_WidgetExtension
//
//  Created by 이정호 on 2024/02/13.
//

import Foundation
import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> WeatherEntry {
        WeatherEntry(widgetData: .preview)
    }

    func getSnapshot(in context: Context, completion: @escaping (WeatherEntry) -> ()) {
        let entry = WeatherEntry(widgetData: .preview)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherEntry>) -> ()) {
        let entries = [WeatherEntry(widgetData: .preview)]
        
        let timeline = Timeline<WeatherEntry>(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
