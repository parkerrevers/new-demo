import SwiftUI

struct HeaderView: View {
    @Binding var showingProfileView: Bool
    @Binding var showingSearchBar: Bool
    @Binding var showingQRCodeScanner: Bool

    var body: some View {
        HStack {
            Button(action: { showingSearchBar = true }) {
                Image("search")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .background(Color.fromString("salt"))
            }
            .sheet(isPresented: $showingSearchBar) {
                Text("Search for local businesses")
            }

            Button(action: { showingQRCodeScanner = true }) {
                Image("qrcode")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .background(Color.fromString("salt"))
            }
            .sheet(isPresented: $showingQRCodeScanner) {
                QRCodeView()
            }

            Spacer()

            Image("and")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .background(Color.fromString("salt"))

            Spacer()

            Button(action: { showingProfileView = true }) {
                if UserProfileDatabase.shared.profiles.isEmpty {
                    Image("profileicon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .background(Color.fromString("salt"))
                        .clipShape(Circle())
                } else {
                    Image(UserProfileDatabase.shared.profiles.first?.profileImage ?? "profileicon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .background(Color.fromString("salt"))
                        .clipShape(Circle())
                }
            }
            .sheet(isPresented: $showingProfileView) { ProfileView() }
        }
        .padding()
    }
}
