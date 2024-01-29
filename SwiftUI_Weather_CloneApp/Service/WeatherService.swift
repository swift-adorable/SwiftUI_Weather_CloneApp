//
//  WeatherService.swift
//  SwiftUI_Weather_CloneApp
//
//  Created by 이정호 on 2024/01/30.
//

import Foundation
import CoreLocation

class WeatherService: NSObject, ObservableObject {
    let locationManager: CLLocationManager
    
    @Published var currentLocation: String?
    
    @Published var currentWeather: CurrentWeather?
    @Published var forecastList: [Forecast]?
    
    @Published var lastError: String?
    
    let isPreviewServiece: Bool
    
    init(preview: Bool = false) {
        isPreviewServiece = preview
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        
        super.init()
        
        locationManager.delegate = self
    }
    
    static var preview: WeatherService {
        let service = WeatherService(preview: true)
        service.currentLocation = "Gangnam Station"
        service.currentWeather = CurrentWeather.preview
        service.forecastList = Forecast.preview
        
        return service
    }
}
