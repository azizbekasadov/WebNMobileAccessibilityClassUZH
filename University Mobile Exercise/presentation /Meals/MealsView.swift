//
//  MealsView.swift
//  University Mobile ExerciseTests
//
//  Created by Azizbek Asadov on 21.03.2025.
//

import SwiftUI
import SwiftUI

struct MealsView: View {
    // Load sample restaurant models
    let mensas: [Restaurant] = Restaurant.sampleData
    
    var body: some View {
        NavigationView {
            if #available(iOS 15, *) {
                ListContent()
                    .dynamicTypeSize(.medium ... .accessibility5)
            } else {
                ListContent()
            }
        }
        .navigationViewStyle(.stack)
        .accessibilityIdentifier("restaurantListNavigationView")
    }
    
    @ViewBuilder
    private func ListContent() -> some View {
        List {
            ForEach(mensas) { restaurant in
                NavigationLink(destination: RestaurantView(restaurant: restaurant)) {
                    RestaurantCardView(restaurant: restaurant)
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("\(restaurant.name). Double tap to view restaurant details.")
                        .accessibilityAddTraits(.isButton)
                        .accessibilityIdentifier("restaurantCard_\(restaurant.id.uuidString)")
                }
            }
        }
        .accessibilityIdentifier("restaurantList")
        .accessibilityLabel("List of restaurants")
        .accessibilityHint("Swipe to browse restaurants, double tap to select")
        .navigationTitle("Restaurants")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MealsView()
}

