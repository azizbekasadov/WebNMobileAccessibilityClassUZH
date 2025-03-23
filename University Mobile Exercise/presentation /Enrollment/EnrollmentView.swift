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
                Text("Username")
                    .accessibilityHidden(true)

                TextField("Enter your username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibilityLabel("Username field")
                    .accessibilityHint("Enter your username")

                Text("Password")
                    .accessibilityHidden(true)

                SecureField("Enter your password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibilityLabel("Password field")
                    .accessibilityHint("Enter your password")
            }

            Button(action: {
                // Enrollment logic
                debugPrint("Enroll here...")
            }) {
                Text("Submit")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .accessibilityLabel("Submit enrollment")
            .accessibilityHint("Submits your enrollment information")

            Spacer()
        }
        .padding()
        .navigationTitle("Enrollment")
        .accessibilityElement(children: .contain)
        
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
