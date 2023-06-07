import SwiftUI

struct DealFullPageView: View {
    @Binding var showingSelf: Bool
    var deal: Deal
    @State private var screenshot: UIImage?
    @State private var localShowingShareModal = false  // Add this line

    var body: some View {
        ZStack {
            VStack {
                // Top bar
                HStack {
                    Button(action: {
                        self.showingSelf = false
                    }) {
                        Image(systemName: "arrow.left")
                            .padding()
                    }
                    Spacer()
                }
                // Logo and Title
                Image(deal.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                Text(deal.name)
                    .font(.largeTitle)
                    .padding(.bottom)

                // Deal Description and Terms
                Text(deal.title)
                    .font(.title)
                    .padding(.bottom)
                    .bold()
                    .foregroundColor(Color.fromString("customblue"))
                Text(deal.description)
                    .font(.body)
                    .padding(.bottom)
                Text(deal.terms)
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
                        .background(Color.fromString("salt"))
                        .clipShape(Circle())
                }
                
                Text("👇 \(Int.random(in: 0...100)) people just tapped this button👇")

                ShareButton(action: {
                    self.localShowingShareModal = true
                })
                .sheet(isPresented: $localShowingShareModal) {
                    ShareModalView()
                }
            }
            .padding()
        }
    }
}

struct DealFullPageView_Previews: PreviewProvider {
    @State static var dummyBool: Bool = false

    static var previews: some View {
        DealFullPageView(showingSelf: $dummyBool, deal: Deal(id: "deal1", logo: "abp", name: "Austin Bouldering Project", title: "FREE Friend Pass", description: "Bring a friend, they get in free!", terms: "Valid for all ABP members", QRCode: "deal1", buttonColor: "green"))
    }
}

