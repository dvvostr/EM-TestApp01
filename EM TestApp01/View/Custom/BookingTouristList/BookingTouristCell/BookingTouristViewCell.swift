import UIKit
import StudiqCore
import StudiqUI
import EMCustomPkg

class BookingTouristViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public var onItemClick: ObjectEvent?
    
    public var item: BookingTouristItem? {
        didSet {
        }
    }
    
}
