import SwiftUI

struct CustomCardPicker: View {
    let title: String
    let items: [String]
    
    @Binding var selected: String
    
    var showSearchbar = true

    var body: some View {
//        NavigationLink(destination: CustomPicker(title: title, items: items, selected: $selected, showSearchbar: showSearchbar)){
//            HStack(){
//                Text(title)
//                Spacer()
//                Text(selected)
//                    .fontWeight(.light)
//            }
//            .accessibilityElement(children: .ignore)
//            .accessibilityLabel(Text(title))
//            .accessibilityValue(Text(selected))
//            
//        }
        VStack {}
    }
    
}

struct CustomCardPickerView_Previews: PreviewProvider{
    @State static var value: String = "s"
    static var previews: some View{
        NavigationView{
            CustomCardPicker(title: "Hallo", items: Registration.countries, selected: $value, showSearchbar: true)
                .previewLayout(.fixed(width: 400, height: 100))
        }
    }
}


