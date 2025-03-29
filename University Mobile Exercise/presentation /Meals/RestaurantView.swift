import SwiftUI

//Restaurant View
struct RestaurantView: View {
    var restaurant: Restaurant
    
    @State private var selectedTab: Int = 0
    @State private var rating: Double = 0.0
    
    func dateFormatter(date: Date) -> String {
        return DateFormatter.localizedString(from: date, dateStyle:.none, timeStyle: .short)
    }
    
    var body: some View {
        VStack (alignment: .leading){
            //picker as top navigationtabbar
            Picker("View Selection", selection: $selectedTab){
                Text("Restaurant")
                    .tag(0)
                Text("Info")
                    .tag(1)
            }
            .pickerStyle(.segmented)
            .padding()
            .accessibilityHint("Toggle between Restaurant menu and Information")
            
            //Depending on the selected tab, the displayed view is changed
            switch(selectedTab){
            case 0:
                VStack(alignment: .leading){
                    HStack(){
                        Spacer()
                        // Home Menu Card
                        ZStack{
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(.white)
                                .shadow(radius:10)
                                .accessibilityHidden(true)
                            
                            VStack{
                                Text("Home menu")
                                    .fontWeight(.bold)
                                    .frame(maxWidth:150, alignment: .leading)
                                Text(restaurant.homeMenu.name)
                                    .frame(maxWidth:150, alignment: .leading)
                                
                                Text("Ingredients")
                                    .frame(maxWidth:150, alignment: .leading)
                                    .padding(.top)
                                VStack(alignment: .leading) {
                                    ForEach(restaurant.homeMenu.ingredients, id: \.self) { ingredient in
                                        Text("-\(ingredient)")
                                            .padding(3)
                                            .cornerRadius(5)
                                            .frame(maxWidth: 150, alignment: .leading)
                                    }
                                }
                            }
                            .padding()
                        }
                        .fixedSize()
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("Home menu: \(restaurant.homeMenu.name)")
                        .accessibilityHint("Contains \(restaurant.homeMenu.ingredients.count) ingredients: \(restaurant.homeMenu.ingredients.joined(separator: ", "))")
                        
                        Spacer()
                        
                        // Vegi Menu Card
                        ZStack{
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(.white)
                                .shadow(radius:10)
                                .accessibilityHidden(true)
                            
                            VStack{
                                Text("Vegi menu")
                                    .fontWeight(.bold)
                                    .frame(maxWidth:150, alignment: .leading)
                                Text(restaurant.vegiMenu.name)
                                    .frame(maxWidth:150, alignment: .leading)
                                
                                Text("Ingredients")
                                    .frame(maxWidth:150, alignment: .leading)
                                    .padding(.top)
                                
                                VStack(alignment: .leading) {
                                    ForEach(restaurant.vegiMenu.ingredients, id: \.self) { ingredient in
                                        Text("-\(ingredient)")
                                            .padding(3)
                                            .cornerRadius(10)
                                            .frame(maxWidth: 150, alignment: .leading)
                                    }
                                }
                            }
                            .padding()
                        }
                        .fixedSize()
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("Vegetarian menu: \(restaurant.vegiMenu.name)")
                        .accessibilityHint("Contains \(restaurant.vegiMenu.ingredients.count) ingredients: \(restaurant.vegiMenu.ingredients.joined(separator: ", "))")
                        
                        Spacer()
                    }
                }
                .padding()
                .accessibilityElement(children: .contain)
                .accessibilityLabel("Available menus for today")
            default:
                VStack(alignment: .leading){
                    Group {
                        Text("Opening Hours").font(.headline)
                        Text("\(dateFormatter(date: restaurant.openingTimesInterval.start)) to \(dateFormatter(date: restaurant.openingTimesInterval.end))")
                            .padding(.bottom)
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("Opening hours: \(dateFormatter(date: restaurant.openingTimesInterval.start)) to \(dateFormatter(date: restaurant.openingTimesInterval.end))")
                    
                    Group {
                        Text("Location").font(.headline)
                        Text(restaurant.address)
                            .foregroundColor(Color("LightGray"))
                            .padding(.bottom)
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("Location: \(restaurant.address)")
                    
                    Group {
                        Text("Contact").font(.headline)
                        Button("Visit Website") {
                            UIApplication.shared.open(URL(string: "https://google.ch")!)
                        }
                        .padding(.bottom)
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("Contact: Visit Website")
                    .accessibilityHint("Opens the restaurant website in your browser")
                    
                    Group {
                        Text("Rate our restaurant").font(.headline)
                        VStack {
                            HStack {
                                Text("0")
                                Slider(
                                    value: $rating,
                                    in: 0...5,
                                    step: 1
                                )
                                .accessibilityValue("\(Int(rating)) stars out of 5")
                                .accessibilityAdjustableAction { direction in
                                    switch direction {
                                    case .increment:
                                        if rating < 5 { 
                                            rating += 1 
                                            UIAccessibility.post(notification: .announcement, argument: "\(Int(rating)) stars")
                                        }
                                    case .decrement:
                                        if rating > 0 { 
                                            rating -= 1 
                                            UIAccessibility.post(notification: .announcement, argument: "\(Int(rating)) stars")
                                        }
                                    @unknown default:
                                        break
                                    }
                                }
                                Text("5")
                            }
                            
                            Text("Rating: \(Int(rating)) stars")
                                .padding(.bottom)
                                .accessibilityHidden(true)
                        }
                    }
                    .accessibilityElement(children: .contain)
                    .accessibilityLabel("Rate our restaurant")
                    .accessibilityHint("Swipe up or down to change rating from 0 to 5 stars")
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
