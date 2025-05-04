//
//  NewsView.swift
//  University Mobile Exercise
//
//  Created by Azizbek Asadov on 23.03.2025.
//

import SwiftUI

struct NewsView: View {
    let news: [News] = News.sampleData

    @ViewBuilder
    private func SubImageNews(_ news: News) -> some View {
        NavigationLink(destination: ImageNewsView(news: news as! ImageNews)) {
            NewsCardView(news: news)
                .accessibilityElement(children: .combine)
                .accessibilityAddTraits(.isButton)
                .accessibilityLabel(Text("\(news.title). Tap to read more."))
                .accessibilityValue(Text(
                    news.preview_text + "\n" + "from \(news.date.format())"
                ))
        }
    }
    
    @ViewBuilder
    private func TextNews(_ news: News) -> some View {
        NavigationLink(destination: TextNewsView(news: news)) {
            NewsCardView(news: news)
                .accessibilityElement(children: .combine)
                .accessibilityAddTraits(.isButton)
                .accessibilityLabel("\(news.title), text news. Tap to read more.")
                .accessibilityValue(Text(
                    news.preview_text + "\n" + "from \(news.date.format())"
                ))
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(news) { n in
                    if let _ = n as? ImageNews {
                        SubImageNews(n)
                    } else {
                        TextNews(n)
                    }
                }
            }
            .navigationBarTitle("News", displayMode: .inline)
            .accessibilityLabel(Text("News List"))
            .accessibilityValue(Text("List of News \(titles)"))
            .accessibilityHint("Swipe to explore news items. Double tap to open.")
        }
    }
    
    private var titles: String {
        news.reduce("", { $0 + " " + $1.title })
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
