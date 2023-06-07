import Foundation
import SwiftUI

struct ShareButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text("Share with Friends & Family")
                .font(.title2)
                .foregroundColor(.white)
                .bold()
                .padding()
                .frame(maxWidth: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [Color(red: 247/255, green: 198/255, blue: 192/255), Color(red: 227/255, green: 123/255, blue: 87/255)]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(10)
        }
    }
}
