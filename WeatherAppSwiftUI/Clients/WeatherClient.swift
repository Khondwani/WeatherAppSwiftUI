//
//  WeatherClient.swift
//  WeatherAppSwiftUI
//
//  Created by Khondwani Sikasote on 2024/08/18.
//

import Foundation

struct WeatherClient {
    func fetchWeather(location: Location) async throws -> Weather {
        let (data,response) = try await URLSession.shared.data(from: APIEndpoint.endPointURL(for: .weatherByLatLng(location.lat, location.lon)))
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return weather.main
    }
}
