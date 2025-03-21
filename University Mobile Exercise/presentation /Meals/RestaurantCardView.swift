import SwiftUI
import Foundation


struct RestaurantCardView: View{
    let restaurant: Restaurant
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text(restaurant.name)
            
            Image(restaurant.imageName)
                .resizable()
                .frame(width: 250.0 , height: 100.0)
        }.padding()
        
    }
}

struct MensaCardView_Previews: PreviewProvider{
    static var previews: some View {
        RestaurantCardView(restaurant: Restaurant.sampleData[0])
            .previewLayout(.fixed(width: 300, height: 150))
    }
}
