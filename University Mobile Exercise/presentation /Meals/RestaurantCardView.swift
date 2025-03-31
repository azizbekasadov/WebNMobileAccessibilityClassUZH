//
//  RestaurantCardView.swift
//  University Mobile ExerciseTests
//
//  Created by Azizbek Asadov on 21.03.2025.
//

import SwiftUI
import Foundation

struct RestaurantCardView: View {
    let restaurant: Restaurant

    var body: some View {
        VStack(alignment: .leading) {
            Text(restaurant.name)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
                .accessibilityLabel("Restaurant name: \(restaurant.name)")

            Image(restaurant.imageName)
                .resizable()
                .frame(width: 250.0 , height: 100.0)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .accessibilityLabel("Image of \(restaurant.name)")
                .accessibilityHint("Visual representation of the restaurant")
        }
        .padding()
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(restaurant.name), Restaurant card")
    }
}

struct MensaCardView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardView(restaurant: Restaurant.sampleData[0])
            .previewLayout(.fixed(width: 300, height: 150))
    }
}
