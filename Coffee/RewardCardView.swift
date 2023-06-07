import Foundation
import SwiftUI

struct RewardCardView: View {
    let reward: Reward
    
    // Function to generate a random color
    func getRandomColor() -> Color {
        let colors: [Color] = [.fromString("customred"), .fromString("customred")]
        let randomIndex = Int.random(in: 0..<colors.count)
        return colors[randomIndex]
    }
    
    var body: some View {
        NavigationLink(destination: RewardFullPageView(reward: reward)) {
            HStack {
                Image(reward.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .grayscale(reward.isRedeemed ? 1.0 : 0.0)
                
                VStack(alignment: .leading) {
                    Text(reward.title)
                        .font(.headline)
                        .foregroundColor(reward.isRedeemed ? .black : .black)
                }
                Spacer()
                
                Text("\(reward.daysAgo)d")
                    .font(.subheadline)
                    .foregroundColor(reward.isRedeemed ? .black : .gray)
            }
            .padding(10)
            .background(reward.isRedeemed ? Color.gray : getRandomColor())
            .cornerRadius(10)
        }
    }
}

struct RewardCardView_Previews: PreviewProvider {
    static var previews: some View {
        RewardCardView(reward: Reward(id: "deal1", logo: "abp", name: "Austin Bouldering Project", title: "FREE Friend Pass", description: "Bring a friend, they get in free!", terms: "Valid for all ABP members", QRCode: "deal1", buttonColor: "green", isRedeemed: false, daysAgo: 1 ))
    }
}
