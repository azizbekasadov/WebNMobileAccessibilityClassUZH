//
//  UMDatePicker.swift
//  University Mobile Exercise
//
//  Created by Azizbek Asadov on 31.03.2025.
//

import Foundation
import SwiftUI

struct UMDatePicker: View {
    private let title: String = "Date of birth"
    
    @Binding var dateValue: Date
    
    var body: some View {
        HStack {
            DatePicker(
                title,
                selection: $dateValue,
                displayedComponents: .date
            )
            .accessibilityLabel(title + " picker")
            .accessibilityValue(dateValue.format())
            .accessibilityHint("Double tap to change date")
        }
        .accessibilityElement(children: .combine)
    }
}
