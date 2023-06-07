import Foundation
import SwiftUI

struct Deal {
    var id: String
    var logo: String
    var name: String
    var title: String
    var description: String
    var terms: String
    var QRCode: String
    var buttonColor: String
}

struct Reward {
    var id: String
    var logo: String
    var name: String
    var title: String
    var description: String
    var terms: String
    var QRCode: String
    var buttonColor: String
    var isRedeemed: Bool
    var daysAgo: Int
}
