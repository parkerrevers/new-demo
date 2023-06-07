import SwiftUI

struct MainScreenView: View {
    @State private var showingProfileView = false
    @State private var showingSearchBar = false
    @State private var showingQRCodeScanner = false
    @State private var showingDealView = false
    @State private var showingShareModal = false
    @State private var pageIndex: Int = 0
    
    var deals = DealDatabase.shared.getAllDeals()

    var body: some View {
        VStack {
            HeaderView(showingProfileView: $showingProfileView,
                       showingSearchBar: $showingSearchBar,
                       showingQRCodeScanner: $showingQRCodeScanner)
            
            VStack {
                Text("Step 1: Search, scan or swipe")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding (20)
                SwipeView(pageIndex: $pageIndex, showingDealView: $showingDealView)
                    .padding(.top, -55)
                PageIndicator(currentIndex: pageIndex, numberOfPages: deals.count)
                    .padding(.bottom, 10)
            }
            .padding(-0)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(30)
            .frame(maxWidth: .infinity)

            Spacer(minLength: 0)
            Spacer(minLength: 25)

            VStack {
                Text("Step 2: Share your code")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("👇 \(Int.random(in: 0...100)) people just tapped this button👇")
                
                ShareButton {
                    showingShareModal = true
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .frame(maxWidth: .infinity)
            .cornerRadius(30)
            .sheet(isPresented: $showingShareModal) { ShareModalView() }
        }
        .padding()
        .background(Color.fromString("salt"))
        .cornerRadius(30)
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}

struct SwipeView: View {
    enum DragState {
        case inactive
        case dragging(translation: CGSize)

        var translation: CGSize {
            switch self {
            case .inactive:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }

        var isDragging: Bool {
            switch self {
            case .inactive:
                return false
            case .dragging:
                return true
            }
        }
    }

    @GestureState private var dragState = DragState.inactive
    @Binding var pageIndex: Int
    @Binding var showingDealView: Bool

    var body: some View {
        GeometryReader { geometry in
            let dragGesture = DragGesture()
                .updating($dragState) { drag, state, transaction in
                    state = .dragging(translation: drag.translation)
                }
                .onEnded { value in
                    let dragThresholdPercentage: CGFloat = 0.25
                    let dragThreshold: CGFloat = dragThresholdPercentage * geometry.size.width
                    if value.translation.width < -dragThreshold {
                        pageIndex = min(pageIndex + 1, DealDatabase.shared.getAllDeals().count - 1)
                    } else if value.translation.width > dragThreshold {
                        pageIndex = max(pageIndex - 1, 0)
                    }
                }

            VStack {
                Spacer(minLength: 50)
                DealCardView(deal: DealDatabase.shared.getAllDeals()[pageIndex], showingDealView: $showingDealView)
                    .frame(width: 360, height: geometry.size.height / 1)
                    .offset(x: self.dragState.translation.width, y: 0)
                    .animation(.easeInOut)
                    .gesture(dragGesture)

                Spacer(minLength: 50)
            }
        }
    .fullScreenCover(isPresented: $showingDealView) {
            DealFullPageView(showingSelf: $showingDealView,
                             deal: DealDatabase.shared.getAllDeals()[pageIndex])
        }
    }
}
