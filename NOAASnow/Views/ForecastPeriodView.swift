//
//  ForecastPeriodView.swift
//  NOAASnow
//
//  Created by Tony Olds on 3/21/22.
//

import SwiftUI

struct ForecastPeriodView: View {
    
    var forecastPeriod : ForecastPeriod
    
    @State private var isFocused = false
    
    var body: some View {
        
        HStack {
            ZStack {
                AsyncImage(url: URL(string: forecastPeriod.largeIcon)!)
                Text(forecastPeriod.name)
                    .lineLimit(2)
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
            }.frame(width: 150)
            Text(forecastPeriod.detailedForecast)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.leading)
        }
        .frame(minWidth: 100)
        .padding()
        .focusable(true) { newState in isFocused = newState }
        .border(isFocused ? Color.white : Color.clear)
    }
    
}

struct ForecastPeriodView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastPeriodView(forecastPeriod: ForecastPeriod(number: 0, name: "Monday", detailedForecast: "Snow likely. Mostly cloudy. High near 30, with temperatures falling to around 26 in the afternoon. Northeast wind around 10 mph, with gusts as high as 16 mph. Chance of precipitation is 60%. New snow accumulation of 1 to 3 inches possible", icon: "https://api.weather.gov/icons/land/day/snow,60?size=large"))
    }
}
