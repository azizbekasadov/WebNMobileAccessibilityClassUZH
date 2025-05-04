//
//  UMDatePicker.swift
//  University Mobile Exercise
//
//  Created by Azizbek Asadov on 31.03.2025.
//

import Foundation
import SwiftUI

struct UMDatePicker: View {
    private let title: String = "Selected date of birth"
    
    @Binding var dateValue: Date
    
    var body: some View {
        HStack {
            DatePicker(
                title,
                selection: $dateValue,
                displayedComponents: .date
            )
            .datePickerStyle(.wheel)
            .accessibilityLabel(title + " picker")
            .accessibilityHint("Double tap to change date")
            .accessibilityValue(Text(dateValue.format()))
            .accessibilityAddTraits(.updatesFrequently)
        }
        .accessibilityElement(children: .combine)
    }
}
