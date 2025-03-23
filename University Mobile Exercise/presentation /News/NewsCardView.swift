//
//  NewsCardView.swift
//  University Mobile Exercise
//
//  Created by Azizbek Asadov on 23.03.2025.
//

import SwiftUI

struct NewsCardView: View {
    let news: News
    
    @ViewBuilder
    private func MainView() -> some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("\(news.date.format())")
                    .font(.caption2)
                    .lineLimit(nil)
                    .minimumScaleFactor(0.5)
                    .accessibilityLabel("Published on \(news.date.format())")

                Text(news.title)
                    .font(.headline)
                    .lineLimit(nil)
                    .minimumScaleFactor(0.5)
                    .accessibilityAddTraits(.isHeader)
                    .accessibilityLabel("Headline: \(news.title)")

                Spacer()

                HStack {
                    Text(news.preview_text)
                        .font(.body)
                        .lineLimit(nil)
                        .minimumScaleFactor(0.5)
                        .fixedSize(horizontal: false, vertical: false)
                        .accessibilityLabel("Summary: \(news.preview_text)")
                }
            }
            .padding()
            .accessibilityElement(children: .combine)
            .accessibilityLabel("News: \(news.title). Published on \(news.date.format()). Summary: \(news.preview_text)")
        }
    }

    var body: some View {
        if #available(iOS 15.0, *) {
            MainView()
                .dynamicTypeSize(.large ... .accessibility5)
        } else {
            MainView()
        }
    }
}

struct CardView_Previews: PreviewProvider{
    static var news = News.sampleData[0]
    static var previews: some View {
        NewsCardView(news: news)
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
