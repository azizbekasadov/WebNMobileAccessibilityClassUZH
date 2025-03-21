
import SwiftUI


//Restaurant View

struct RestaurantView: View {
    var restaurant: Restaurant
    
    @State private var selectedTab: Int = 0
    @State private var rating: Double = 0.0
    
    
    func dateFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        // Set Date Format
        dateFormatter.dateFormat = "HH:mm"
        // Convert Date to String
        // return dateFormatter.string(from: date)
        return DateFormatter.localizedString(from: date, dateStyle:.none, timeStyle: .short)
    }
    
    var body: some View {
        VStack (alignment: .leading){
            //picker as top navigationtabbar
            Picker("", selection: $selectedTab){
                Text("Restaurant")
                    .tag(0)
                Text("Info")
                    .tag(1)
            }
            .pickerStyle(.segmented)
            .padding()
            
            //Depending on the selected tab, the displayed view is changed
            switch(selectedTab){
            case 0:
                VStack(alignment: .leading){
                    HStack(){
                        Spacer()
                        ZStack{
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(.white)
                                .shadow(radius:10)
                            
                            VStack{
                                Text("Home menu")
                                    .fontWeight(.bold)
                                    .frame(maxWidth:150, alignment: .leading)
                                Text(restaurant.homeMenu.name)
                                    .frame(maxWidth:150, alignment: .leading)
                                
                                Text("Ingredients")
                                    .frame(maxWidth:150, alignment: .leading)
                                    .padding(.top)
                                ForEach(restaurant.homeMenu.ingredients, id: \.self) { tag in
                                    Text("-\(tag)")
                                        .padding(3)
                                        .cornerRadius(5)
                                        .frame(maxWidth: 150, alignment: .leading)
                                }
                            }
                            .padding()
                            
                        }.fixedSize()
                        
                        Spacer()
                        ZStack{
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(.white)
                                .shadow(radius:10)
                            
                            //TODO
                            VStack{
                                Text("Vegi menu")
                                    .fontWeight(.bold)
                                    .frame(maxWidth:150, alignment: .leading)
                                
                                Text(restaurant.vegiMenu.name)
                                    .frame(maxWidth:150, alignment: .leading)
                                
                                
                                Text("Ingredients")
                                    .frame(maxWidth:150, alignment: .leading)
                                    .padding(.top)
                                
                                ForEach(restaurant.vegiMenu.ingredients, id: \.self) { tag in
                                    Text("-\(tag)")
                                        .padding(3)
                                        .cornerRadius(10)
                                        .frame(maxWidth: 150, alignment: .leading)
                                }
                            }
                            .padding()
                        
                            
                        }
                        .fixedSize()
                        
                        Spacer()
                    }
                    
                }
                .padding()
            default:
                VStack(alignment: .leading){
                    Section(header: Text("Opening Hours")){
                        Text("\(dateFormatter(date: restaurant.openingTimesInterval.start)) to \(dateFormatter(date: restaurant.openingTimesInterval.end))")
                            .padding(.bottom)
                    }
                    
                    Section(header: Text("Location")){
                        Text(restaurant.address)
                            .foregroundColor(Color("LightGray"))
                            .padding(.bottom)
                    }
                    
                    Section(header: Text("Contact")){
                        
                        //TODO
                        Text("Website")
                            .onTapGesture {
                                UIApplication.shared.openURL(URL(string:"https://google.ch")!)
                            }
                            .accessibilityAddTraits([.isButton])
                            .padding(.bottom)

                        
                    }
                    
                    //TODO
                    Section(header: Text("Rate our restaurant")){
                        Slider(
                            value: $rating,
                            in: 0...5,
                            step: 1
                        )
                        Text("Rating: \(Int(rating))")
                            .padding(.bottom)
                    }
                }
                .padding()
            }
            Spacer()
        }
        .navigationBarTitle(restaurant.name, displayMode: .inline)
        
    }
}



struct MensaView_Preview: PreviewProvider{
    static var previews: some View {
        RestaurantView(restaurant: Restaurant.sampleData[0])
    }
}
