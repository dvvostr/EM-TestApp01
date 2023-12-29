import UIKit
import StudiqCore
import StudiqUI
import EMCustomPkg

class BookingTouristViewCell: UICollectionViewCell {
    @IBOutlet public weak var viewName1: UIView?
    @IBOutlet public weak var viewName2: UIView?
    @IBOutlet public weak var viewBornDate: UIView?
    @IBOutlet public weak var viewCitizenship: UIView?
    @IBOutlet public weak var viewPassportNum: UIView?
    @IBOutlet public weak var viewPassportDate: UIView?

    @IBOutlet public weak var captionName1: UILabel?
    @IBOutlet public weak var inputName1: UITextField?
    @IBOutlet public weak var captionName2: UILabel?
    @IBOutlet public weak var inputName2: UITextField?
    @IBOutlet public weak var inputBornDate: UITextField?
    @IBOutlet public weak var inputCitizenship: UITextField?
    @IBOutlet public weak var inputPassportNum: UITextField?
    @IBOutlet public weak var inputPassportDate: UITextField?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.Preset.background
        self.roundCorners(corners: [.bottomRight, .bottomLeft], radius: 12)
        captionName1?.text = "Имя".localized
        captionName2?.text = "Фамилия".localized
        inputName1?.placeholder = "".localized
        inputName2?.placeholder = "".localized
        inputBornDate?.placeholder = "Дата рождения".localized
        inputCitizenship?.placeholder = "Гражданство".localized
        inputPassportNum?.placeholder = "Номер загранпаспорта".localized
        inputPassportDate?.placeholder = "Срок действия загранпаспорта".localized
    }
    public var onItemClick: ObjectEvent?
    
    public var item: BookingTouristItem? {
        didSet {
            inputName1?.text = item?.name1 ?? ""
            inputName2?.text = item?.name2 ?? ""
            inputBornDate?.text = item?.bornDate ?? ""
            inputCitizenship?.text = item?.citizenship ?? ""
            inputPassportNum?.text = item?.passportNum ?? ""
            inputPassportDate?.text = item?.passportDate ?? ""
        }
    }
    
}
