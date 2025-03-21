import SwiftUI





struct NewsView: View {
    let news: [News] = News.sampleData
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(news){ n in
                    if (n is ImageNews){
                        NavigationLink(destination: ImageNewsView(news: n as! ImageNews)){
                            NewsCardView(news: n)
                        }
                    }
                    else{
                        NavigationLink(destination: TextNewsView(news:n)){
                            NewsCardView(news: n)
                        }
                    }
                }
            }
            .navigationBarTitle("News", displayMode: .inline)
        }
    }
}

struct NewsView_Previews: PreviewProvider{
    static var previews: some View{
            NewsView()
        
    }
}



