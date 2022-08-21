//
//  NewsWebView.swift
//  News
//
//  Created by Vsevolod on 21.08.2022.
//

import SwiftUI
import WebKit

struct NewsWebView: UIViewRepresentable {

    var url: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: URL(string: url)!)
        webView.load(request)
    }
}

struct NewsWebView_Previews: PreviewProvider {
    static var previews: some View {
        NewsWebView(url: "https://www.apple.com")
    }
}



