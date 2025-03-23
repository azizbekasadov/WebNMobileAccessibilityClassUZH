//
//  ImageNewsView.swift
//  University Mobile Exercise
//
//  Created by Azizbek Asadov on 23.03.2025.
//

import SwiftUI

struct ImageNewsView: View {
    let news: ImageNews

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(news.title)
                        .font(.title)
                        .accessibilityAddTraits(.isHeader)
                        .accessibilityLabel("Title: \(news.title)")

                    Text(news.date.format())
                        .font(.caption2)
                        .accessibilityLabel("Published on \(news.date.format())")
                }
                .padding(.bottom)

                Image(news.imageName)
                    .resizable()
                    .scaledToFit()
                    .accessibilityLabel("Image related to \(news.title)")
                    .accessibilityHint("Visual content associated with the news article")

                Text(news.text)
                    .accessibilityLabel("Full article text: \(news.text)")

                Spacer()
            }
            .padding()
            .accessibilityElement(children: .contain)
            .accessibilityLabel("News Article: \(news.title). Published on \(news.date.format()). \(news.text)")
        }
    }
}



struct ImageNewsView_Preview: PreviewProvider{
    static var previews: some View {
        ImageNewsView(news: News.sampleData[1] as! ImageNews)
    }
}
