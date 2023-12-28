import UIKit
import StudiqCore
import StudiqUI

@IBDesignable
public class TouristAddView: CustomXibView {
    @IBOutlet public weak var conteinerView: UIView?
    
    @IBOutlet public weak var labelCaption: UILabel? {
        didSet {
            self.labelCaption?.text = "Добавить туриста".localized
            self.labelCaption?.font = Config.Fonts.Font(ofSize: 22)
            self.labelCaption?.textColor = UIColor.Preset.text
        }
    }
    @IBOutlet public weak var buttonCaption: UIButton? {
        didSet {
            self.buttonCaption?.setImage(UIImage.Preset.plus)
            self.buttonCaption?.backgroundColor = UIColor.Preset.tint.withAlphaComponent(0.1)
            self.buttonCaption?.tintColor = UIColor.Preset.text
            self.buttonCaption?.setBorderRadius(6.0)
            self.buttonCaption?.addTarget(self, action: #selector(TouristAddView.handleButtonClick), for: UIControl.Event.touchUpInside)
        }
    }
    
    public var onButtonClick: NotifyEvent?

    public var currentHeigth: CGFloat {
        get {
            return (self.conteinerView?.frame.height ?? 0.0)
        }
    }
    public override func setupView() {
        super.setupView()
        self.backgroundColor = UIColor.Preset.background
        self.layer.cornerRadius = 15.0
    }
    
    private func invalidate() {
    }
      
    @objc private func handleButtonClick() {
        self.onButtonClick?()
    }
}
