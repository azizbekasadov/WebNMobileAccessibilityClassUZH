//
//  NewsView.swift
//  University Mobile Exercise
//
//  Created by Azizbek Asadov on 23.03.2025.
//

import SwiftUI

struct NewsView: View {
    let news: [News] = News.sampleData

    var body: some View {
        NavigationView {
            List {
                ForEach(news) { n in
                    if let imageNews = n as? ImageNews {
                        NavigationLink(destination: ImageNewsView(news: imageNews)) {
                            NewsCardView(news: n)
                                .accessibilityElement(children: .combine)
                                .accessibilityLabel("\(n.title), image news. Tap to read more.")
                        }
                    } else {
                        NavigationLink(destination: TextNewsView(news: n)) {
                            NewsCardView(news: n)
                                .accessibilityElement(children: .combine)
                                .accessibilityLabel("\(n.title), text news. Tap to read more.")
                        }
                    }
                }
            }
            .navigationBarTitle("News", displayMode: .inline)
            .accessibilityAddTraits(.isHeader)
            .accessibilityLabel("News List")
            .accessibilityHint("Swipe to explore news items. Double tap to open.")
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
