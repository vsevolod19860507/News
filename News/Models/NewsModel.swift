//
//  NewsModel.swift
//  News
//
//  Created by Vsevolod on 20.08.2022.
//

import Foundation

struct NewsModel: Identifiable {
    var id: String { url }
    
    let title: String
    let description: String?
    let source: String
    let date: Date
    let url: String
    let imageUrl: String?
    
    init(title: String, description: String? = nil, source: String, date: Date, url: String, imageUrl: String? = nil) {
        self.title = title
        self.description = description
        self.source = source
        self.date = date
        self.url = url
        self.imageUrl = imageUrl
    }
}
