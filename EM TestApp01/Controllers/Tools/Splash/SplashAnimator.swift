import UIKit
import QuartzCore
import StudiqUI

protocol SplashAnimatorDescription {
    func animateAppearance()
    func animateDisappearance(completion: (() -> Void)?)
}

final class SplashAnimator: SplashAnimatorDescription {
    
    private unowned let splashWindow: UIWindow
    private unowned let splashController: SplashViewController
    
    // MARK: - Initialization
    
    init(window: UIWindow) {
        self.splashWindow = window
        guard let splashController = splashWindow.rootViewController as? SplashViewController else {
                fatalError("Splash window doesn't have splash root view controller!")
        }
        self.splashController = splashController
    }

    func animateAppearance() {
        splashWindow.isHidden = false
        splashController.imageViewText?.alpha = 0.0
        splashController.imageViewText?.transform = CGAffineTransform(translationX: 0, y: 32)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            UIView.animate(withDuration: 0.5, animations: {
                self.splashController.imageViewLogo?.transform = CGAffineTransform(scaleX: 88/72, y: 88/72)
                self.splashController.imageViewText?.alpha = 1.0
                self.splashController.imageViewText?.transform = .identity
            })
        })
    }
    func animateDisappearance(completion: (() -> Void)?) {
        UIView.animate(withDuration: 0.6, delay: 0.1, options: [], animations: {
            self.splashWindow.alpha = 0
        }) { _ in
            completion?()
        }
    }
}
