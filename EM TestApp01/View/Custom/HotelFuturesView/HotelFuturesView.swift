import UIKit
import StudiqUI

open class HotelFuturesView: CustomXibView {
    @IBOutlet public weak var viewContainer: UIView?
    @IBOutlet private weak var viewStack: UIStackView?

    open override func setupView() {
        super.setupView()
        viewContainer?.backgroundColor = UIColor.Preset.backgroundLight
        viewContainer?.layer.cornerRadius = 15.0
        createFutures(view: viewStack, values: [
            HotelFutureItem(id: 1, title: "Удобства".localized, desc: "Самое необходимое".localized, image: "assets/icons/emoji_happy"),
            HotelFutureItem(id: 2, title: "Что включено".localized, desc: "Самое необходимое".localized, image: "assets/icons/tick_square"),
            HotelFutureItem(id: 3, title: "Что не включено".localized, desc: "Самое необходимое".localized, image: "assets/icons/close_square"),
        ])

    }
    private func createFutures(view: UIStackView?, values: [HotelFutureItem]) {
        view?.arrangedSubviews.forEach({ item in
            view?.removeArrangedSubview(item)
            item.removeFromSuperview()
        })
        view?.axis = .vertical
        view?.distribution = .fillEqually
        view?.alignment = .fill
        view?.spacing = 0.0
        view?.translatesAutoresizingMaskIntoConstraints = false
        values.forEach({ item in
            let row = UIView()
            let image = UIImageView(image: UIImage(named: item.image)?.withRenderingModeTemplate)
            image.tintColor = UIColor.Preset.text
            row.addSubview(image)
            image.anchorCenterYToSuperview(constant: 0)
            image.anchor(nil, left: row.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 24, heightConstant: 24)
            let chevron = UIImageView(image: UIImage(named: "assets/icons/chevron_right"))
            row.addSubview(chevron)
            chevron.tintColor = UIColor.Preset.text
            chevron.anchorCenterYToSuperview(constant: 0)
            chevron.anchor(nil, left: nil, bottom: nil, right: row.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 12, heightConstant: 12)
            let title = UILabel()
            row.addSubview(title)
            title.textColor = UIColor.Preset.text
            title.font = Config.Fonts.Font(ofSize: 16, width: .medium)
            title.text = item.title
            title.anchor(row.topAnchor, left: image.rightAnchor, bottom: nil, right: chevron.leftAnchor, topConstant: 10, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 19)
            let desc = UILabel()
            row.addSubview(desc)
            desc.textColor = UIColor.Preset.textSubtitle
            desc.font = Config.Fonts.Font(ofSize: 14, width: .medium)
            desc.text = item.desc
            desc.anchor(title.bottomAnchor, left: image.rightAnchor, bottom: row.bottomAnchor, right: chevron.leftAnchor, topConstant: 2, leftConstant: 8, bottomConstant: 10, rightConstant: 8, widthConstant: 0, heightConstant: 0)

            if (values.firstIndex(of: item) ?? 0 < values.count - 1) {
                let separator = UIView()
                row.addSubview(separator)
                separator.backgroundColor = UIColor.Preset.border
                separator.anchor(nil, left: desc.leftAnchor, bottom: row.bottomAnchor, right: chevron.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
            }
            view?.addArrangedSubview(row)
        })
        
    }
}
