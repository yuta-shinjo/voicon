//
//  ContentView.swift
//  voicon
//
//  Created by 新庄勇太 on 2022/12/04.
//

import SwiftUI
import AVKit

struct ContentView: View {
    let spots = ["東京都美術館","国立新美術館","国立近代美術館","東京国立博物館","江戸東京博物館","国立科学博物館","新江ノ島水族館","川崎水族館","しながわ水族館"]
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { name in
                    Text(name)
                }
            }
            .searchable(text: $searchText, prompt: "動画を検索")
            .keyboardType(.default)
            .navigationTitle("人気の動画")
        }
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return spots
        } else {
            return spots.filter{ $0.contains(searchText) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
