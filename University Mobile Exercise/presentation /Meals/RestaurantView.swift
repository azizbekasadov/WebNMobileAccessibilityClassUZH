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
    
    private let tabs: [String] = ["Restaurant", "Info"]
    private let menuTypes: [String] = ["Home menu", "Vegi menu"]
    
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
    private func FirstTabView() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                // Home Menu Card
                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(UIColor.systemBackground))
                        .shadow(color: Color(UIColor.systemGray).opacity(0.5),radius:10)
                        .accessibilityHidden(true)
                    
                    VStack{
                        VStack {
                            Text(menuTypes[0])
                                .fontWeight(.bold)
                                

                            Text(restaurant.homeMenu.name)
                                .accessibilityElement()
                                .accessibilityLabel(Text(restaurant.homeMenu.name))
                        }
                        .accessibilityElement(children: .combine)

                        Text("Ingredients")
                            .padding(.top)

                        ForEach(restaurant.homeMenu.ingredients, id: \.self) { tag in
                            Text("- \(tag)")
                        }
                    }
                    .padding()
                    
                }
                .fixedSize()
                .accessibilityElement(children: .combine)
                .accessibilityLabel("\(menuTypes[0]) of \(restaurant.homeMenu.name) with ingredients: \(restaurant.homeMenu.ingredients.joined(separator: ", "))")
                .accessibilityHint("Contains \(restaurant.homeMenu.ingredients.count) ingredients: \(restaurant.homeMenu.ingredients.joined(separator: ", "))")
                
                Spacer()

                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(UIColor.systemBackground))
                        .shadow(color: Color(UIColor.systemGray).opacity(0.5),radius:10)
                        .accessibilityHidden(true)
                    
                    VStack{
                        Text(menuTypes[0])
                            .fontWeight(.bold)
                            .accessibilityAddTraits(.isButton)

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
                .accessibilityLabel(Text("Vegetarian menu"))
                .accessibilityValue(
                    Text(
                        restaurant.vegiMenu.name + "\n" + "Contains \(restaurant.vegiMenu.ingredients.count) ingredients: \(restaurant.vegiMenu.ingredients.joined(separator: ", "))"
                    )
                )
                .accessibilityHint("Contains \(restaurant.vegiMenu.ingredients.count) ingredients: \(restaurant.vegiMenu.ingredients.joined(separator: ", "))")
                
                Spacer()
            }
        }
        .padding()
        .accessibilityElement(children: .contain)
        .accessibilityLabel(Text("Available menus for today"))
        .accessibilityValue(Text(menuTypes.reduce("", { $0 + " " + $1 })))
        
    }
    
    @ViewBuilder
    private func MainView() -> some View {
        VStack(alignment: .leading) {
            PickerView()
            
            switch(selectedTab) {
            case 0:
                FirstTabView()
            default:
                SecondTabView()
            }

            Spacer()
        }
        .navigationBarTitle(restaurant.name, displayMode: .inline)
        .accessibilityElement(children: .contain)
        .accessibilityLabel(Text("Restaurant"))
        .accessibilityValue(Text(restaurant.name))
    }
    
    @ViewBuilder
    private func PickerView() -> some View {
        Picker("", selection: $selectedTab) {
            Text("Restaurant")
                .tag(0)
            Text("Info")
                .tag(1)
        }
        .pickerStyle(.segmented)
        .padding()
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text("Tab Selection from Picker options"))
        .accessibilityLabel(Text("Select between Restaurant and Info tabs"))
        .accessibilityHint("Switch between restaurant menu and information")
        .accessibilityValue("Selected Tab: \(self.tabs[selectedTab]) from options \(self.tabs.joined(separator: ","))")
        .accessibilityAddTraits(.updatesFrequently)
    }
    
    @ViewBuilder
    private func SecondTabView() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            let start = restaurant.openingTimesInterval.start.format(.short)
            let end = restaurant.openingTimesInterval.end.format(.short)
            
            // Opening Hours
            VStack(alignment: .leading, spacing: 4) {
                Text("Opening Hours")
                    .font(.headline)
                    .accessibilityElement()

                Text("\(start) to \(end)")
            }
            .accessibilityLabel(Text("Opening hours"))
            .accessibilityValue(Text("from \(start) to \(end)"))
            .accessibilityElement(children: .combine)
            
            // Location
            VStack(alignment: .leading, spacing: 4) {
                Text("Location")
                    .font(.headline)
                    .accessibilityElement()

                Text(restaurant.address)
                    .foregroundColor(.primary) // replaces LightGray for contrast
                    .accessibilityLabel("Address: \(restaurant.address)")
            }
            .accessibilityElement(children: .combine)
            .accessibilityLabel(Text("Location and address"))
            .accessibilityValue(Text(restaurant.address))
            .accessibilityAddTraits([.isStaticText])
            
            // Contact
            VStack(alignment: .leading, spacing: 4) {
                Text("Contact")
                    .font(.headline)
                    .accessibilityElement()

                Text("Website")
                    .foregroundColor(Color(UIColor.link))
                    .onTapGesture {
                        openURL(URL(string: "https://google.ch")!)
                    }
                    .accessibilityElement()
                    .accessibilityLabel("Visit restaurant website")
                    .accessibilityValue("Opens the website of the restaurant")
                    .accessibilityHint("Opens the website in Safari")
                    .accessibilityAddTraits([.isLink, .isButton])
            }
            .accessibilityElement(children: .combine)
            .accessibilityLabel(Text("Contact form"))
            

            // Rating
            VStack(alignment: .leading, spacing: 4) {
                Text("Rate our restaurant")
                    .font(.headline)
                    .accessibilityElement()
                    .accessibilityAddTraits(.isHeader)

                if #available(iOS 17.0, *) {
                    RatingSlider(restaurantName: restaurant.name)
                        .accessibilityElement()
                        .accessibilityAddTraits(.isToggle)
                } else {
                    RatingSlider(restaurantName: restaurant.name)
                        .accessibilityElement()
                }
            }
            .accessibilityElement(children: .combine)
            .accessibilityLabel("Rate our restaurant")
            .accessibilityHint("Swipe up or down to change rating from 0 to 5 stars")
            .accessibilityValue("Currently selected rate is \(Int(rating)) stars")
        }
        .padding()
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
            .accessibilityAddTraits(.updatesFrequently)

            Text("Rating: \(Int(rating))")
                .padding(.bottom)
                .accessibilityLabel("Rating is \(Int(rating)) out of 5 stars")
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text("Rating Slider out of 5 stars"))
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                if self.rating < 5 {
                    self.rating += 1
                }
            case .decrement:
                if self.rating > 0 {
                    self.rating -= 1
                }
            @unknown default:
                break
            }
        }
    }
}

struct MensaView_Preview: PreviewProvider{
    static var previews: some View {
        RestaurantView(restaurant: Restaurant.sampleData[0])
    }
}
