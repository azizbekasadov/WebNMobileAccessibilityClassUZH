//
//  RestaurantView.swift
//  University Mobile ExerciseTests
//
//  Created by Azizbek Asadov on 21.03.2025.
//

import SwiftUI

struct RestaurantView: View {
    var restaurant: Restaurant
    
    @Environment(\.openURL) private var openURL
    
    @State private var selectedTab: Int = 0
    @State private var rating: Double = 0.0
    
    func dateFormatter(date: Date) -> String {
        DateFormatter.localizedString(from: date, dateStyle: .none, timeStyle: .short)
    }
    
    var body: some View {
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
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.white)
                                .shadow(radius: 10)

                            VStack(alignment: .leading) {
                                Text("Home menu")
                                    .fontWeight(.bold)
                                    .accessibilityAddTraits(.isHeader)

                                Text(restaurant.homeMenu.name)

                                Text("Ingredients")
                                    .padding(.top)
                                    .accessibilityAddTraits(.isHeader)

                                ForEach(restaurant.homeMenu.ingredients, id: \.self) { tag in
                                    Text("- \(tag)")
                                        .accessibilityLabel(tag)
                                }
                            }
                            .padding()
                        }
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("Home menu: \(restaurant.homeMenu.name). Ingredients: \(restaurant.homeMenu.ingredients.joined(separator: ", "))")

                        Spacer()

                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.white)
                                .shadow(radius: 10)

                            VStack(alignment: .leading) {
                                Text("Vegi menu")
                                    .fontWeight(.bold)
                                    .accessibilityAddTraits(.isHeader)

                                Text(restaurant.vegiMenu.name)

                                Text("Ingredients")
                                    .padding(.top)
                                    .accessibilityAddTraits(.isHeader)

                                ForEach(restaurant.vegiMenu.ingredients, id: \.self) { tag in
                                    Text("- \(tag)")
                                        .accessibilityLabel(tag)
                                }
                            }
                            .padding()
                        }
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("Vegetarian menu: \(restaurant.vegiMenu.name). Ingredients: \(restaurant.vegiMenu.ingredients.joined(separator: ", "))")

                        Spacer()
                    }
                }
                .padding()

            default:
                VStack(alignment: .leading) {
                    Section(header: Text("Opening Hours")
                        .accessibilityAddTraits(.isHeader)) {
                        Text("\(dateFormatter(date: restaurant.openingTimesInterval.start)) to \(dateFormatter(date: restaurant.openingTimesInterval.end))")
                            .padding(.bottom)
                            .accessibilityLabel("Opening hours from \(dateFormatter(date: restaurant.openingTimesInterval.start)) to \(dateFormatter(date: restaurant.openingTimesInterval.end))")
                    }

                    Section(header: Text("Location")
                        .accessibilityAddTraits(.isHeader)) {
                        Text(restaurant.address)
                            .foregroundColor(Color("LightGray"))
                            .padding(.bottom)
                            .accessibilityLabel("Address: \(restaurant.address)")
                    }

                    Section(header: Text("Contact")
                        .accessibilityAddTraits(.isHeader)) {
                        Text("Website")
                            .onTapGesture {
                                openURL(URL(string:"https://google.ch")!)
                            }
                            .padding(.bottom)
                            .accessibilityLabel("Visit website")
                            .accessibilityHint("Opens the restaurant website in browser")
                            .accessibilityAddTraits(.isLink)
                    }

                    Section(header: Text("Rate our restaurant")
                        .accessibilityAddTraits(.isHeader)) {
                            
                        Slider(
                            value: $rating,
                            in: 0...5,
                            step: 1
                        )
                        .accessibilityLabel("Rating slider")
                        .accessibilityValue("\(Int(rating)) out of 5")
                        .accessibilityHint("Adjust to rate the restaurant")

                        Text("Rating: \(Int(rating))")
                            .padding(.bottom)
                            .accessibilityHidden(true)
                    }
                }
                .padding()
            }

            Spacer()
        }
        .navigationBarTitle(restaurant.name, displayMode: .inline)
        .accessibilityElement(children: .contain)
        .accessibilityLabel("Restaurant: \(restaurant.name)")
    }
}

struct MensaView_Preview: PreviewProvider{
    static var previews: some View {
        RestaurantView(restaurant: Restaurant.sampleData[0])
    }
}
