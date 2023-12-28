import UIKit
import StudiqCore
import StudiqUI
import EMCustomPkg
import ImageSlideshow
import TagListView

class RoomSelectViewCell: UICollectionViewCell {
    @IBOutlet public weak var view: UIView?
    
    @IBOutlet public weak var viewSlideShow: EMImageSlideShow? {
        didSet {
            viewSlideShow?.layer.cornerRadius = 15.0
            viewSlideShow?.slideshowInterval = 5.0
        }
    }
    @IBOutlet public weak var viewRoomAbout: UIView? {
        didSet {
            viewRoomAbout?.layer.cornerRadius = 5.0
            viewRoomAbout?.backgroundColor = UIColor.Preset.tint.withAlphaComponent(0.1)
        }
    }
    @IBOutlet public weak var labelRoomAbout: UILabel? {
        didSet {
            labelRoomAbout?.font = Config.Fonts.Font(ofSize: 16.0)
            labelRoomAbout?.textColor = UIColor.Preset.tint
        }
    }
    @IBOutlet public weak var imageRoomAbout: UIImageView? {
        didSet {
            imageRoomAbout?.tintColor = UIColor.Preset.tint
            imageRoomAbout?.image = UIImage.Preset.chevron_right
        }
    }
    @IBOutlet public weak var viewTagList: TagListView? {
        didSet {
            viewTagList?.textFont = UIFont.systemFont(ofSize: 24)
            viewTagList?.tagBackgroundColor = UIColor.Preset.lightGray
            viewTagList?.cornerRadius = 5.0
            viewTagList?.textColor = UIColor.Preset.textSubtitle
            viewTagList?.textFont = Config.Fonts.Font(ofSize: 16, width: .medium)
            viewTagList?.paddingY = 8.0
            viewTagList?.paddingX = 12.0
            viewTagList?.marginX = 8.0
            viewTagList?.marginY = 8.0
            viewTagList?.alignment = .leading
        }
    }

    @IBOutlet public weak var labelRoomTitle: UILabel? {
        didSet {
            labelRoomTitle?.font = Config.Fonts.Font(ofSize: 22.0)
            labelRoomTitle?.textColor = UIColor.Preset.text
        }
    }
    @IBOutlet public weak var labelRoomPrice: UILabel? {
        didSet {
            labelRoomPrice?.font = Config.Fonts.Font(ofSize: 30.0, width: .medium)
            labelRoomPrice?.textColor = UIColor.Preset.text
        }
    }
    @IBOutlet public weak var labelRoomPriceDesc: UILabel? {
        didSet {
            labelRoomPriceDesc?.font = Config.Fonts.Font(ofSize: 16.0)
            labelRoomPriceDesc?.textColor = UIColor.Preset.textSubtitle
        }
    }

    @IBOutlet public weak var buttonChoise: CustomButton? {
       didSet {
       }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        view?.backgroundColor = UIColor.Preset.background
        view?.layer.cornerRadius = 12.0
        labelRoomAbout?.text = "\("Подробнее о номере".localized)"
        buttonChoise?.setTitle("Выбрать номер".localized, for: UIControl.State.normal)
        buttonChoise?.addTarget(self, action: #selector(RoomSelectViewCell.handleButtonClick), for: UIControl.Event.touchUpInside)
    }

    public var onItemClick: ObjectEvent?
    
    public var item: RoomSelectListItem? {
        didSet {
            var imageSource: [BundleImageSource] = []
            item?.images.forEach({
                imageSource.append(BundleImageSource(imageString: $0))
            })
            viewSlideShow?.setImageInputs(imageSource)
            labelRoomTitle?.text = item?.title
            labelRoomPrice?.text = (item?.price ?? 0.0) > 0 ? "\(item!.price.asCurrencyCeilString) ₽" : ""
            labelRoomPriceDesc?.text = item?.priceDesc ?? ""
            viewTagList?.removeAllTags()
            viewTagList?.addTags(item?.tags ?? [])
        }
    }
    
    @objc func handleImageClick() {
    }
    @objc private func handleButtonClick() {
        self.onItemClick?(self.item)
    }
}
extension RoomSelectViewCell: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
    }
}
