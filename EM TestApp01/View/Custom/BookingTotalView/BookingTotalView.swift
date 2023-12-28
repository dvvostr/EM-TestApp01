import UIKit
import StudiqCore
import StudiqUI

@IBDesignable
public class BookingTotalView: CustomXibView {
    @IBOutlet public weak var conteinerView: UIView?
    
    @IBOutlet public weak var labelTourCaption: UILabel?
    @IBOutlet public weak var labelTourValue: UILabel?

    @IBOutlet public weak var labelFuelSurchargeCaption: UILabel?
    @IBOutlet public weak var labelFuelSurchargeValue: UILabel?

    @IBOutlet public weak var labelServiceFeeCaption: UILabel?
    @IBOutlet public weak var labelServiceFeeValue: UILabel?

    @IBOutlet public weak var labelTotalCaption: UILabel?
    @IBOutlet public weak var labelTotalValue: UILabel?
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

        createLabel(label: labelTourCaption, text: "Тур".localized, color: UIColor.Preset.textSubtitle, font: Config.Fonts.Font(ofSize: 16))
        createLabel(label: labelFuelSurchargeCaption, text: "Топливный сбор".localized, color: UIColor.Preset.textSubtitle, font: Config.Fonts.Font(ofSize: 16))
        createLabel(label: labelServiceFeeCaption, text: "Сервисный сбор".localized, color: UIColor.Preset.textSubtitle, font: Config.Fonts.Font(ofSize: 16))
        createLabel(label: labelTotalCaption, text: "К оплате".localized, color: UIColor.Preset.textSubtitle, font: Config.Fonts.Font(ofSize: 16))

        createLabel(label: labelTourValue, text: "186 600 ₽".localized, color: UIColor.Preset.text, font: Config.Fonts.Font(ofSize: 16))
        createLabel(label: labelFuelSurchargeValue, text: "9 300 ₽".localized, color: UIColor.Preset.text, font: Config.Fonts.Font(ofSize: 16))
        createLabel(label: labelServiceFeeValue, text: "2 136 ₽".localized, color: UIColor.Preset.text, font: Config.Fonts.Font(ofSize: 16))
        createLabel(label: labelTotalValue, text: "198 036 ₽".localized, color: UIColor.Preset.tint, font: Config.Fonts.Font(ofSize: 16, width: .medium))
    }
    
    private func invalidate() {
    }
      
    private func createLabel(label: UILabel?, text: String?, color: UIColor?, font: UIFont?) {
        label?.text = text
        label?.textColor = color
        label?.font = font
    }

}
