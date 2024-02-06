//
//  ApiError.swift
//  SwiftUI_Weather_CloneApp
//
//  Created by 이정호 on 2024/02/06.
//

import Foundation

enum ApiError: Error {
    case unknown
    case invalidUrl(String)
    case invalidResponse
    case failed(Int)
    case emptyData
}
