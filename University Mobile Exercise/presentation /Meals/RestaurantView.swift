//
//  RestaurantView.swift
//  University Mobile ExerciseTests
//
//  Created by Azizbek Asadov on 21.03.2025.
//
import SwiftUI

//Restaurant View
struct RestaurantView: View {
    var restaurant: Restaurant
    
    @Environment(\.openURL) private var openURL
    
    @State private var selectedTab: Int = 0
    @State private var rating: Double = 0.0
    
    var body: some View {
        if #available(iOS 15, *) {
            MainView()
                .dynamicTypeSize(.medium ... .accessibility5)
        } else {
            MainView()
        }
    }
    
    @ViewBuilder
    private func MainView() -> some View {
        VStack(alignment: .leading) {
            Picker("", selection: $selectedTab) {
                Text("Restaurant")
                    .tag(0)
                Text("Info")
                    .tag(1)
            }
            .pickerStyle(.segmented)
            .padding()
            .accessibilityLabel("Tab Selection")
            .accessibilityHint("Switch between restaurant menu and information")

            switch(selectedTab) {
            case 0:
                VStack(alignment: .leading) {
                    HStack {
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
                                    .accessibilityAddTraits(.isHeader)

                                Text(restaurant.homeMenu.name)
                                    .accessibilityLabel(Text(restaurant.homeMenu.name))

                                Text("Ingredients")
                                    .padding(.top)
                                    .accessibilityAddTraits(.isHeader)

                                ForEach(restaurant.homeMenu.ingredients, id: \.self) { tag in
                                    Text("- \(tag)")
                                        .accessibilityLabel("Restaurant Home Menu Ingridients " + tag)
                                }
                            }
                            .padding()
                        }
                        .fixedSize()
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("Home menu: \(restaurant.homeMenu.name). Ingredients: \(restaurant.homeMenu.ingredients.joined(separator: ", "))")

                        Spacer()

                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.white)
                                .shadow(radius:10)
                                .accessibilityHidden(true)
                            
                            VStack{
                                Text("Vegi menu")
                                    .fontWeight(.bold)
                                    .accessibilityAddTraits(.isHeader)

                                Text(restaurant.vegiMenu.name)
                                    .frame(maxWidth:150, alignment: .leading)
                                
                                Text("Ingredients")
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
                VStack(alignment: .leading, spacing: 16) {
                    let start = restaurant.openingTimesInterval.start.format(.short)
                    let end = restaurant.openingTimesInterval.end.format(.short)
                    
                    // Opening Hours
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Opening Hours")
                            .font(.headline)
                            .accessibilityAddTraits(.isHeader)

                        
                        
                        Text("\(start) to \(end)")
                            .accessibilityLabel("Opening hours from \(start) to \(end)")
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("Opening hours: \(start) to \(end)")
                    
                    // Location
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Location")
                            .font(.headline)
                            .accessibilityAddTraits(.isHeader)

                        Text(restaurant.address)
                            .foregroundColor(.primary) // replaces LightGray for contrast
                            .accessibilityLabel("Address: \(restaurant.address)")
                    }
                    .accessibilityElement(children: .combine)
                    
                    // Contact
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Contact")
                            .font(.headline)
                            .accessibilityAddTraits(.isHeader)

                        Text("Website")
                            .foregroundColor(.blue)
                            .onTapGesture {
                                openURL(URL(string: "https://google.ch")!)
                            }
                            .accessibilityLabel("Visit restaurant website")
                            .accessibilityHint("Opens the website in Safari")
                            .accessibilityAddTraits([.isLink, .isButton])
                    }
                    .accessibilityElement(children: .combine)

                    // Rating
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Rate our restaurant")
                            .font(.headline)
                            .accessibilityAddTraits(.isHeader)

                        RatingSlider(restaurantName: restaurant.name)
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
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Restaurant: \(restaurant.name)")
    }
    
    @ViewBuilder
    private func RatingSlider(restaurantName: String) -> some View {
        VStack {
            Slider(
                value: $rating,
                in: 0...5,
                step: 1
            )
            .accessibilityElement()
            .accessibilityLabel("Rating for \(restaurantName)")
            .accessibilityValue("\(Int(rating)) out of 5 stars")
            .accessibilityHint("Swipe up or down to adjust the rating")

            Text("Rating: \(Int(rating))")
                .padding(.bottom)
                .accessibilityLabel("Rating is \(Int(rating)) out of 5 stars")
                .accessibilityHidden(true)
        }
        .accessibilityElement(children: .combine)
    }
}

struct MensaView_Preview: PreviewProvider{
    static var previews: some View {
        RestaurantView(restaurant: Restaurant.sampleData[0])
    }
}
