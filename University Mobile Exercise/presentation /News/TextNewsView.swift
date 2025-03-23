//
//  TextNewsView.swift
//  University Mobile Exercise
//
//  Created by Azizbek Asadov on 23.03.2025.
//

import SwiftUI

struct TextNewsView: View {
    let news: News

    var body: some View {
        if #available(iOS 15.0, *) {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(news.title)
                        .font(.title)
                        .lineLimit(nil)
                        .accessibilityAddTraits(.isHeader)
                        .accessibilityLabel("Title: \(news.title)")

                    Text(news.date.format())
                        .font(.caption2)
                        .lineLimit(1)
                        .accessibilityLabel("Published on \(news.date.format())")
                }
                .padding(.bottom)

                Text(news.text)
                    .font(.body)
                    .lineLimit(nil)
                    .accessibilityLabel("Full article text: \(news.text)")

                Spacer()
            }
            .padding()
            .dynamicTypeSize(.large ... .accessibility5)
            .accessibilityElement(children: .contain)
            .accessibilityLabel("News article titled \(news.title), published on \(news.date.format()). \(news.text)")
        } else {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(news.title)
                        .font(.title)
                        .lineLimit(nil)
                        .accessibilityAddTraits(.isHeader)
                        .accessibilityLabel("Title: \(news.title)")

                    Text(news.date.format())
                        .font(.caption2)
                        .lineLimit(1)
                        .accessibilityLabel("Published on \(news.date.format())")
                }
                .padding(.bottom)

                Text(news.text)
                    .font(.body)
                    .lineLimit(nil)
                    .accessibilityLabel("Full article text: \(news.text)")

                Spacer()
            }
            .padding()
            .accessibilityElement(children: .contain)
            .accessibilityLabel("News article titled \(news.title), published on \(news.date.format()). \(news.text)")
            
        }
    }
}

struct TextNewsView_Previews: PreviewProvider {
    static var previews: some View {
        TextNewsView(news: News.sampleData[0])
    }
}
