//
//  ContentView.swift
//  NOAASnow
//
//  Created by Tony Olds on 3/16/22.
//

import SwiftUI

struct ContentView: View {
    @FocusState var focusedItem: Resort?
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        HStack
        {
            List {
                ForEach(viewModel.resortList) { resort in
                    Button(action: {}, label: {
                        Text(resort.name)
                    }).focused($focusedItem, equals: resort)
                }
            }.frame(width: 300, alignment: .leading)
            if let selectedResort = viewModel.selectedResort
            {
                ScrollView
                {
                    ForecastDetail(resort: selectedResort)
                        .frame(maxWidth: .infinity)
                }
            }
        }.onChange(of: focusedItem) { newFocus in
            if let newResortFocus = newFocus {
                viewModel.setSelectedResort(resort: newResortFocus)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
