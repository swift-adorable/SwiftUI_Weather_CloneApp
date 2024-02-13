//
//  WeatherService+Location.swift
//  SwiftUI_Weather_CloneApp
//
//  Created by 이정호 on 2024/01/30.
//

import Foundation
import CoreLocation

extension WeatherService: CLLocationManagerDelegate {
    
    @MainActor
    private func updateAddress(from location: CLLocation) async throws -> String {
        let geocoder = CLGeocoder()
        let placemarks = try await geocoder.reverseGeocodeLocation(location, preferredLocale: Locale(identifier: "Ko_kr"))
        guard let placemark = placemarks.first else { return "???" }
        
        guard let gu = placemark.locality, let dong = placemark.subLocality else {
            return placemark.name ?? "???"
        }
        
        return gu + " " + dong
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        case .notDetermined:
            lastError = "위치 서비스 사용 권한을 확인할 수 없습니다."
            updating = false
        case .denied, .restricted:
            lastError = "위치 서비스 사용 권한이 없습니다."
            updating = false
        default:
            lastError = "알 수 없는 오류가 발생했습니다."
            updating = false
        }
    }
    
    private func process(location: CLLocation) {
        guard isPreviewServiece == false else { return }
        
        Task {
            let updatedLocation = try await updateAddress(from: location)
            await fetchWeather(location: location)
            
            await MainActor.run {
                currentLocation = updatedLocation
                
                updating = false
            }
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        process(location: location)
        
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        manager.stopUpdatingLocation()
        lastError = error.localizedDescription
        updating = false
    }
    
}
