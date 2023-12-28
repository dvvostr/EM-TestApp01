import UIKit
import StudiqUI

extension UIColor {
    public struct Preset {
        internal static let defaultPositive = (Layout.keyWindow?.rootViewController?.traitCollection.userInterfaceStyle ?? .light == .dark) ? UIColor.black : UIColor.white
        internal static let defaultNegative = (Layout.keyWindow?.rootViewController?.traitCollection.userInterfaceStyle ?? .light == .dark) ? UIColor.white : UIColor.black
        
        internal static var background: UIColor {
            return UIColor(named: "colorBackground") ?? defaultPositive
        }
        internal static var backgroundLight: UIColor {
            return UIColor(named: "colorBackgroundLight") ?? defaultPositive
        }
        internal static var foreground: UIColor {
            return mediumGray
        }
        internal static var lightGray: UIColor {
            return UIColor(named: "colorLightGray") ?? defaultNegative.withAlphaComponent(0.35)
        }
        internal static var mediumGray: UIColor {
            return UIColor(named: "colorMediumGray") ?? defaultNegative.withAlphaComponent(0.45)
        }
        internal static var text: UIColor {
            return UIColor(named: "colorText") ?? defaultNegative
        }
        internal static var textSubtitle: UIColor {
            return UIColor(named: "colorTextSubtitle") ?? defaultNegative.withAlphaComponent(0.65)
        }
        internal static var tint: UIColor {
            return UIColor(named: "colorTint") ?? defaultNegative
        }
        internal static var border: UIColor {
            return UIColor(named: "colorBorder") ?? defaultNegative.withAlphaComponent(0.15)
        }
        internal static var ratingForeground: UIColor {
            return UIColor(named: "colorRatingForeground") ?? defaultNegative
        }
        internal static var ratingBackground: UIColor {
            return UIColor(named: "colorRatingBackground") ?? defaultNegative.withAlphaComponent(0.20)
        }
        internal static var modalBackground: UIColor {
            return lightGray
        }

        
    }
}

