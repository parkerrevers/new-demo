import Foundation
import SwiftUI

struct FlashView: View {
    @Binding var isFlashing: Bool

    var body: some View {
        Rectangle()
            .fill(Color.white)
            .opacity(isFlashing ? 1 : 0)
            .animation(.easeInOut(duration: 0.1), value: isFlashing)
            .edgesIgnoringSafeArea(.all)
    }
}
