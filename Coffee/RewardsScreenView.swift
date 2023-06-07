import Foundation
import SwiftUI

struct RewardsScreenView: View {
    @State private var showingProfileView = false
    @State private var showingSearchBar = false
    @State private var showingQRCodeScanner = false
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(showingProfileView: $showingProfileView,
                        showingSearchBar: $showingSearchBar,
                        showingQRCodeScanner: $showingQRCodeScanner)

                Spacer ()

                VStack {
                Text("Your Rewards")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding (20)
                
                Text("Share your code with friends & family to get rewards")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .padding (0)
                }
                Spacer ()

                List(RewardDatabase.shared.getAllRewards(), id: \.id) { reward in
                    RewardCardView(reward: reward)
                        .padding(-5)
                }
            }
            .padding()
            .background(Color.fromString("salt"))
            .cornerRadius(30)
        }
    }
}

struct RewardsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsScreenView()
    }
}
