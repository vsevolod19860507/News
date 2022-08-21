//
//  NewsAPIMAnager.swift
//  News
//
//  Created by Vsevolod on 20.08.2022.
//

import Foundation

class NewsAPIMAnager {
    
    static let shared = NewsAPIMAnager()
    
    private init() {}
    
    private let apiKey = "664b9afa830d477cbb0d9b25d6982c02"
    
    enum FetchError: Error {
        case badRequest
        case badJSON
    }
    
    func fetchData() async throws -> [NewsModel]  {
        let urlString = "https://newsapi.org/v2/top-headlines?country=ua&apiKey=\(apiKey)"
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: URL(string: urlString)!))
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badRequest }
        
        guard let newsDto = try? JSONDecoder().decode(NewsDTO.self, from: data) else { throw FetchError.badJSON }
        
        return newsDto.toModels()
    }
}
