import Foundation

class DealDatabase {
    static let shared = DealDatabase()
    private init() {}
    
    private let deals: [String: Deal] = [
        "deal1": Deal(id: "deal1", logo: "abp", name: "ABP", title: "FREE Friend Pass", description: "Bring a friend, they get in free!", terms: "Valid for all ABP members", QRCode: "deal1", buttonColor: "white"),
        "deal2": Deal(id: "deal2", logo: "austinfc", name: "Austin FC", title: "2 for 1 tickets", description: "Get a free ticket when you buy 2!", terms: "Valid until August 1, 2023", QRCode: "deal2", buttonColor: "white"),
        "deal3": Deal(id: "deal3", logo: "eastciders", name: "ATX East Ciders", title: "2 FREE drinks", description: "You and a friend get a FREE drink!", terms: "Valid this Saturday", QRCode: "deal3", buttonColor: "white"),
        "deal4": Deal(id: "deal4", logo: "merit", name: "Merit Coffee", title: "2 FREE coffees", description: "You and a friend get FREE coffees!", terms: "Valid Saturday and Sunday from 12-6pm", QRCode: "deal4", buttonColor: "white"),
        "deal5": Deal(id: "deal5", logo: "radio", name: "Radio Coffee", title: "2 for 1 bar drinks", description: "You and two friends get 2 for 1!", terms: "Valid Saturday and Sunday from 12-6pm", QRCode: "deal5", buttonColor: "white"),
        "deal6": Deal(id: "deal6", logo: "radio", name: "Radio Coffee", title: "2 FREE coffees", description: "Bring a friend, you both get 1 FREE drink at the bar!", terms: "Valid with an ID after 7pm, Mon-Fri.", QRCode: "deal6", buttonColor: "white"),
        "deal7": Deal(id: "deal7", logo: "renzo", name: "Renzo Gracie", title: "1 FREE MONTH", description: "You get 1 FREE month for each friend you get to sign up", terms: "Must be a Renzo Gracie student.", QRCode: "deal7", buttonColor: "white"),
        "deal8": Deal(id: "deal8", logo: "zilker", name: "Zilker Brewing", title: "1 FREE BEER", description: "You and a friend get a free drink at the bar", terms: "Valid with an ID after 7pm, Mon-Fri.", QRCode: "deal8", buttonColor: "white"),
        "deal9": Deal(id: "deal9", logo: "crux", name: "Crux Climbing", title: "FREE Day Pass", description: "Climb FREE with a friend", terms: "1-5pm, Mon-Fri.", QRCode: "deal9", buttonColor: "white"),
        "deal10": Deal(id: "deal10", logo: "proudmary", name: "Proud Mary", title: "FREE black coffee", description: "Get a FREE black coffee when your friend visits Proud Mary", terms: "expires this Sunday", QRCode: "deal10", buttonColor: "white"),
        // Add more deals here...
    ]

    func find(_ id: String) -> Deal? {
        return deals[id]
    }

    func getAllDeals() -> [Deal] {
        return Array(deals.values)
    }
}
