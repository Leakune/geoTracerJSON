
import UIKit

extension UIView {
    public func addCornerRadius(_ radius: CGFloat = 16) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }

    public func addBorderLine(width: CGFloat = 1, color: UIColor = UIColor.black.withAlphaComponent(0.1)) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }

    public func makeRounded() {
        layer.masksToBounds = false
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }

    @objc public func addShadow(cornerRadius: CGFloat = 16,
                         shadowColor: UIColor = UIColor.black,
                         shadowOffset: CGSize = CGSize(width: 0, height: 4),
                         shadowOpacity: Float = 0.1,
                         shadowRadius: CGFloat = 6) {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
}
