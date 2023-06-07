import SwiftUI

struct ShareModalView: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // Add your action for Instagram
                }) {
                    VStack {
                        Image("instagram")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                        Text("Instagram")
                    }
                }
                Spacer()

                Button(action: {
                    // Add your action for Snapchat
                }) {
                    VStack {
                        Image("snapchat")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                        Text("Snapchat")
                    }
                }
                Spacer()

                Button(action: {
                    // Add your action for iMessage
                }) {
                    VStack {
                        Image("imessage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                        Text("iMessage")
                    }
                }
                Spacer()

                Button(action: {
                    // Add your action for Copy & Paste
                }) {
                    VStack {
                        Image("copypaste")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                        Text("Copy & Paste")
                    }
                }
            }
            .padding()
        }
    }
}

struct ShareModalView_Previews: PreviewProvider {
    static var previews: some View {
        ShareModalView()
    }
}
