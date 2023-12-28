import Foundation
import StudiqCore
import StudiqUI

@objc public final class HotelItem: CustomDataResult {
    @objc var id: Int = -1
    @objc var title: String? = ""
    @objc var location: String? = ""
    @objc var feedback: String? = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case location = "location"
        case feedback = "feedback"
        case tags = "tags"
        case price = "price"
        case priceDesc = "priceDesc"
    }
    public required init(id: Int, title: String?, location: String?, feedback: String?) {
        super.init()
        self.id =  id
        self.title = title
        self.location = location
        self.feedback = feedback
    }
    public override init() {
        super.init()
    }
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    required convenience init(data: NSDictionary?) {
        self.init()
    }
    public func assignTo(_ target: HotelItem?) {
        target?.id = self.id
        target?.title = self.title
        target?.location = self.location
        target?.feedback = self.feedback
    }
    public func clone() -> HotelItem {
        return HotelItem(id: id, title: title, location: location, feedback: feedback)
    }
}
