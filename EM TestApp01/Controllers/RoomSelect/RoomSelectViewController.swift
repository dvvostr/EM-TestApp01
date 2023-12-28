import UIKit
import StudiqCore
import StudiqUI
import EMCustomPkg

class RoomSelectViewController: TitledBaseViewController {

    let items_ = [
        "Lorem ipsum dolor sit amet.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "Lorem ipsum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.",
    ]
    public var hotel: HotelItem?
    public var items: [RoomSelectListItem]? {
        didSet {
            self.collectionView?.reloadData()
            self.collectionView?.collectionViewLayout.invalidateLayout()
        }
    }
    @IBOutlet public weak var collectionView: UICollectionView? {
        didSet {
            self.collectionView?.showsHorizontalScrollIndicator = false
            self.collectionView?.showsVerticalScrollIndicator = false
            self.collectionView?.backgroundColor = UIColor.clear
        }
    }
    override func setup() {
        super.setup()
        view.backgroundColor = UIColor.Preset.backgroundLight
        setupCollectionView()
        self.collectionView?.reloadData()
    }
    
    func loadData(hotel: HotelItem?, items: [RoomSelectListItem], completion: @escaping OnDataResult) {
        self.hotel = hotel
        self.items = items
        completion(DataResult.success, nil)
    }
}

extension RoomSelectViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    private func setupCollectionView() {
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        let size = NSCollectionLayoutSize(
            widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
            heightDimension: NSCollectionLayoutDimension.estimated(44)
        )
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: 1)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        section.interGroupSpacing = 10

        let headerFooterSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(0)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: "SectionHeaderElementKind",
            alignment: .top
        )
        section.boundarySupplementaryItems = [sectionHeader]

        let layout = UICollectionViewCompositionalLayout(section: section)
        collectionView?.collectionViewLayout = layout
        
        let rowClass = RoomSelectViewCell.self
        let nib = UINib(nibName: String(describing: rowClass), bundle: Bundle(for: rowClass))
        collectionView?.register(nib, forCellWithReuseIdentifier: String(describing: rowClass))
        collectionView?.alwaysBounceVertical = false
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoomSelectViewCell", for: indexPath) as! RoomSelectViewCell
        cell.item = items?[indexPath.row]
        cell.onItemClick = { obj in
//            let controller = BookingViewController.fromNib()
//            controller.captionFont = Config.Fonts.SFProDisplayMedium(size: 18) ?? UIFont.systemFont(ofSize: 18)
//            controller.captionText = "Бронирование".localized
//            if let item = obj as? RoomSelectListItem {
//                controller.loadData(hotel: self.hotel?.clone(), item: item.clone()) { result, data in
//                    if result.isSuccess {
//                        self.navigationController?.pushViewController(controller, animated: true)
//                    }
//                }
//            }
        }
        return cell
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { context in
            self.collectionView?.collectionViewLayout.invalidateLayout()
        }, completion: nil)
    }


}
