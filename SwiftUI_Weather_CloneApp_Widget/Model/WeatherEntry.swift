//
//  WeatherEntry.swift
//  SwiftUI_Weather_CloneApp
//
//  Created by 이정호 on 2024/02/13.
//

import Foundation
import WidgetKit

struct WeatherEntry: TimelineEntry {
    
    let widgetData: WidgetData
    
    var date: Date {
        widgetData.date
    }
    
}

