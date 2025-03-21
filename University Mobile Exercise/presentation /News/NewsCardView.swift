import SwiftUI
import Foundation


func dateFormatter(date: Date) -> String {
    let dateFormatter = DateFormatter()
    // Set Date Format
    dateFormatter.dateFormat = "dd.MM.yyyy"
    // Convert Date to String
    return dateFormatter.string(from: date)
}

struct NewsCardView: View{
    let news: News
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text("\(dateFormatter(date:news.date))")
                .font(.caption2)
            Text(news.title)
                .font(.headline)
        
            Spacer()
            HStack {
                Text(news.preview_text)
            }
        }.padding()
    }
}

struct CardView_Previews: PreviewProvider{
    static var news = News.sampleData[0]
    static var previews: some View {
        NewsCardView(news: news)
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
