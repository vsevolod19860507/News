//
//  NewsApp.swift
//  News
//
//  Created by Vsevolod on 20.08.2022.
//

import SwiftUI

@main
struct NewsApp: App {
    @ObservedObject var monitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            if monitor.isConnected {
                NewsListView()
            } else {
                Text("Check Internet Connection!")
                    .font(.largeTitle)
                    .foregroundColor(.red)
            }
        }
    }
}
