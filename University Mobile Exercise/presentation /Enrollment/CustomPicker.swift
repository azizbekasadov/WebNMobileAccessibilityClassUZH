//
//  CustomPicker.swift
//  University Mobile Exercise
//
//  Created by Azizbek Asadov on 23.03.2025.
//

import Foundation
import SwiftUI

struct CustomPicker: View {
    @Binding var selected: String
    @State private var searchText: String = ""
    
    let title: String
    let items: [String]
    var showSearchbar = true

    var filteredItems: [String] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        if #available(iOS 15, *) {
            MainView()
                .dynamicTypeSize(.large ... .accessibility5)
        } else {
            MainView()
        }
    }
    
    @ViewBuilder
    private func MainView() -> some View {
        VStack(alignment: .leading) {
            if #available(iOS 17.0, *) {
                Text(title)
                    .font(.headline)
                    .accessibilityHeading(.h1)
            } else {
                Text(title)
                    .font(.headline)
                    .accessibilityAddTraits(.isHeader)
            }

            if showSearchbar {
                TextField("Search", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibilityLabel("Search items")
            }

            List(filteredItems, id: \.self) { item in
                HStack {
                    Text(item)
                    Spacer()
                    if item == selected {
                        Image(systemName: "checkmark")
                            .accessibilityLabel("Selected")
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selected = item
                }
                .accessibilityElement(children: .combine)
                .accessibilityLabel("\(item)\(item == selected ? ", selected" : "")")
                .accessibilityAddTraits(item == selected ? .isSelected : .isButton)
            }
        }
        .padding()
        .navigationTitle(Text(title))
    }
}

struct CustomPickerView_Previews: PreviewProvider {
    @State static var value: String = "Deutschland"
    
    static var previews: some View {
        CustomPicker(
            selected: $value,
            title: "Country",
            items: ["Deutschland", "USA", "France"],
            showSearchbar: true
        )
    }
}
