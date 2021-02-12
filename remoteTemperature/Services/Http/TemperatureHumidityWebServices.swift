//
//  TemperatureHumidityWebServices.swift
//  remoteTemperature
//
//  Created by Thibault BALSAMO on 12/02/2021.
//

import Foundation

class TemperatureHumidityWebServices {
    
    func getTempHum(completion: @escaping(TemperatureHumidity?) -> Void) {
        
        guard let url = URL(string: "http://10.33.3.10:3000/weather/last") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, res, err) in
            guard let bytes = data,
                  err == nil,
                  let json = try? JSONSerialization.jsonObject(with: bytes, options: .allowFragments) as? [String: Any] else {
                DispatchQueue.main.sync {
                    completion(nil)
                }
                return
            }
            guard let response = ApiResponseFactory.responseFrom(dictionnary: json),
                  response.error == false,
                  let getTemp = TemperatureHumidityFactory.tempHumFrom(dictionnary: response.message as! [String : Any]) else {
                DispatchQueue.main.sync {
                    completion(nil)
                }
                return
            }
            
            DispatchQueue.main.sync {
                completion(getTemp)
            }
        }
        task.resume()
    }
    
}
