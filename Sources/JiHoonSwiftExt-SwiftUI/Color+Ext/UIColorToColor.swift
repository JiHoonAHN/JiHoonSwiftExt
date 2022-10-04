#if canImport(SwiftUI) && canImport(UIKit)
import SwiftUI
import UIKit

public extension UIColor {
    @available(iOS 13.0, *)
    var color: Color {
        let colorComponents = self.cgColor.components!
        return Color(red: colorComponents[0], green: colorComponents[1], blue: colorComponents[2])
    }
}

#endif
