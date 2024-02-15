//
//  FileManager+SharedContainer.swift
//  SwiftUI_Weather_CloneApp
//
//  Created by 이정호 on 2024/02/15.
//

import Foundation

extension FileManager {
    static var sharedContainerURL: URL {
        return FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.sensei.lee.SwiftUI-Weather-CloneApp.contents")!
    }
}
