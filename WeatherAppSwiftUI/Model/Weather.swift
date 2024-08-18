//
//  Weather.swift
//  WeatherAppSwiftUI
//
//  Created by Khondwani Sikasote on 2024/08/17.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double 
}
