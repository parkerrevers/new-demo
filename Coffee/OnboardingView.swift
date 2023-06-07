import Foundation
import SwiftUI

struct OnboardingView: View {
    @Binding var isOnboardingComplete: Bool
    @State private var phoneNumber = ""
    @State private var isPresentingAlert = false
    
    private func isValidPhoneNumber() -> Bool {
        // For now, let's just check if it's not empty
        return !phoneNumber.isEmpty
    }
    
    var body: some View {
        VStack {
            TextField("Phone Number", text: $phoneNumber)
                .keyboardType(.numberPad)
                .padding()
                .border(Color.gray, width: 0.5)
                .cornerRadius(5.0)
                .padding(.horizontal)
            
            Button(action: {
                if isValidPhoneNumber() {
                    isOnboardingComplete = true
                } else {
                    isPresentingAlert = true
                }
            }) {
                Text("Continue")
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom)
            .alert(isPresented: $isPresentingAlert) {
                Alert(
                    title: Text("Invalid Phone Number"),
                    message: Text("Please enter a valid phone number."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(isOnboardingComplete: .constant(false))
    }
}

