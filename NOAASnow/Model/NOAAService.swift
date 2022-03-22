//
//  NOAAService.swift
//  NOAASnow
//
//  Created by Tony Olds on 3/16/22.
//

import Foundation

public class NOAAService {
    
    let BASE_URL = "https://api.weather.gov/gridpoints/"
    
    func pullWeather(resortCode: String, onCompletion: @escaping(Forecast?, Error?) -> ())
    {
        if let url = URL(string: BASE_URL + resortCode)
        {
            URLSession.shared.dataTask(with: URLRequest(url:url), completionHandler: { (data, response, error) in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let forecastData = try decoder.decode(Forecast.self, from: data)
                        onCompletion(forecastData, error)
                    } catch {
                        print("Couldnt parse jsone response as \(Forecast.self):\n\(error)")
                        onCompletion(nil, error)
                    }
                }
            }).resume()
        }
        
    }
}
