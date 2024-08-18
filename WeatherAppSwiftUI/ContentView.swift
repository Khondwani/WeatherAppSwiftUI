//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Khondwani Sikasote on 2024/08/15.
//

import SwiftUI

struct ContentView: View {
    
    @State private var city:String = ""
    @State private var isFetchingWeather: Bool = false
    
    let geocodingClient = GeocodingClient()
    let weatherClient = WeatherClient()
    
    @State private var weather: Weather?
    
    private func fetchWeather() async {
        do {
            guard let location = try await geocodingClient.coordinateByCity(city) else { return }
            weather = try await weatherClient.fetchWeather(location: location)
        } catch {
            print(error)
        }
    }
    var body: some View {
        VStack {
            TextField("City", text: $city).textFieldStyle(.roundedBorder).onSubmit {
                isFetchingWeather = true // to make sure that the task is not running forever even after we have left the screen
            }.task(id: isFetchingWeather) { // FOR WORKING WITH ASYNC TASKS
                if isFetchingWeather {
                   await fetchWeather()
                    isFetchingWeather = false
                    city = ""
                }
                
            }
            Spacer()
            if let weather {
                Text(MeasurementFormatter.temperature(value: weather.temp)).font(.system(size: 100))
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
