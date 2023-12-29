import UIKit
import StudiqCore
import StudiqUI
import InputMask

@IBDesignable

public class TouristInfoView: CustomXibView {
    private let maskPassNumInputListener = MaskedTextInputListener(primaryFormat: "[0000] [000000]")
    private let maskDateInputListener = MaskedTextInputListener(primaryFormat: "[00]{.}[00]{.}[9900]")
    @IBOutlet public weak var conteinerView: UIView?
    @IBOutlet public weak var headerView: UIView?
    @IBOutlet public weak var bodyView: UIView?
    
    @IBOutlet public weak var labelCaption: UILabel? {
        didSet {
            self.labelCaption?.text = "Турист".localized
            self.labelCaption?.font = Config.Fonts.Font(ofSize: 22)
            self.labelCaption?.textColor = UIColor.Preset.text
        }
    }
    @IBOutlet public weak var buttonCaption: CustomButton? {
        didSet {
        }
    }
    
    @IBOutlet private weak var viewTouristName1: UIView?
    @IBOutlet private weak var labelTouristName1: UILabel?
    @IBOutlet private weak var inputTouristName1: UITextField?
    
    @IBOutlet private weak var viewTouristName2: UIView?
    @IBOutlet private weak var labelTouristName2: UILabel?
    @IBOutlet private weak var inputTouristName2: UITextField?

    @IBOutlet private weak var viewBornDate: UIView?
    @IBOutlet private weak var inputBornDate: UITextField? {
        didSet {
            inputBornDate?.delegate = maskDateInputListener
        }
    }
    
    @IBOutlet private weak var viewCitizenship: UIView?
    @IBOutlet private weak var inputCitizenship: UITextField?
    
    @IBOutlet private weak var viewPassportNum: UIView?
    @IBOutlet private weak var inputPassportNum: UITextField? {
        didSet {
            inputPassportNum?.delegate = maskPassNumInputListener
        }
    }
    
    @IBOutlet private weak var viewPassportDate: UIView? {
        didSet {
            inputPassportdate?.delegate = maskDateInputListener
        }
    }
    @IBOutlet private weak var inputPassportdate: UITextField?
    @IBOutlet public weak var constraintBodyViewTop: NSLayoutConstraint?
    
    public var onFrameUpadte: NotifyEvent?
    public var onButtonClick: NotifyEvent?

    
    public var currentHeigth: CGFloat {
        get {
            return headerHeight + (isExpended ? bodyHeight : 0.0)
        }
    }
    public var isExpended: Bool {
        get { return (self.constraintBodyViewTop?.constant ?? -1.0) == 0.0 }
        set {
            invalidate(newValue)
            self.constraintBodyViewTop?.constant = newValue ? 0.0 : -bodyHeight
        }
    }
    public var headerHeight: CGFloat {
        get {
            return self.headerView?.frame.height ?? 0
        }
    }
    public var bodyHeight: CGFloat {
        get {
            guard let height = self.bodyView?.frame.height else { return 0 }
            return height + 8
        }
    }
    public override func setupView() {
        super.setupView()
        self.backgroundColor = UIColor.Preset.background
        self.layer.cornerRadius = 15.0
        createInputCaption(label: labelTouristName1, text: "Имя".localized)
        createView(view: viewTouristName1)
        createInputField(input: inputTouristName1, placeholder: nil, value: "Иван".localized, keyboardType: .default)
        createInputCaption(label: labelTouristName2, text: "Фамилия".localized)
        createView(view: viewTouristName2)
        createInputField(input: inputTouristName2, placeholder: nil, value: "Иванов".localized, keyboardType: .default)
        createView(view: viewBornDate)
        createInputField(input: inputBornDate, placeholder: "Дата рождения".localized, value: nil, keyboardType: .numberPad)
        createView(view: viewCitizenship)
        createInputField(input: inputCitizenship, placeholder: "Гражданство", value: nil, keyboardType: .default)
        createView(view: viewPassportDate)
        createInputField(input: inputPassportdate, placeholder: "Срок действия загранпаспорта".localized, value: nil, keyboardType: .numberPad)
        createView(view: viewPassportNum)
        createInputField(input: inputPassportNum, placeholder: "Номер загранпаспорта".localized, value: nil, keyboardType: .numberPad)
        buttonCaption?.normalBackgroundColor = UIColor.Preset.tint.withAlphaComponent(0.1)
        buttonCaption?.selectedBackgroundColor = UIColor.Preset.tint
        buttonCaption?.normalForegroundColor = UIColor.Preset.tint
        buttonCaption?.selectedForegroundColor = UIColor.Preset.background
        buttonCaption?.imageOffset = 4
        buttonCaption?.borderWidth = 0
        buttonCaption?.normalBorderColor = UIColor.clear
        buttonCaption?.selectedBorderColor = UIColor.clear
        buttonCaption?.cornerRadius = 6
        buttonCaption?.addTarget(self, action: #selector(TouristInfoView.handleButtonClick), for: UIControl.Event.touchUpInside)
        invalidate(isExpended)
    }
    
    private func invalidate(_ expended: Bool) {
        if expended {
            buttonCaption?.setImage(UIImage.Preset.chevron_up)
        } else {
            buttonCaption?.setImage(UIImage.Preset.chevron_down)
        }
    }
    private func createView(view: UIView?) {
        view?.backgroundColor = UIColor.Preset.backgroundLight
        view?.layer.cornerRadius = 10.0
        view?.layer.masksToBounds = true
    }
      
    private func createInputCaption(label: UILabel?, text: String) {
        label?.textColor = UIColor.Preset.textSubtitle
        label?.font = Config.Fonts.Font(ofSize: 12)
        label?.text = text
    }
    private func createInputField(input: UITextField?, placeholder: String?, value: String?, keyboardType: UIKeyboardType) {
        input?.backgroundColor = UIColor.clear
        input?.borderStyle = .none
        input?.font = Config.Fonts.Font(ofSize: 16)
        input?.keyboardType = keyboardType
        input?.attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.Preset.textSubtitle,
                NSAttributedString.Key.font: Config.Fonts.Font(ofSize: 17) ?? UIFont.systemFont(ofSize: 17)
            ]
        )
        input?.text = value
    }
    @objc private func handleButtonClick() {
        self.isExpended = !self.isExpended
        self.onButtonClick?()
    }
}
