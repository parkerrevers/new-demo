import Foundation
import SwiftUI

struct PageIndicator: View {
    var currentIndex: Int
    var numberOfPages: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfPages) { index in
                Circle()
                    .frame(width: index == currentIndex ? 12 : 8, height: index == currentIndex ? 12 : 8)
                    .foregroundColor(index == currentIndex ? .blue : .gray)
                    .animation(.easeIn)
                    .transition(.scale)
            }
        }
    }
}

struct PageIndicator_Previews: PreviewProvider {
    static var previews: some View {
        PageIndicator(currentIndex: 0, numberOfPages: 5)
    }
}
