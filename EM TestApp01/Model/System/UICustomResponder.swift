import UIKit

open class UICustomResponder: UIResponder {
    @objc public var window: UIWindow?

    private var splashPresenter: SplashPresenterDescription? = SplashPresenter()

    public override init() {
        super.init()
    }
    public func initialize(responder: UIResponder){
        Config.initialize()
        self.setSystem()
        if let _ = responder as? UIApplication {
            self.window = UIWindow(frame: UIScreen.main.bounds)
        } else if #available(iOS 13.0, *), let _responder = responder as? UIWindowScene {
            self.window = UIWindow(windowScene: _responder)
        } else {
        }
        self.window?.makeKeyAndVisible()

        self.window?.rootViewController = UINavigationController(rootViewController: HomeViewController.fromNib())

        splashPresenter?.present()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.splashPresenter?.dismiss(completion: { [weak self] in
                self?.splashPresenter = nil
            })
        })

    }
    private func setSystem(){
    }
}
