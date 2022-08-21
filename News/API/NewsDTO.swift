//
//  NewsDTO.swift
//  News
//
//  Created by Vsevolod on 20.08.2022.
//

import Foundation

struct NewsDTO: Decodable {
    let status: String
    let articles: [Article]
    
    func toModels() -> [NewsModel] {
        let result = articles.map { article -> NewsModel in
            let expectedFormat = Date.ISO8601FormatStyle()
            let date = try! Date(article.publishedAt, strategy: expectedFormat)

            let description = article.description ?? "" == "" ? nil: article.description

            return NewsModel(title: article.title, description: description, source: article.source.name, date: date, url: article.url, imageUrl: article.urlToImage)
        }
        
        return result
    }
}

struct Article: Decodable {
    let source: Source
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Decodable {
    let name: String
}
