
import UIKit
import x3Core
import x3UI

class BookingViewController: UIX3CustomViewController {
    public var hotel: HotelItem? {
        didSet { viewHotelInfo?.item = hotel }
    }
    public var item: RoomSelectListItem?
    
    @IBOutlet public weak var scrollView: UIScrollView? {
        didSet {
            self.scrollView?.backgroundColor = UIColor.clear
        }
    }
    @IBOutlet public weak var scrollContainerView: UIView? {
        didSet {
            self.scrollContainerView?.backgroundColor = Config.Colors.backgroundGray
        }
    }
    @IBOutlet public weak var viewHotelInfo: HotelInfoView? {
        didSet {
            self.viewHotelInfo?.layer.cornerRadius = 12.0
            self.viewHotelInfo?.layer.masksToBounds = true
            self.viewHotelInfo?.item = self.hotel
        }
    }
    @IBOutlet public weak var viewHotelInfoHeightConstraint: NSLayoutConstraint?

    @IBOutlet public weak var viewBookingInfo: BookingInfoView? {
        didSet {
            self.viewBookingInfo?.layer.cornerRadius = 12.0
            self.viewBookingInfo?.layer.masksToBounds = true
            self.viewBookingInfo?.onFrameUpadte = {
                self.viewBookingInfoHeightConstraint?.constant = self.viewBookingInfo?.currentHeigth ?? 0.0
            }
            self.viewBookingInfo?.item = BookingInfoItem(
                id: 0,
                departure: "Санкт-Петербург",
                arrival: "Египет, Хургада",
                date: "19.09.2023 – 27.09.2023",
                nightCount: "\(7) ночей",
                hotel: "Steigenberger Makadi",
                room: "Стандартный с видом на бассейн или сад",
                nutrition: "Все включено")
        }
    }
    @IBOutlet public weak var viewBookingInfoHeightConstraint: NSLayoutConstraint?
    @IBOutlet public weak var viewTouristInfo1: TouristInfoView? {
        didSet {
            self.viewTouristInfo1?.labelCaption?.text = "Первый турист".localized
            self.viewTouristInfo1?.layer.cornerRadius = 12.0
            self.viewTouristInfo1?.layer.masksToBounds = true
            self.viewTouristInfo1?.onButtonClick = {
                self.handleTouristInfoExpandedChange(self.viewTouristInfo1)
            }
            self.viewTouristInfo1?.onFrameUpadte = {
                self.viewTouristInfo1HeightConstraint?.constant = self.viewTouristInfo1?.currentHeigth ?? 0.0
            }
        }
    }
    @IBOutlet public weak var viewTouristInfo1HeightConstraint: NSLayoutConstraint?
    @IBOutlet public weak var viewTouristInfo2: TouristInfoView? {
        didSet {
            self.viewTouristInfo2?.labelCaption?.text = "Второй турист".localized
            self.viewTouristInfo2?.layer.cornerRadius = 12.0
            self.viewTouristInfo2?.layer.masksToBounds = true
            self.viewTouristInfo2?.onButtonClick = {
                self.handleTouristInfoExpandedChange(self.viewTouristInfo2)
            }
            self.viewTouristInfo2?.onFrameUpadte = {
                self.viewTouristInfo2HeightConstraint?.constant = self.viewTouristInfo2?.currentHeigth ?? 0.0
            }
        }
    }
    @IBOutlet public weak var viewTouristInfo2HeightConstraint: NSLayoutConstraint?
    
    @IBOutlet public weak var viewTouristAdd: TouristAddView? {
        didSet {
            self.viewTouristAdd?.labelCaption?.text = "Добавить туриста".localized
            self.viewTouristAdd?.layer.cornerRadius = 12.0
            self.viewTouristAdd?.layer.masksToBounds = true
            self.viewTouristAdd?.onButtonClick = {
                self.handleButtonTouristAddClick()
            }
        }
    }
    
    @IBOutlet public weak var viewBuyerInfoView: BuyerInfoView? {
        didSet {
            self.viewBuyerInfoView?.layer.cornerRadius = 12.0
            self.viewBuyerInfoView?.layer.masksToBounds = true
            self.viewBuyerInfoView?.onFrameUpadte = {
                self.viewBuyerInfoHeightConstraint?.constant = self.viewBuyerInfoView?.currentHeigth ?? 0.0
            }
        }
    }
    @IBOutlet public weak var viewBuyerInfoHeightConstraint: NSLayoutConstraint?

    @IBOutlet public weak var viewBookingTotal: BookingTotalView? {
        didSet {
            self.viewBookingTotal?.layer.cornerRadius = 12.0
            self.viewBookingTotal?.layer.masksToBounds = true
        }
    }
    
    override func setupView() {
        super.setupView()
        view.backgroundColor = Config.Colors.backgroundGray
    }
    @IBOutlet public weak var buttonExecute: UIButton? {
       didSet {
           self.buttonExecute?.tintColor = Config.Colors.tint
           self.buttonExecute?.setBorderRadius(15)
           self.buttonExecute?.setTitle("Оплатить 198 036 ₽".localized, for: UIControl.State.normal)
           self.buttonExecute?.titleLabel?.font = Config.Fonts.SFProDisplayMedium(size: 16)
           self.buttonExecute?.addTarget(self, action: #selector(BookingViewController.handleButtonExecuteClick), for: UIControl.Event.touchUpInside)
       }
   }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.viewHotelInfoHeightConstraint?.constant = viewHotelInfo?.currentHeigth ?? 0.0
        viewBookingInfo?.invalidate()
        self.viewBookingInfoHeightConstraint?.constant = viewBookingInfo?.currentHeigth ?? 0.0
        self.viewBuyerInfoView?.layoutIfNeeded()
        self.viewBuyerInfoHeightConstraint?.constant = viewBuyerInfoView?.currentHeigth ?? 0.0
        self.viewTouristInfo1HeightConstraint?.constant = viewTouristInfo1?.currentHeigth ?? 0.0
        self.viewTouristInfo2HeightConstraint?.constant = viewTouristInfo2?.currentHeigth ?? 0.0
    }
        
    func loadData(hotel: HotelItem?, item: RoomSelectListItem?, completion: @escaping OnDataResult) {
        self.hotel = hotel
        self.item = item
        completion(DataResult.success, nil)
    }
    @objc private func handleButtonExecuteClick() {
        let controller = FinishViewController.fromNib()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @objc private func handleButtonTouristAddClick() {
    }
    @objc private func handleTouristInfoExpandedChange(_ obj: TouristInfoView?) {
        if !(obj?.isExpended ?? true ) {
            obj?.buttonCaption?.setImage(Config.Images.iconChevronUp)
            obj?.constraintBodyViewTop?.constant = 0
        } else {
            obj?.buttonCaption?.setImage(Config.Images.iconChevronDown)
            obj?.constraintBodyViewTop?.constant = -(obj?.bodyHeight ?? 0)
        }
        obj?.layoutIfNeeded()
    }
}
