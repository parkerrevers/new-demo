import Foundation
import SwiftUI

struct ProfileView: View {
    let userProfile: User? = UserProfileDatabase.shared.profiles.first
    let rewards: [Reward] = RewardDatabase.shared.getAllRewards()
    let redeemedRewards: [Reward] = RewardDatabase.shared.getAllRewards().filter { $0.isRedeemed }
    
    @State private var showingSettingsView = false
    @State private var localShowingShareModal = false

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // Navigate to EditProfileView
                }) {
                    Text("Edit Profile")
                        .padding()
                }
                Spacer()
                Button(action: { showingSettingsView = true }) {
                    Image("settings")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                .sheet(isPresented: $showingSettingsView) { SettingsView() }
            }
            .padding()

            if let userProfile = userProfile {
                Image("charlie")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                
                // User Name
                Text(userProfile.name)
                    .font(.title)
                    .padding()
            } else {
                Text("No user profile found")
            }

            // Total rewards
            Text("Score: \(rewards.count)")
                .font(.title)
                .bold()
                .foregroundColor(Color.fromString("customblue"))
                .padding(.bottom)
            
            // Top Redeemer Status
            if redeemedRewards.count >= (rewards.count * 10 / 100) {
                Text("🏆 Achievment: Local Influencer! Top 10% of users")
                    .font(.headline)
                    .padding(.bottom)
                    .foregroundColor(Color.orange)
            }

            // Activity
            Text("Activity")
                .font(.headline)
                .padding(.bottom)
                .frame(maxWidth: .infinity, alignment: .leading)

            ScrollView {
                // Redeemed Rewards List
                ForEach(redeemedRewards, id: \.id) { reward in
                    RewardCardView(reward: reward)
                }
            }

            // Share button
            Button(action: {
                self.localShowingShareModal = true
            }) {
                Text("Share Profile")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 247/255, green: 198/255, blue: 192/255), Color(red: 227/255, green: 123/255, blue: 87/255)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
            }
            .sheet(isPresented: $localShowingShareModal) {
                ShareModalView()
            }
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
