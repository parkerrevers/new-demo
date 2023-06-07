import Foundation
import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            ForEach(["Follow on IG", "Share profile", "Privacy", "Terms"], id: \.self) { item in
                Button(action: {
                    // Replace this with your actual action
                    print("Selected \(item)")
                }) {
                    HStack {
                        Text(item)
                        Spacer()
                        Image(systemName: "arrow.up.right.square")
                    }
                    .padding()
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
