import SwiftUI

struct ImageNewsView: View {
    let news: ImageNews
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text(news.title)
                    .font(.title)
                Text(dateFormatter(date: news.date))
                    .font(.caption2)
            }.padding(.bottom)
            Image(news.imageName)
                .resizable()
                .scaledToFit()
            //TODO

            Text(news.text)
            Spacer()
        }.padding()
        
    }
}





struct ImageNewsView_Preview: PreviewProvider{
    static var previews: some View {
        ImageNewsView(news: News.sampleData[1] as! ImageNews)
    }
}
