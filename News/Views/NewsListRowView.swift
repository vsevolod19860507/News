//
//  NewsListRowView.swift
//  News
//
//  Created by Vsevolod on 20.08.2022.
//

import SwiftUI

struct NewsListRowView: View {
    let newsModel: NewsModel
    
    var body: some View {
        VStack {
            if let imageUrl = newsModel.imageUrl {
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 70)
                .clipped()
            }
            HStack(alignment: .firstTextBaseline) {
                Circle()
                    .fill(.blue)
                    .frame(width: 10, height: 10)
                VStack(alignment: .leading) {
                    HStack(alignment: .firstTextBaseline) {
                        Text(newsModel.title)
                            .font(.headline)
                            .lineLimit(2)
                        Spacer()
                        Text(newsModel.date.formatted(Date.FormatStyle().hour().minute()))
                            .foregroundColor(.gray)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    Text(newsModel.source)
                        .font(.footnote)
                        .bold()
                        .lineLimit(1)
                    if let description = newsModel.description {
                        Text(description)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .lineLimit(1)
                    }
                }
            }
            .padding(8)
        }
        .background(.gray.opacity(0.2))
        .cornerRadius(8)
    }
}

struct NewsListRowView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListRowView(newsModel: NewsModel(title: "Title", description: "Description", source: "Source", date: Date(), url: "", imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Lesser_Coat_of_Arms_of_Ukraine.svg/330px-Lesser_Coat_of_Arms_of_Ukraine.svg.png"))
            .preferredColorScheme(.light)
    }
}
