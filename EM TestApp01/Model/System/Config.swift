import Foundation
import UIKit

public protocol CustomDefaultProtocol {
    static func initialize()
}

public let DEBUG_PRINT = true

public struct Config: CustomDefaultProtocol {
    public static func initialize() {
        Images.initialize()
        Fonts.initialize()
        Network.initialize()
    }
    public static let isFirstRun: Bool = true
    
    public struct Fonts: CustomDefaultProtocol {
        public static func initialize() {
        }
        private static let FRONT_FAMILY = "SF-Pro-Display"
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
            return UIFont(
                name: name,
                size: ofSize
            ) ?? UIFont.systemFont(ofSize: ofSize)
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
