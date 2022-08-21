//
//  NewsViewModel.swift
//  News
//
//  Created by Vsevolod on 20.08.2022.
//

import Foundation

class NewsViewModel: ObservableObject {
    
    @Published var news: [NewsModel] = []
    @Published var hasError: Bool = false
    
    private var allNews: [NewsModel] = []
    
    var searchFilter: String = "" {
        didSet {
            news = allNews.filter { searchFilter == "" || $0.title.contains(searchFilter) }
        }
    }
    
    func fetchNews() {
        Task { @MainActor in
            do {
                allNews = try await NewsAPIMAnager.shared.fetchData()
                news = allNews
                hasError = false
            } catch {
                hasError = true
            }
        }
    }
}
