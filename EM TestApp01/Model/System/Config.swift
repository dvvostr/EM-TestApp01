import Foundation
import UIKit
import StudiqCore
import StudiqUI
import EMCustomPkg

public protocol CustomDefaultProtocol {
    static func initialize()
}

public let DEBUG_PRINT = true

public struct Config: CustomDefaultProtocol {
    public static func initialize() {
        UINavigationBar.appearance().backIndicatorImage = UIImage.chevron_back
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage.chevron_back
        UINavigationBar.appearance().tintColor = UIColor.Preset.tint
        // Get rid of black bar undetneath navbar
        CustomControl.Defaults.Color.background = UIColor.Preset.background
        CustomControl.Defaults.Color.foreground = UIColor.Preset.foreground
        CustomControl.Defaults.Color.modalBackground = UIColor.Preset.modalBackground
        CustomControl.Defaults.Color.border = UIColor.Preset.border
        CustomControl.Defaults.Color.tint = UIColor.Preset.tint
        CustomControl.Defaults.Color.text = UIColor.Preset.text
        CustomControl.Defaults.cornerRadius = 12
        CustomControl.Defaults.borderWidth = 4.0
        CustomControl.Defaults.textFont = Config.Fonts.Font(ofSize: 16)
        CustomControl.Defaults.buttonFont = Config.Fonts.Font(ofSize: 16)
        CustomControl.Defaults.inputFont = Config.Fonts.Font(ofSize: 16)
        CustomControl.Defaults.titleFont = Config.Fonts.Font(ofSize: 18, width: .medium)
        CustomControl.Defaults.smallFont = Config.Fonts.Font(ofSize: 12)
        CustomControl.Defaults.CustomAlert.Buttons.buttonOKSettings.caption = "OK".localized
        CustomControl.Defaults.CustomAlert.Buttons.buttonCancelSettings.caption = "Cancel".localized

        CustomControl.Defaults.Control.SlideShow.Color.activePageIndicator = UIColor.Preset.defaultNegative
        CustomControl.Defaults.Control.SlideShow.Color.inactivePageIndicator = UIColor.Preset.defaultNegative.withAlphaComponent(0.17)
        CustomControl.Defaults.Control.Button.borderRadius = 15
        CustomControl.Defaults.Control.Button.titleFont = Config.Fonts.Font(ofSize: 16, width: .semibold)
        CustomControl.Defaults.titleFont = Config.Fonts.Font(ofSize: 18, width: .semibold)
        CustomControl.Defaults.Control.Button.Color.Normal.border = UIColor.Preset.tint
        CustomControl.Defaults.Control.Button.Color.Normal.background = UIColor.Preset.tint
        CustomControl.Defaults.Control.Button.Color.Normal.foreground = UIColor.Preset.background
        CustomControl.Defaults.Control.Button.Color.Selected.border = UIColor.Preset.tint.withAlphaComponent(0.8)
        CustomControl.Defaults.Control.Button.Color.Selected.background = UIColor.Preset.tint.withAlphaComponent(0.65)
        CustomControl.Defaults.Control.Button.Color.Selected.foreground = UIColor.Preset.background
        
        

        // MARK: Navigation bar appearance
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.Preset.background
        appearance.shadowColor = UIColor.clear
        appearance.shadowImage = UIImage()
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.Preset.text
        ]
        // MARK: Navigation back item appearance

        let backItemAppearance = UIBarButtonItemAppearance()
        backItemAppearance.normal.titleTextAttributes = [
            .foregroundColor : UIColor.Preset.text
        ]
        appearance.backButtonAppearance = backItemAppearance
        let image = UIImage.Preset.chevron_back
        appearance.setBackIndicatorImage(image, transitionMaskImage: image)
        
        UINavigationBar.appearance().tintColor = UIColor.Preset.text
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = appearance
        // MARK: Tab bar appearance
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor.Preset.background
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        UITabBar.appearance().standardAppearance = tabBarAppearance
        
        Images.initialize()
        Fonts.initialize()
        Network.initialize()
    }
    public static let isFirstRun: Bool = true
    
    public struct Fonts: CustomDefaultProtocol {
        public static func initialize() {
        }
        private static let FRONT_FAMILY = "SFProDisplay"
        public enum Width {
            case `default`
            case black
            case bold
            case heavy
            case light
            case medium
            case regular
            case semibold
            case thin
            case ultralight
            
            public var description: String {
                switch self {
                case .default   : return "Regular"
                case .black     : return "Black"
                case .bold      : return "Bold"
                case .heavy     : return "Heavy"
                case .light     : return "Light"
                case .medium    : return "Medium"
                case .regular   : return "Regular"
                case .semibold  : return "Semibold"
                case .thin      : return "Thin"
                case .ultralight: return "Ultralight"
                }
            }
        }
        public enum Decoration {
            case `default`
            case italic
            
            public var description: String {
                switch self {
                case .default   : return ""
                case .italic    : return "Italic"
                }
            }
        }
        public static let fontFamily: String = FRONT_FAMILY
        
        public static func Font(ofSize: CGFloat, width: Width = .default, decoration: Decoration = .default) -> UIFont {
            let name = "\(FRONT_FAMILY)-\(width.description)\(decoration.description)"
            let font = UIFont(
                name: name,
                size: ofSize
            )
            return font ?? UIFont.systemFont(ofSize: ofSize)
         }
    }
    public struct Images: CustomDefaultProtocol {
        public static func initialize() {
        }
    }
    public struct Network: CustomDefaultProtocol {
        public static var serviceURL: String?
        public static var profileEntry: String? {
            get {
                guard let url = serviceURL else {return nil}
                return "\(url)/api/classes/"
            }
        }
        public static func initialize() {
            serviceURL = (Bundle.main.infoDictionary?["ServiceURL"] as! String)
        }
    }
}
