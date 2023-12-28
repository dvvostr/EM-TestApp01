import UIKit
import StudiqUI

class SplashViewController: BaseViewController {
    private var imageTextOffsetBottom: CGFloat = 32.0
    
    @IBOutlet weak var imageViewLogo: UIImageView?
    @IBOutlet weak var imageViewText: UIImageView?
    @IBOutlet weak var constraintImageTextBottom: NSLayoutConstraint?

    override func setup() {
        super.setup()
        constraintImageTextBottom?.constant = imageTextOffsetBottom
        imageViewText?.alpha = 0.0
    }
}
