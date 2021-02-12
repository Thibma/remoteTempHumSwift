//
//  TemperatureHumidityFactory.swift
//  remoteTemperature
//
//  Created by Thibault BALSAMO on 12/02/2021.
//

import Foundation

class TemperatureHumidityFactory {
    
    static func tempHumFrom(dictionnary: [String: Any]) -> TemperatureHumidity? {
        
        guard let temperature = dictionnary["temperature"] as? Int,
              let humidity = dictionnary["humidity"] as? Int else {
            return nil
        }
        
        return TemperatureHumidity(temperature: temperature, humidity: humidity)
        
    }
    
}
