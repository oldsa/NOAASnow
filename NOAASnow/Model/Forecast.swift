//
//  Forecast.swift
//  NOAASnow
//
//  Created by Tony Olds on 3/16/22.
//

import Foundation

struct Forecast: Codable
{
    var properties : Properties
}

struct Properties: Codable {
    var updated : String?
    var periods : [ForecastPeriod]
}

struct ForecastPeriod : Codable, Hashable, Identifiable {
    var id : Int {
        number
    }
    var number : Int
    var name : String
    var startTime : String?
    var endTime : String?
    var detailedForecast : String
    var icon : String
    var largeIcon : String {
        icon.replacingOccurrences(of: "medium", with: "large")
    }
}
