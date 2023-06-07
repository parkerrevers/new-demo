import Foundation

struct User {
    var id: Int
    var name: String
    var profileImage: String
}

class UserProfileDatabase {
    static let shared = UserProfileDatabase()
    private init() {}
    
    var profiles = [
        User(id: 1, name: "Charlie Maxwell", profileImage: "charlie"),
        User(id: 2, name: "Laurel Revers", profileImage: "laurel"),
        // Add more profiles as needed
    ]
}
