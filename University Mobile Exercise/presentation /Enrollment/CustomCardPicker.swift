//
//  CustomCardPicker.swift
//  University Mobile ExerciseTests
//
//  Created by Azizbek Asadov on 21.03.2025.
//

import SwiftUI

struct CustomCardPicker: View {
    @Binding var selected: String
    
    let title: String
    let items: [String]
    
    var showSearchbar = true

    var body: some View {
        NavigationLink(
            destination: CustomPicker(
                selected: $selected,
                title: title,
                items: items,
                showSearchbar: showSearchbar
            )
        ){
            if #available(iOS 15, *) {
                DestinationView()
                    .dynamicTypeSize(.medium ... .accessibility5)
            } else {
                DestinationView()
            }
        }
    }
    
    @ViewBuilder
    private func DestinationView() -> some View{
        HStack(){
            Text(title)
                .foregroundColor(.primary)
            
            Spacer()
            Text(selected)
                .fontWeight(.light)
                .foregroundColor(.primary)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text(title).foregroundColor(.primary))
        .accessibilityValue(Text(selected).foregroundColor(.primary))
    }
}

struct CustomCardPickerView_Previews: PreviewProvider{
    @State static var value: String = "s"
    
    static var previews: some View{
        NavigationView{
            CustomCardPicker(
                selected: $value,
                title: "Hallo",
                items: Registration.countries,
                showSearchbar: true
            )
            .previewLayout(.fixed(width: 400, height: 100))
        }
    }
}


