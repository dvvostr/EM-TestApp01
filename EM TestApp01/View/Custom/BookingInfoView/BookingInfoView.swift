import UIKit
import StudiqCore
import StudiqUI
import EMCustomPkg

@IBDesignable
public class BookingInfoView: CustomXibView {
    @IBOutlet private weak var conteinerView: UIView?
    
    @IBOutlet private weak var labelDepartureCaption: UILabel?
    @IBOutlet private weak var labelDepartureValue: UILabel?
    @IBOutlet private weak var labelArrivalCaption: UILabel?
    @IBOutlet private weak var labelArrivalValue: UILabel?
    @IBOutlet private weak var labelDateCaption: UILabel?
    @IBOutlet private weak var labelDateValue: UILabel?
    @IBOutlet private weak var labelNightCountCaption: UILabel?
    @IBOutlet private weak var labelNightCountValue: UILabel?
    @IBOutlet private weak var labelHotelCaption: UILabel?
    @IBOutlet private weak var labelHotelValue: UILabel?
    @IBOutlet private weak var labelRoomCaption: UILabel?
    @IBOutlet private weak var labelRoomValue: UILabel?
    @IBOutlet private weak var labelNutritionCaption: UILabel?
    @IBOutlet private weak var labelNutritionValue: UILabel?
    
    @IBOutlet private weak var constraintRow1CaptionWidth: NSLayoutConstraint?
    @IBOutlet private weak var constraintRow2CaptionWidth: NSLayoutConstraint?
    @IBOutlet private weak var constraintRow3CaptionWidth: NSLayoutConstraint?
    @IBOutlet private weak var constraintRow4CaptionWidth: NSLayoutConstraint?
    @IBOutlet private weak var constraintRow5CaptionWidth: NSLayoutConstraint?
    @IBOutlet private weak var constraintRow6CaptionWidth: NSLayoutConstraint?
    @IBOutlet private weak var constraintRow7CaptionWidth: NSLayoutConstraint?

    public var onFrameUpdate: NotifyEvent?
    
    public var currentHeigth: CGFloat {
        get {
            self.conteinerView?.sizeToFit()
            return self.conteinerView?.frame.height ?? 0.0
        }
    }
    public var item: BookingInfoItem? {
        didSet {
            setValue(labelCaption: labelDepartureCaption, labelValue: labelDepartureValue, caption: "Вылет из".localized, value: self.item?.departure)
            setValue(labelCaption: labelArrivalCaption, labelValue: labelArrivalValue, caption: "Страна, город".localized, value: self.item?.arrival)
            setValue(labelCaption: labelDateCaption, labelValue: labelDateValue, caption: "Даты".localized, value: self.item?.date)
            setValue(labelCaption: labelNightCountCaption, labelValue: labelNightCountValue, caption: "Кол-во ночей".localized, value: self.item?.nightCount)
            setValue(labelCaption: labelHotelCaption, labelValue: labelHotelValue, caption: "Отель".localized, value: self.item?.hotel)
            setValue(labelCaption: labelRoomCaption, labelValue: labelRoomValue, caption: "Номер".localized, value: self.item?.room)
            setValue(labelCaption: labelNutritionCaption, labelValue: labelNutritionValue, caption: "Питание".localized, value: self.item?.nutrition)
            self.layoutIfNeeded()
            self.invalidate()
            onFrameUpdate?()
        }
    }
    public override func setupView() {
        super.setupView()
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.Preset.background
        self.layer.cornerRadius = 15.0
    }
    public override func layoutSubviews() {
        super.layoutSubviews()
        onFrameUpdate?()
    }
    private func setValue(labelCaption: UILabel?, labelValue: UILabel?, caption: String?, value: String?) {
        labelCaption?.textColor = UIColor.Preset.textSubtitle
        labelCaption?.font = Config.Fonts.Font(ofSize: 16.0)
        labelCaption?.text = caption
        labelValue?.textColor = UIColor.Preset.text
        labelValue?.font = Config.Fonts.Font(ofSize: 16.0)
        labelValue?.text = value
    }
    
    public func invalidate() {
        let minValue: CGFloat = 52.0
        var maxWidth: CGFloat = max(labelDepartureCaption?.frame.width ?? minValue, labelArrivalCaption?.frame.width ?? minValue)
        maxWidth = max(maxWidth, labelDateCaption?.frame.width ?? minValue)
        maxWidth = max(maxWidth, labelNightCountCaption?.frame.width ?? minValue)
        maxWidth = max(maxWidth, labelHotelCaption?.frame.width ?? minValue)
        maxWidth = max(maxWidth, labelRoomCaption?.frame.width ?? minValue)
        maxWidth = max(maxWidth, labelNutritionCaption?.frame.width ?? minValue)
        constraintRow1CaptionWidth?.constant = maxWidth
        constraintRow2CaptionWidth?.constant = maxWidth
        constraintRow3CaptionWidth?.constant = maxWidth
        constraintRow4CaptionWidth?.constant = maxWidth
        constraintRow5CaptionWidth?.constant = maxWidth
        constraintRow6CaptionWidth?.constant = maxWidth
        constraintRow7CaptionWidth?.constant = maxWidth
    }
       
}
