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
        return splashWindow(level: .normal + 100, rootViewController: SplashViewController.fromNib())
    }()
    func splashWindow(level: UIWindow.Level, rootViewController: SplashViewController?) -> UIWindow {
        let scene = Layout.keyWindow?.windowScene
        let window: UIWindow
        if let scene = scene {
            window = UIWindow(windowScene: scene)
        } else {
            window = UIWindow()            
        }
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
