import UIKit
import StudiqCore
import StudiqUI

@IBDesignable
public class HotelInfoView: CustomXibView {
    
    @IBOutlet public weak var conteinerView: UIView?
    @IBOutlet public weak var viewState: UIView? {
        didSet {
            viewState?.layer.cornerRadius = 5.0
            viewState?.backgroundColor = UIColor.Preset.ratingBackground
        }
    }
    @IBOutlet public weak var imageState: UIImageView? {
        didSet {
            imageState?.tintColor = UIColor.Preset.ratingForeground
            imageState?.image = UIImage.Preset.star
        }
    }
    @IBOutlet public weak var labelState: UILabel? {
        didSet {
            labelState?.font = Config.Fonts.Font(ofSize: 16.0)
            labelState?.textColor = UIColor.Preset.ratingForeground
        }
    }
    @IBOutlet public weak var labelTitle: UILabel? {
        didSet {
            labelTitle?.font = Config.Fonts.Font(ofSize: 22.0)
            labelTitle?.textColor = UIColor.Preset.text
        }
    }
    @IBOutlet public weak var labelLocation: UILabel? {
        didSet {
            labelLocation?.font = Config.Fonts.Font(ofSize: 14.0)
            labelLocation?.textColor = UIColor.Preset.tint
        }
    }
    
    public var currentHeigth: CGFloat {
        get {
            return self.conteinerView?.frame.height ?? 0.0
        }
    }

    public var item: HotelItem? {
        didSet {
            labelTitle?.text = item?.title
            labelLocation?.text = item?.location
            labelState?.text = item?.feedback

            self.invalidate()
        }
    }
    public override func setupView() {
        super.setupView()
        self.backgroundColor = UIColor.Preset.background
        self.layer.cornerRadius = 15.0
    }
    
    private func invalidate() {
        
    }
    
}

