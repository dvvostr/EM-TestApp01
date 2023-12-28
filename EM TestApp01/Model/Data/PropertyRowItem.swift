import Foundation
import StudiqCore

@objc public final class PropertyRowItem: CustomDataResult {
    @objc var id: Int = -1
    @objc var caption: String?
    @objc var value: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case caption = "caption"
        case value = "value"
    }
    public required init(id: Int, caption: String?, value: String?) {
        super.init()
        self.id =  id
        self.caption = caption
        self.value = value
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
    public func assignTo(_ target: PropertyRowItem?) {
        target?.id = self.id
        target?.caption = caption
        target?.value = value
    }
    public func clone() -> PropertyRowItem {
        return PropertyRowItem(id: id, caption: caption, value: value)
    }
}
