//
//  NewsListView.swift
//  News
//
//  Created by Vsevolod on 20.08.2022.
//

import SwiftUI

struct NewsListView: View {
    @StateObject private var newsViewModel = NewsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $newsViewModel.searchFilter)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(.gray.opacity(0.2))
                
                List(newsViewModel.news) { new in
                    NavigationLink {
                        NewsWebView(url: new.url)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        NewsListRowView(newsModel: new)
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .refreshable {
                    newsViewModel.fetchNews()
                    newsViewModel.searchFilter = ""
                }
                
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(.stack)
        .alert("Error", isPresented: $newsViewModel.hasError) {
            Button("OK", role: .cancel) { }
        }
        .task {
            newsViewModel.fetchNews()
        }
    }
}

struct NewsListIView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
        
    }
}
