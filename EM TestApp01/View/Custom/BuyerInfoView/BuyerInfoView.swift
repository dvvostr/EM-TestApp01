import UIKit
import StudiqCore
import StudiqUI
import InputMask

@IBDesignable

public class BuyerInfoView: CustomXibView {
    private let maskPhoneInputListener = MaskedTextInputListener(primaryFormat: "+7 ([000]) [000]-[00]-[00]")

    @IBOutlet public weak var conteinerView: UIView?
    @IBOutlet public weak var labelCaption: UILabel? {
        didSet {
            self.labelCaption?.textColor = UIColor.Preset.text
            self.labelCaption?.font = Config.Fonts.Font(ofSize: 22.0)
            self.labelCaption?.text = "Информация о покупателе".localized
        }
    }
    @IBOutlet public weak var viewPhone: UIView? {
        didSet {
            self.viewPhone?.backgroundColor = UIColor.Preset.backgroundLight
            self.viewPhone?.layer.cornerRadius = 10.0
            self.viewPhone?.layer.masksToBounds = true
        }
    }
    @IBOutlet public weak var labelInputPhoneCaption: UILabel? {
        didSet {
            self.labelInputPhoneCaption?.textColor = UIColor.Preset.textSubtitle
            self.labelInputPhoneCaption?.font = Config.Fonts.Font(ofSize: 12.0)
            self.labelInputPhoneCaption?.text = "Номер телефона"
        }
    }
    @IBOutlet public weak var inputPhone: UITextField? {
        didSet{
            self.inputPhone?.backgroundColor = UIColor.clear
            self.inputPhone?.borderStyle = .none
            self.inputPhone?.font = Config.Fonts.Font(ofSize: 16.0)
            self.inputPhone?.keyboardType = .phonePad
            self.inputPhone?.delegate = maskPhoneInputListener
            self.inputPhone?.text = "+7 (951) 555-99-00"
        }
    }
    @IBOutlet public weak var labelInputEmailCaption: UILabel? {
        didSet {
            self.labelInputEmailCaption?.textColor = UIColor.Preset.textSubtitle
            self.labelInputEmailCaption?.font = Config.Fonts.Font(ofSize: 12)
            self.labelInputEmailCaption?.text = "Почта"
        }
    }
    @IBOutlet public weak var viewEmail: UIView? {
        didSet {
            self.viewEmail?.backgroundColor = UIColor.Preset.backgroundLight
            self.viewEmail?.layer.cornerRadius = 10.0
            self.viewEmail?.layer.masksToBounds = true
        }
    }
    @IBOutlet public weak var inputEmail: UITextField? {
        didSet {
            self.inputEmail?.backgroundColor = UIColor.clear
            self.inputEmail?.borderStyle = .none
            self.inputEmail?.font = Config.Fonts.Font(ofSize: 16.0)
            self.inputEmail?.keyboardType = .emailAddress
            self.inputEmail?.text = "examplemail.000@mail.ru"
        }
    }
    @IBOutlet public weak var labelDesc: UILabel? {
        didSet {
            self.labelDesc?.textColor = UIColor.Preset.textSubtitle
            self.labelDesc?.font = Config.Fonts.Font(ofSize: 14.0)
            self.labelDesc?.text = "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту".localized
        }
    }

    public var onFrameUpadte: NotifyEvent?
    
    public var currentHeigth: CGFloat {
        get {
            return self.conteinerView?.frame.height ?? 0.0
        }
    }
    public var item: PropertyRowItem? {
        didSet {
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
