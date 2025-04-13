//
//  RestaurantCardView.swift
//  University Mobile ExerciseTests
//
//  Created by Azizbek Asadov on 21.03.2025.
//

import SwiftUI
import Foundation
import SwiftUI
import Foundation

struct RestaurantCardView: View {
    let restaurant: Restaurant

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
        VStack(alignment: .leading, spacing: 10) {
            // Restaurant name
            Text(restaurant.name)
                .font(.headline)
                .foregroundColor(.primary)
                .accessibilityAddTraits(.isHeader)
                .accessibilityLabel("Restaurant name: \(restaurant.name)")

            // Restaurant image
            Image(restaurant.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .accessibilityLabel("Image of \(restaurant.name)")
                .accessibilityHint("Visual representation of the restaurant")
                .accessibilityAddTraits(.isImage)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 4)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(restaurant.name). Double tap to view more information.")
        .accessibilityAddTraits(.isButton) // Important for VoiceOver to treat this as a tappable item
    }
}

struct MensaCardView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardView(restaurant: Restaurant.sampleData[0])
            .previewLayout(.fixed(width: 300, height: 150))
    }
}
