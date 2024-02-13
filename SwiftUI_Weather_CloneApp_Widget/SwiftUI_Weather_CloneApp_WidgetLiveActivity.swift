//
//  SwiftUI_Weather_CloneApp_WidgetLiveActivity.swift
//  SwiftUI_Weather_CloneApp_Widget
//
//  Created by 이정호 on 2024/02/13.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct SwiftUI_Weather_CloneApp_WidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct SwiftUI_Weather_CloneApp_WidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SwiftUI_Weather_CloneApp_WidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension SwiftUI_Weather_CloneApp_WidgetAttributes {
    fileprivate static var preview: SwiftUI_Weather_CloneApp_WidgetAttributes {
        SwiftUI_Weather_CloneApp_WidgetAttributes(name: "World")
    }
}

extension SwiftUI_Weather_CloneApp_WidgetAttributes.ContentState {
    fileprivate static var smiley: SwiftUI_Weather_CloneApp_WidgetAttributes.ContentState {
        SwiftUI_Weather_CloneApp_WidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: SwiftUI_Weather_CloneApp_WidgetAttributes.ContentState {
         SwiftUI_Weather_CloneApp_WidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: SwiftUI_Weather_CloneApp_WidgetAttributes.preview) {
   SwiftUI_Weather_CloneApp_WidgetLiveActivity()
} contentStates: {
    SwiftUI_Weather_CloneApp_WidgetAttributes.ContentState.smiley
    SwiftUI_Weather_CloneApp_WidgetAttributes.ContentState.starEyes
}
