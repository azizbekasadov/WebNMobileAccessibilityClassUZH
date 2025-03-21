import SwiftUI

struct TextNewsView: View {
    let news: News
    
    
    func dateFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        // Set Date Format
        dateFormatter.dateFormat = "dd.MM.yyyy"
        // Convert Date to String
        return dateFormatter.string(from: date)
    }
    
    
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text(news.title)
                        .font(.title)
                    
                    Text(dateFormatter(date: news.date))
                        .font(.caption2)
                }.padding(.bottom)
                Text(news.text)
                Spacer()
            }
            .padding()
            .dynamicTypeSize(.small)
            //Fixing the type size is only available on iOS 15.0+
            //TODO
        } else {
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text(news.title)
                        .font(.title)
                    
                    Text(dateFormatter(date: news.date))
                        .font(.caption2)
                }.padding(.bottom)
                Text(news.text)
                Spacer()
            }
            .padding()
            
        }
    }
}

struct TextNewsView_Previews: PreviewProvider{
    static var previews: some View{
        TextNewsView(news: News.sampleData[0])
    }
}
