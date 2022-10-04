#if canImport(UIKit)
import UIKit

extension CALayer {
    public func addShadow(
        color: UIColor,
        alpha: Float,
        size: CGSize,
        blur: CGFloat,
        spread: CGFloat = 0
    ) {
        self.shadowColor = color.cgColor
        self.shadowOpacity = alpha
        self.shadowOffset = size
        self.shadowRadius = blur/UIScreen.main.scale
        self.masksToBounds = false
        
        if spread == 0 {
            self.shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
#endif
