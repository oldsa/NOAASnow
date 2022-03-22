//
//  ViewModel.swift
//  NOAASnow
//
//  Created by Tony Olds on 3/16/22.
//

import Foundation

let resortDictionary = ["A Basin" : "BOU/31,59/forecast",
                        "Copper" : "BOU/21,52/forecast",
                        "Winter Park" : "BOU/35,69/forecast",
                        "Eldora" : "BOU/43,72/forecast"]

class ViewModel : ObservableObject {
    
    @Published var resortList : [Resort]
    @Published var selectedResort : Resort? = nil
    
    init() {
        var resorts = [Resort]()
        for resortInfo in resortDictionary {
            resorts.append(Resort(name: resortInfo.key, code: resortInfo.value))
        }
        resortList = resorts
    }
    
    func setSelectedResort(resort: Resort)
    {
        selectedResort = resort
        pullForecast(resort: resort)
    }
    
    func pullForecast(resort: Resort)
    {
        resort.isLoading = true
        NOAAService().pullWeather(resortCode: resort.code, onCompletion: resort.receivedForecast(newForecast:error:))
    }
    
}
