import UIKit
import TagListView
import StudiqUI
import StudiqCore
import EMCustomPkg
import ImageSlideshow

class HomeViewController: TitledBaseViewController {
    private let localImages = ["assets/slides/slide1", "assets/slides/slide2", "assets/slides/slide3", "assets/slides/slide4", "assets/slides/slide5"]
    private let localSource = [
        BundleImageSource(imageString: "assets/slides/slide1"),
        BundleImageSource(imageString: "assets/slides/slide2"),
        BundleImageSource(imageString: "assets/slides/slide3"),
        BundleImageSource(imageString: "assets/slides/slide4"),
        BundleImageSource(imageString: "assets/slides/slide5")
    ]

    @IBOutlet public weak var scrollView: UIScrollView? {
        didSet {
            self.scrollView?.backgroundColor = UIColor.clear
        }
    }
    @IBOutlet public weak var scrollContainerView: UIView? {
        didSet {
            self.scrollContainerView?.backgroundColor = UIColor.Preset.mediumGray
        }
    }
    @IBOutlet public weak var viewTop: UIView? {
        didSet {
            self.viewTop?.backgroundColor = UIColor.Preset.background
            self.viewTop?.clipsToBounds = true
            self.viewTop?.roundCorners(corners: [.bottomRight,.bottomLeft], radius: 12)
        }
    }
    @IBOutlet public weak var viewAbout: UIView? {
        didSet {
            self.viewAbout?.backgroundColor = UIColor.Preset.background
            self.viewAbout?.clipsToBounds = true
            self.viewAbout?.roundCorners(corners: [.all], radius: 12)
        }
    }

    @IBOutlet public weak var slideShow: EMImageSlideShow?
    @IBOutlet public weak var viewRating: RatingView?
    @IBOutlet public weak var labelHotelName: UILabel? {
        didSet {
            labelHotelName?.font = Config.Fonts.Font(ofSize: 22)
            labelHotelName?.textColor = UIColor.Preset.text
        }
    }
    @IBOutlet public weak var labelLocation: UILabel? {
        didSet {
            labelLocation?.font = Config.Fonts.Font(ofSize: 14)
            labelLocation?.textColor = UIColor.Preset.tint
        }
    }
    @IBOutlet public weak var labelPriceValue: UILabel? {
        didSet {
            labelPriceValue?.font = Config.Fonts.Font(ofSize: 30, width: .medium)
            labelPriceValue?.textColor = UIColor.Preset.text
        }
    }
    
    @IBOutlet public weak var labelPriceDesc: UILabel? {
        didSet {
            labelPriceDesc?.font = Config.Fonts.Font(ofSize: 16)
            labelPriceDesc?.textColor = UIColor.Preset.textSubtitle
        }
    }
    @IBOutlet public weak var labelAboutCaption: UILabel? {
        didSet {
            labelAboutCaption?.font = Config.Fonts.Font(ofSize: 22, width: .medium)
            labelAboutCaption?.textColor = UIColor.Preset.text
        }
    }
    @IBOutlet public weak var tagListView: TagListView? {
        didSet {
            tagListView?.textFont = UIFont.systemFont(ofSize: 24)
            tagListView?.tagBackgroundColor = UIColor.Preset.lightGray
            tagListView?.cornerRadius = 5.0
            tagListView?.textColor = UIColor.Preset.textSubtitle
            tagListView?.textFont = Config.Fonts.Font(ofSize: 16, width: .medium)
            tagListView?.paddingY = 7.0
            tagListView?.paddingX = 12.0
            tagListView?.marginX = 8.0
            tagListView?.marginY = 8.0
            tagListView?.alignment = .leading
        }
    }
    @IBOutlet public weak var labelAboutDesc: UILabel? {
        didSet {
            labelAboutDesc?.font = Config.Fonts.Font(ofSize: 16)
            labelAboutDesc?.textColor = UIColor.Preset.text
        }
    }
    @IBOutlet public weak var buttonNext: CustomButton? {
        didSet {
            buttonNext?.cornerRadius = 15
            buttonNext?.normalBorderColor = UIColor.Preset.tint
            buttonNext?.selectedBackgroundColor = UIColor.Preset.tint.withAlphaComponent(0.45)
            buttonNext?.normalForegroundColor = UIColor.Preset.background
            buttonNext?.selectedForegroundColor = UIColor.Preset.background
        }
    }

    @IBOutlet public weak var viewFutures: HotelFuturesView? {
        didSet {
        }
    }

    override func setup() {
        super.setup()
        self.captionText = "Hotel".localized
        
        slideShow?.delegate = self
        slideShow?.setImageInputs(localSource)
        viewRating?.caption = "5 \("Excellent".localized)"
        labelHotelName?.text = "Steigenberger Makadi".localized
        labelLocation?.text = "Madinat Makadi, Safaga Road, Makadi Bay, Египет".localized
        labelPriceValue?.text = "\("от".localized) \("134 673") \("₽")"
        labelPriceDesc?.text = "за тур с перелётом"
        labelAboutCaption?.text = "About hotel".localized
        labelAboutDesc?.text = "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!"
        tagListView?.addTags(["3-я линия".localized, "Платный Wi-Fi в фойе".localized, "30 км до аэропорта".localized, "1 км до пляжа".localized])
        buttonNext?.setTitle("К выбору номера".localized)
        buttonNext?.addTarget(self, action: #selector(handleNextClick(sender: )), for: .touchUpInside)
    }

    @objc private func handleNextClick(sender: Any?) {
        let controller = RoomSelectViewController.fromNib()
        controller.captionText = "Steigenberger Makadi".localized
        let items: [RoomSelectListItem] = [
            RoomSelectListItem(id: 1, object: 1, title: "Стандартный с видом на бассейн или сад".localized, images: localImages, tags: ["Все включено", "Кондиционер"], price: 186600, priceDesc: "за 7 ночей с перелётом".localized),
            RoomSelectListItem(id: 2, object: 2, title: "Стандартный с видом на бассейн или сад".localized, images: localImages, tags: ["Все включено", "Кондиционер"], price: 186600, priceDesc: "за 7 ночей с перелётом".localized),
//            RoomSelectListItem(id: 3, object: 3, title: "Стандартный с видом на бассейн или сад".localized, images: localImages, tags: ["Все включено", "Кондиционер"], price: 186600, priceDesc: "за 7 ночей с перелётом".localized),

        ]
        controller.loadData(hotel: HotelItem(id: -1, title: self.labelHotelName?.text, location: labelLocation?.text, feedback: viewRating?.caption), items: items) { result, data in
            if result.isSuccess {
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
}

extension HomeViewController {
    @objc private func handleImageClick() {
    }
}

extension HomeViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
    }
}
