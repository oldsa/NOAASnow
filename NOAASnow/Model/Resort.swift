//
//  Resort.swift
//  NOAASnow
//
//  Created by Tony Olds on 3/16/22.
//

import Foundation

class Resort: ObservableObject, Identifiable, Hashable {
    
    init(name: String, code: String)
    {
        self.name = name
        self.code = code
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Resort, rhs: Resort) -> Bool {
        return lhs.id == rhs.id
    }
    
    func receivedForecast(newForecast: Forecast?, error: Error?)
    {
        DispatchQueue.main.async {
            self.forecast = newForecast
            self.isLoading = false
        }
    }
    
    var id = UUID()
    
    var name : String
    var code : String
    
    @Published var forecast : Forecast?
    @Published var isLoading = false
}
