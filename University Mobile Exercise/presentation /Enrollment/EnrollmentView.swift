import SwiftUI
import SwiftUI

struct EnrollmentView: View {
    @State private var username: String = ""
    @State private var password: String = ""

    @ViewBuilder
    private func MainView() -> some View {
        VStack(spacing: 20) {
            Text("Enroll Now")
                .font(.largeTitle)
                .bold()
                .accessibilityAddTraits(.isHeader)
                .accessibilityLabel("Enroll Now")

            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Username")
                        .accessibilityHidden(true)

                    TextField("Enter your username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .accessibilityLabel("Username field")
                        .accessibilityHint("Enter your username")
                }
                .accessibilityElement(children: .combine)
                .accessibilityLabel("Username field")
                .accessibilityHint("Enter your username")

                VStack(alignment: .leading, spacing: 10) {
                    Text("Password")
                        .accessibilityHidden(true)

                    SecureField("Enter your password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .accessibilityElement(children: .combine)
                .accessibilityLabel("Password field")
                .accessibilityHint("Enter your password")
            }

            SubmitButton()

            Spacer()
        }
        .padding()
        .navigationTitle("Enrollment")
        .accessibilityElement(children: .contain)
    }
    
    @ViewBuilder
    private func SubmitButton() -> some View {
        let isValidToSubmit = !(self.username.isEmpty && self.password.isEmpty)
        
        NavigationLink {
            if isValidToSubmit {
                RegistrationView()
            }
        } label: {
            Text("Submit")
                .frame(maxWidth: .infinity)
                .padding()
                .background(isValidToSubmit ? Color.blue : Color.gray)
                .foregroundColor(Color(UIColor.white))
                .cornerRadius(8)
            .accessibilityLabel("Submit enrollment")
            .accessibilityHint("Submits your enrollment information")
        }
        
    }
    
    var body: some View {
        NavigationView {
            if #available(iOS 15, *) {
                MainView()
                    .dynamicTypeSize(.large ... .accessibility5)
            } else {
                MainView()
            }
        }
    }
}
