//
//  RegistrationView.swift
//  University Mobile ExerciseTests
//
//  Created by Azizbek Asadov on 21.03.2025.
//

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
        if #available(iOS 15, *) {
            MainView()
                .dynamicTypeSize(.medium ... .accessibility5)
        } else {
            MainView()
        }
    }
    
    @ViewBuilder
    private func MainView() -> some View {
        VStack{
            Form{
                if #available(iOS 15.0, *) {
                    PersonalDataSection()
                        .accessibilityHeading(.h1)
                } else {
                    PersonalDataSection()
                }
                
                if #available(iOS 15.0, *) {
                    AddressSection()
                        .accessibilityHeading(.h2)
                } else {
                    AddressSection()
                }
                
                if #available(iOS 15.0, *) {
                    ProgramSection()
                        .accessibilityHeading(.h2)
                } else {
                    ProgramSection()
                }
            }
        }
    }
    
    @ViewBuilder
    private func PersonalDataSection() -> some View {
        Section(header: Text("Personal Data"))
        {
            TextField(
                "First Name",
                text: $registration.personalData.first_name,
                onEditingChanged: { (editing) in
                    showClearFirstname = editing
                }
            )
            .accessibilityLabel("First name")
            .modifier(
                TFClearButton(
                    input: $registration.personalData.first_name,
                    showButton: $showClearFirstname
                )
            )
            TextField(
                "Last Name",
                text: $registration.personalData.last_name,
                onEditingChanged: { (editing) in
                    showClearLastname = editing
                }
            )
            .accessibilityLabel("Last name")
            .modifier(
                TFClearButton(
                    input: $registration.personalData.last_name,
                    showButton: $showClearLastname
                )
            )
            
            HStack {
                Button(action: {
                    showDatePicker.toggle()
                }) {
                    HStack {
                        Text("Date of birth")
                        Spacer()
                        Text(registration.personalData.date_of_birth.format())
                            .foregroundColor(.blue)
                    }
                }
                .accessibilityElement(children: .combine)
                .accessibilityLabel(
                    "Date of birth, currently selected: \(registration.personalData.date_of_birth.format())"
                )
                .accessibilityHint(
                    showDatePicker ? "Tap to collapse date picker" : "Tap to expand date picker"
                )
            }
            
            if showDatePicker {
                DatePicker(
                    "Select your date of birth",
                    selection: $registration.personalData.date_of_birth,
                    displayedComponents: .date
                )
                .datePickerStyle(.graphical)
                .accessibilityLabel("Date picker for date of birth")
            }
            
            CustomCardPicker(
                selected: $registration.personalData.gender,
                title: "Gender",
                items: Registration.genders,
                showSearchbar: false
            )
            
            CustomCardPicker(
                selected: $registration.personalData.nationality,
                title: "Nationality",
                items: Registration.countries
            )
        }
    }
    
    @ViewBuilder
    private func AddressSection() -> some View {
        Section(header: Text("Address")){
            TextField(
                "Street and Number",
                text: $registration.address.street_and_number,
                      onEditingChanged: { (editing) in
                showClearAddress = editing
            })
                .accessibilityLabel("Street and Number")
                .modifier(
                    TFClearButton(
                        input: $registration.address.street_and_number,
                        showButton: $showClearAddress
                    )
                )
            
            TextField(
                "City",
                text: $registration.address.city,
                      onEditingChanged: { (editing) in
                showClearCity = editing
            })
                .accessibilityLabel("City")
                .modifier(
                    TFClearButton(
                        input: $registration.address.city,
                        showButton: $showClearCity
                    )
                )
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
            .modifier(
                TFClearButton(
                    input: $registration.address.zipCode,
                    showButton: $showClearZIP
                )
            )
            
            CustomCardPicker(
                selected: $registration.address.country,
                title: "Country",
                items: Registration.countries
            )
        }
    }
    
    @ViewBuilder
    private func ProgramSection() -> some View {
        Section(
            header: HeaderView()
        ){
            CustomCardPicker(
                selected: $registration.enrollment.semester,
                title: "Semester",
                items: Registration.semester,
                showSearchbar: false
            )
            
            CustomCardPicker(
                selected: $registration.enrollment.department,
                title: "Deparment",
                items: Registration.departments,
                showSearchbar: false
            )
            
            CustomCardPicker(
                selected: $registration.enrollment.degree,
                title: "Degree",
                items: Registration.degrees,
                showSearchbar: false
            )
        }
    }
    
    @ViewBuilder
    private func HeaderView() -> some View {
        if #available(iOS 15.0, *) {
            Text("Program")
                .dynamicTypeSize(.medium ... .accessibility5)
        } else {
            Text("Program")
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
