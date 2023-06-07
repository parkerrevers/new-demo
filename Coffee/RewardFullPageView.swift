import Foundation
import SwiftUI

struct RewardFullPageView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var reward: Reward
    @State private var localShowingShareModal = false

    var body: some View {
        ZStack {
            VStack {
                // Reward banner
                Text(reward.isRedeemed ? "Redeemed" : "🆓 🎁 Redeem Now!")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(reward.isRedeemed ? Color.gray : Color.fromString("customblue"))
                    .edgesIgnoringSafeArea(.top)
                    .foregroundColor(Color.white)
                    .bold()

                // Logo and Title
                Image(reward.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                Text(reward.name)
                    .font(.largeTitle)
                    .padding(.bottom)

                // Deal Description and Terms
                Text(reward.title)
                    .font(.title)
                    .padding(.bottom)
                    .bold()
                    .foregroundColor(Color.fromString("customblue"))
                Text(reward.description)
                    .font(.body)
                    .padding(.bottom)
                Text(reward.terms)
                    .font(.caption)
                    .padding(.bottom)

                Spacer()

                // QR code with profile image on top
                ZStack {
                    Image("qrcode")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)

                    Image("charlie")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .background(Color.white)
                        .clipShape(Circle())
                }
                .padding(.top, 20)

                Text("☝️ \(Int.random(in: 0...100)) people redeemed their code!☝️")
            }
            .padding()
        }
    }
}


struct RewardFullPageView_Previews: PreviewProvider {
    @State static var dummyBool: Bool = false

    static var previews: some View {
        RewardFullPageView(reward: Reward(id: "deal1", logo: "abp", name: "Austin Bouldering Project", title: "FREE Friend Pass", description: "Bring a friend, they get in free!", terms: "Valid for all ABP members", QRCode: "deal1", buttonColor: "green", isRedeemed: false, daysAgo: 1 ))
    }
}
