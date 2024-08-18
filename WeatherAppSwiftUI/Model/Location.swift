//
//  Location.swift
//  WeatherAppSwiftUI
//
//  Created by Khondwani Sikasote on 2024/08/17.
//

import Foundation


struct Location: Decodable { // Decodable is for changing JSON to the model we have created. Codable is for cocding our object to JSON
    let name: String
    let lat: Double
    let lon: Double
}
