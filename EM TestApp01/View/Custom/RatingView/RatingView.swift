import UIKit
import StudiqUI

@IBDesignable open class RatingView: CustomXibView {
    @IBOutlet weak private var backgroundView: UIView?
    @IBOutlet weak private var imageView: UIImageView?
    @IBOutlet weak private var labelCaption: UILabel?
    
    open override func setupView() {
        super.setupView()
        self.backgroundView?.backgroundColor = UIColor.Preset.ratingBackground
        self.backgroundView?.layer.cornerRadius = 5.0

        labelCaption?.font = Config.Fonts.Font(ofSize: 16.0)
        labelCaption?.textColor = UIColor.Preset.ratingForeground

        imageView?.tintColor = UIColor.Preset.ratingForeground
        image = UIImage.Preset.star
    }
    open var image: UIImage? {
        didSet {
            self.imageView?.image = image
        }
    }
    open var caption: String? {
        didSet {
            self.labelCaption?.text = caption ?? ""
        }
    }
}
