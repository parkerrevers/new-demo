import SwiftUI

import SwiftUI

struct DealCardView: View {
    var deal: Deal
    @Binding var showingDealView: Bool

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Image(deal.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                Text(deal.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.fromString("text")) // changed this line
                Text(deal.title)
                    .font(.title)
                    .foregroundColor(Color.fromString("text")) // changed this line
            }
            .padding()
            .frame(maxWidth: 300)
            .background(Color.fromString(deal.buttonColor)) // use extension to convert string to color
            .foregroundColor(Color.fromString("gray1")) // changed this line
            .cornerRadius(20)
            .onTapGesture {
                showingDealView = true
            }
            .frame(width: geometry.size.width)
        }
    }
}

struct DealCardView_Previews: PreviewProvider {
    static var previews: some View {
        DealCardView(deal: Deal(id: "deal1", logo: "abp", name: "Austin Bouldering Project", title: "FREE Friend Pass", description: "Bring a friend, they get in free!", terms: "Valid for all ABP members", QRCode: "deal1", buttonColor: "gray"), showingDealView: .constant(false))
    }
}
