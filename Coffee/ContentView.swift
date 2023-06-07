import SwiftUI

struct ContentView: View {
    @State private var isOnboardingComplete = true

    var body: some View {
        if isOnboardingComplete {
            TabView {
                MainScreenView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                RewardsScreenView()
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("Rewards")
                    }
            }
        } else {
            OnboardingView(isOnboardingComplete: $isOnboardingComplete)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
