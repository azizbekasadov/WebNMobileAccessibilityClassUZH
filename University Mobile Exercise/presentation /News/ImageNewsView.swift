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
                    if #available(iOS 15, *) {
                        TitleView()
                            .dynamicTypeSize(.medium ... .accessibility5)
                        
                        DateFormatView()
                            .dynamicTypeSize(.medium ... .accessibility5)
                    } else {
                        TitleView()
                        
                        DateFormatView()
                    }
                }
                .padding(.bottom)

                Image(news.imageName)
                    .resizable()
                    .scaledToFit()
                    .accessibilityLabel("Image related to \(news.title)")
                    .accessibilityHint("Visual content associated with the news article")

                if #available(iOS 15, *) {
                    FullArticleTextView()
                        .dynamicTypeSize(.medium ... .accessibility5)
                } else {
                    FullArticleTextView()
                }

                Spacer()
            }
            .padding()
            .accessibilityElement(children: .combine)
            .accessibilityLabel("News Article: \(news.title). Published on \(news.date.format()). \(news.text)")
        }
    }
    
    @ViewBuilder
    private func FullArticleTextView() -> some View {
        Text(news.text)
            .accessibilityLabel("Full article text: \(news.text)")
    }
    
    @ViewBuilder
    private func TitleView() -> some View {
        Text(news.title)
            .font(.title)
            .accessibilityAddTraits(.isHeader)
            .accessibilityLabel("Title: \(news.title)")
    }
    
    @ViewBuilder
    private func DateFormatView() -> some View {
        Text(news.date.format())
            .font(.caption2)
            .accessibilityLabel("Published on \(news.date.format())")
    }
}



struct ImageNewsView_Preview: PreviewProvider{
    static var previews: some View {
        ImageNewsView(news: News.sampleData[1] as! ImageNews)
    }
}
