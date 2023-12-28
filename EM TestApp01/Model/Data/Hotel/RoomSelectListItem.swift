import Foundation
import StudiqCore
import StudiqUI

@objc public final class RoomSelectListItem: CustomListDataItem {
    @objc var id: Int = -1
    @objc var object: Int = -1
    @objc var title: String = ""
    @objc var images: [String] = []
    @objc var tags: [String] = []
    @objc var price: Double = 0.0
    @objc var priceDesc: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case object = "object"
        case title = "title"
        case images = "images"
        case tags = "tags"
        case price = "price"
        case priceDesc = "priceDesc"
    }
    public override init() {
        super.init()
    }
    public required init(id: Int, object: Int, title: String, images: [String], tags: [String], price: Double, priceDesc: String) {
        super.init()
        self.id =  id
        self.object = object
        self.title = title
        self.images = images
        self.tags = tags
        self.price = price
        self.priceDesc = priceDesc
    }
    
    required init(data: NSDictionary?) {
        super.init(data: data)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    public func assignTo(_ target: RoomSelectListItem?) {
        target?.id = self.id
        target?.object = self.object
        target?.title = self.title
        target?.images = self.images
        target?.tags = self.tags
        target?.price = self.price
        target?.priceDesc = self.priceDesc
    }
    public func clone() -> RoomSelectListItem {
        return RoomSelectListItem(id: id, object: object, title: title, images: images, tags: tags, price: price, priceDesc: priceDesc)
    }
}
