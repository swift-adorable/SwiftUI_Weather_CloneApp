//
//  WeatherService.swift
//  SwiftUI_Weather_CloneApp
//
//  Created by 이정호 on 2024/01/30.
//

import Foundation
import CoreLocation

class WeatherService: NSObject, ObservableObject {
    
    static let apiKey = "f0ac151e971cb2736f5bc8bc858301cd"
    
    let locationManager: CLLocationManager
    
    @Published var currentLocation: String?
    
    @Published var currentWeather: CurrentWeather?
    @Published var forecastList: [Forecast]?
    
    @Published var lastError: String?
    
    @Published var updating: Bool
    
    let isPreviewServiece: Bool
    
    init(preview: Bool = false) {
        isPreviewServiece = preview
        
        updating = false
        
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
    
    func fetch() {
        guard isPreviewServiece == false else { return }
        
        updating = true
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        case .denied, .restricted:
            lastError = "위치 서비스 사용 권한이 없습니다."
            updating = false
        default:
            lastError = "알 수 없는 에러가 발생했습니다."
            updating = false
        }
        
    }
}
