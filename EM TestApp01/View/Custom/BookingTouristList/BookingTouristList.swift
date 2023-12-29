import UIKit
import StudiqCore
import StudiqUI

@IBDesignable
class BookingTouristList: CustomXibView {
    public var items: [BookingTouristItem]? {
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
    override func setupView() {
        super.setupView()
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        setupCollectionView()
        self.collectionView?.reloadData()
    }

    func loadData(items: [BookingTouristItem], completion: @escaping OnDataResult) {
        self.items = items
        completion(DataResult.success, nil)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.setHeight(collectionView?.collectionViewLayout.collectionViewContentSize.height ?? 0)
    }
}

extension BookingTouristList: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    private func setupCollectionView() {
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.backgroundColor = UIColor.clear
        
        let size = NSCollectionLayoutSize(
            widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
            heightDimension: NSCollectionLayoutDimension.fractionalWidth(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: 1)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        section.interGroupSpacing = 8

        let headerFooterSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(58)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: "SectionHeaderElementKind",
            alignment: .top
        )
        section.boundarySupplementaryItems = [sectionHeader]

        let layout = UICollectionViewCompositionalLayout(section: section)
        collectionView?.collectionViewLayout = layout
        
        let rowClass = BookingTouristViewCell.self
        let nib = UINib(nibName: String(describing: rowClass), bundle: Bundle(for: rowClass))
        collectionView?.register(nib, forCellWithReuseIdentifier: String(describing: rowClass))
        collectionView?.alwaysBounceVertical = false
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (items?.count ?? 0) > 0 ? 1 : 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingTouristViewCell", for: indexPath) as! BookingTouristViewCell
        cell.item = items?[indexPath.section]
        cell.onItemClick = { obj in
    //
        }
        return cell
    }



}
