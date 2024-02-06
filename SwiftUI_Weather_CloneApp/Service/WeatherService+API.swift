//
//  WeatherService+API.swift
//  SwiftUI_Weather_CloneApp
//
//  Created by 이정호 on 2024/02/06.
//

import Foundation
import CoreLocation

extension WeatherService {
    
    enum ApiType: String {
        case forecast
        case weather
    }
    
    func fetchWeather(location: CLLocation) async {
        
        do {
            let fetchedCurrentWeather: CodableCurrentWeather = try await fetch(type: .weather, location: location)
            currentWeather = CurrentWeather(data: fetchedCurrentWeather)
            print(currentWeather)
            
            let fetchedForecast: CodableForecast = try await fetch(type: .forecast, location: location)
            forecastList = fetchedForecast.list.compactMap { Forecast(data: $0) }
            print(fetchedForecast)
        } catch {
            lastError = "Api 요청 실패"
        }
        
    }
    
    private func fetch<T: Codable>(type: ApiType, location: CLLocation) async throws -> T {
         //https://api.openweathermap.org/data/2.5/weather?lat=&lon=&appid=
        var components = URLComponents(string: "https://api.openweathermap.org/data/2.5/\(type.rawValue)")
        
        components?.queryItems = [URLQueryItem(name: "appid", value: Self.apiKey),
                                  URLQueryItem(name: "units", value: "metric"),
                                  URLQueryItem(name: "lang", value: "kr"),
                                  URLQueryItem(name: "lat", value: "\(location.coordinate.latitude)"),
                                  URLQueryItem(name: "lon", value: "\(location.coordinate.longitude)")]
        
        guard let url = components?.url else {
            throw ApiError.invalidUrl(components?.host ?? "")
        }
        print(url.absoluteString)
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.invalidResponse
        }
        
        guard httpResponse.statusCode == 200 else {
            throw ApiError.failed(httpResponse.statusCode)
        }
        
        let decoder = JSONDecoder()
        let result = try decoder.decode(T.self, from: data)
        
        return result
    }
}
