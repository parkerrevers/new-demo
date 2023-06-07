// RewardsDatabase.swift
import Foundation
class RewardDatabase {
    static let shared = RewardDatabase()
    private init() {}

    private var rewards: [String: Reward] = [
        "deal1": Reward(id: "deal1", logo: "abp", name: "ABP", title: "FREE Friend Pass", description: "Bring a friend, they get in free!", terms: "Valid for all ABP members", QRCode: "deal1", buttonColor: "white", isRedeemed: false, daysAgo: 1),
        "deal2": Reward(id: "deal2", logo: "austinfc", name: "Austin FC", title: "2 for 1 tickets", description: "Get a free ticket when you buy 2!", terms: "Valid until August 1, 2023", QRCode: "deal2", buttonColor: "white", isRedeemed: false, daysAgo: 1),
        "deal3": Reward(id: "deal3", logo: "eastciders", name: "ATX East Ciders", title: "2 FREE drinks", description: "You and a friend get a FREE drink!", terms: "Valid this Saturday", QRCode: "deal3", buttonColor: "white", isRedeemed: false, daysAgo: 1),
        "deal4": Reward(id: "deal4", logo: "merit", name: "Merit Coffee", title: "2 FREE coffees", description: "You and a friend get FREE coffees!", terms: "Valid Saturday and Sunday from 12-6pm", QRCode: "deal4", buttonColor: "white", isRedeemed: false, daysAgo: 1),
        "deal5": Reward(id: "deal5", logo: "radio", name: "Radio Coffee", title: "2 for 1 bar drinks", description: "You and two friends get 2 for 1!", terms: "Valid Saturday and Sunday from 12-6pm", QRCode: "deal5", buttonColor: "white", isRedeemed: false, daysAgo: 1),
        "deal6": Reward(id: "deal6", logo: "radio", name: "Radio Coffee", title: "2 FREE coffees", description: "Bring a friend, you both get 1 FREE drink at the bar!", terms: "Valid with an ID after 7pm, Mon-Fri.", QRCode: "deal6", buttonColor: "white", isRedeemed: false, daysAgo: 1),
        "deal7": Reward(id: "deal7", logo: "renzo", name: "Renzo Gracie", title: "1 FREE MONTH", description: "You get 1 FREE month for each friend you get to sign up", terms: "Must be a Renzo Gracie student.", QRCode: "deal7", buttonColor: "white", isRedeemed: true, daysAgo: 1),
        "deal8": Reward(id: "deal8", logo: "zilker", name: "Zilker Brewing", title: "1 FREE BEER", description: "You and a friend get a free drink at the bar", terms: "Valid with an ID after 7pm, Mon-Fri.", QRCode: "deal8", buttonColor: "white", isRedeemed: true, daysAgo: 1),
        "deal9": Reward(id: "deal9", logo: "crux", name: "Crux Climbing", title: "FREE Day Pass", description: "Climb FREE with a friend", terms: "1-5pm, Mon-Fri.", QRCode: "deal9", buttonColor: "white", isRedeemed: false, daysAgo: 1),
        "deal10": Reward(id: "deal10", logo: "proudmary", name: "Proud Mary", title: "FREE black coffee", description: "Get a FREE black coffee when your friend visits Proud Mary", terms: "expires this Sunday", QRCode: "deal10", buttonColor: "white", isRedeemed: false, daysAgo: 1),
    ]

    func find(_ id: String) -> Reward? {
        return rewards[id]
    }

    func getAllRewards() -> [Reward] {
        return Array(rewards.values)
    }
}
