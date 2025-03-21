import SwiftUI

struct EnrollmentView: View {
    let degrees: [String] = Registration.degrees
    
    
    var body: some View {
        NavigationView{
            RegistrationView()
            .navigationBarTitle("Enrollment", displayMode: .inline)
        }
      
    }
}

#Preview {
    EnrollmentView()
}

