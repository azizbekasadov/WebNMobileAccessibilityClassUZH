import SwiftUI

//RegistrationView represents the enrollment form view.

//Solution for the Date Picker: use accessibilityElement(children: .combine) to combine the text and the picker button as one element. You may need to relabel the element if you think that it is not descriptive enough.
//Solution for the CustomPicker: There are many possible solutions on how to implement a customized picker. See the CustomPicker and CustomCardPicker class for a possible solution.

struct RegistrationView: View {
    @State private var registration: Registration = Registration.sampleRegistration
    @State private var showDatePicker: Bool = false
    @State private var showClearFirstname: Bool = false
    @State private var showClearLastname: Bool = false
    @State private var showClearAddress: Bool = false
    @State private var showClearCity: Bool = false
    @State private var showClearZIP: Bool = false
    
    var body: some View {
        VStack{
            Form{
                PersonalDataSection()
                AddressSection()
                ProgramSection()
            }
        }
    }
    
    @ViewBuilder
    private func PersonalDataSection() -> some View {
        Section(header: Text("Personal Data")){
           TextField("First Name", text: $registration.personalData.first_name, onEditingChanged: { (editing) in
                showClearFirstname = editing
            })
                .accessibilityLabel("First name")
                .modifier(TFClearButton(input: $registration.personalData.first_name, showButton: $showClearFirstname))
            TextField("Last Name", text: $registration.personalData.last_name,
                      onEditingChanged: { (editing) in
                showClearLastname = editing })
                .accessibilityLabel("Last name")
                .modifier(TFClearButton(input: $registration.personalData.last_name, showButton: $showClearLastname))
             HStack {
                DatePicker(
                    "Date of birth",
                    selection: $registration.personalData.date_of_birth,
                    displayedComponents: .date
                )
                .accessibilityLabel("Date of birth")
                .accessibilityValue(registration.personalData.date_of_birth.format())
                .accessibilityHint("Double tap to change date")
            }
            .accessibilityElement(children: .combine)
            
            CustomCardPicker(
                title: "Gender",
                items: Registration.genders,
                selected: $registration.personalData.gender,
                showSearchbar: false
            )
            
            CustomCardPicker(
                title: "Nationality",
                items: Registration.countries,
                selected: $registration.personalData.nationality
            )
        }
    }
    
    @ViewBuilder
    private func AddressSection() -> some View {
        Section(header: Text("Address")){
            TextField("Street and Number", text: $registration.address.street_and_number,
                      onEditingChanged: { (editing) in
                showClearAddress = editing
            })
                .accessibilityLabel("Street and Number")
                .modifier(TFClearButton(input: $registration.address.street_and_number, showButton: $showClearAddress))
            
            TextField("City", text: $registration.address.city,
                      onEditingChanged: { (editing) in
                showClearCity = editing
            })
                .accessibilityLabel("City")
                .modifier(TFClearButton(input: $registration.address.city,
                    showButton: $showClearCity))
            TextField(
                "Zipcode",
                text :$registration.address.zipCode,
                onEditingChanged: { (
                    editing
                ) in showClearZIP = editing
                }
            )
                .keyboardType(.decimalPad)
            .accessibilityLabel("Zipcode")
                .modifier(TFClearButton(input: $registration.address.zipCode, showButton: $showClearZIP))
            CustomCardPicker(title: "Country", items: Registration.countries, selected: $registration.address.country)
        }
    }
    
    @ViewBuilder
    private func ProgramSection() -> some View {
        Section(header: Text("Program")){
            CustomCardPicker(
                title: "Semester",
                items: Registration.semester,
                selected: $registration.enrollment.semester,
                showSearchbar: false
            )
            
            CustomCardPicker(
                title: "Deparment",
                items: Registration.departments,
                selected: $registration.enrollment.department,
                showSearchbar: false
            )
            
            CustomCardPicker(
                title: "Degree",
                items: Registration.degrees,
                selected: $registration.enrollment.degree,
                showSearchbar: false
            )
        }
    }
}



struct RegistrationView_Previews: PreviewProvider{
    static var previews: some View {
        NavigationView{
            RegistrationView()
        }
        
    }
}
