//
//  APIEndpoint.swift
//  WeatherAppSwiftUI
//
//  Created by Khondwani Sikasote on 2024/08/18.
//

import Foundation

enum APIEndpoint {
    static let baseURL = "https://api.openweathermap.org"
    case coordinatesByLocationName(String)
    case weatherByLatLng(Double, Double)
    
    private var path: String { // not exposed outside of the class
        switch self {
           case .coordinatesByLocationName(let city):
                return "/geo/1.0/direct?q=\(city)&appid=\(Constants.Keys.weatherAPIKey)"
           case .weatherByLatLng(let lat, let lon):
            return "/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(Constants.Keys.weatherAPIKey)"
            
        }
    }
    
    static func endPointURL(for endpoint: APIEndpoint) -> URL{
        let endpointPath = endpoint.path
        return URL(string: baseURL + endpointPath)!
    }
}
