import Foundation
import UIKit
import StudiqCore
import StudiqUI

protocol SplashPresenterDescription {
    func present()
    func dismiss(completion: (() -> (Void))?)
}

final class SplashPresenter: SplashPresenterDescription {
    private lazy var animator: SplashAnimatorDescription = SplashAnimator(window: window)
    
    private lazy var window: UIWindow = {
        return splashWindow(level: .normal + 100, rootViewController: SplashViewController.fromNib(), isHiddenLogo: false)
    }()
    func splashWindow(level: UIWindow.Level, rootViewController: SplashViewController?, isHiddenLogo: Bool = false) -> UIWindow {
        let scene = Layout.keyWindow?.windowScene
        rootViewController?.isHiddenLogo = isHiddenLogo
        let window = if let scene = scene { UIWindow(windowScene: scene) } else { UIWindow() }
        window.frame = CGRect(x: 0,  y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        window.rootViewController = rootViewController
        window.windowLevel = level
        window.isHidden = false
        return window
    }
    func present() {
        animator.animateAppearance()
    }
    func dismiss(completion: (() -> (Void))?) {
        animator.animateDisappearance(completion: completion)
    }
    
    
}
