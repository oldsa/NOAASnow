//
//  ForecastDetail.swift
//  NOAASnow
//
//  Created by Tony Olds on 3/16/22.
//

import SwiftUI


struct ForecastDetail: View {
    
    @ObservedObject var resort : Resort
    
    var body: some View {
        VStack {
            Text(resort.name)
            if(resort.isLoading)
            {
                ProgressView()
            } else {
                if let periods = resort.forecast?.properties.periods {
                    ForEach(periods) { period in                        
                        ForecastPeriodView(forecastPeriod: period)                            
                    }
                } else {
                    Text("Unable to load weather Info")
                }

            }
        }

    }
}

struct ForecastDetail_Previews: PreviewProvider {
    static var resort = Resort(name: "A Basin", code: "BOU/31,59/forecast")
    static var previews: some View {
        ForecastDetail(resort: resort)
            .onAppear {
                NOAAService().pullWeather(resortCode: resort.code, onCompletion: resort.receivedForecast(newForecast:error:))
            }
    }
}
