#if canImport(UIKit)
import UIKit

extension UIView {
    public func addSubviews(_ subviews: UIView...) {
        subviews.forEach(self.addSubview)
    }
}
#endif
