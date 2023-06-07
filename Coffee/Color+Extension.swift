import Foundation
import SwiftUI

extension Color {
    static func fromString(_ color: String) -> Color {
        switch color {
        case "systemGray":
            return .gray
        case "text":
            return Color.black
        case "gray1":
            return Color(red: 236/255, green: 102/255, blue: 100/255)
        case "gray2":
            return Color(red: 217/255, green: 217/255, blue: 217/255)
        case "customred":
            return Color(red: 247/255, green: 198/255, blue: 192/255)
        case "custompink":
            return Color(red: 227/255, green: 123/255, blue: 87/255)
        case "customblue":
            return Color(red: 0/255, green: 112/255, blue: 255/255)
        default:
            return .white
        }
    }
}
