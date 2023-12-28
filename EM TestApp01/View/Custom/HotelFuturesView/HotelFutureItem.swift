import Foundation
import StudiqCore
import StudiqUI

public final class HotelFutureItem: CustomListDataItem {
    @objc var id: Int = -1
    @objc var title: String = ""
    @objc var desc: String = ""
    @objc var image: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case desc = "desc"
        case image = "picture"
    }
    public required override init() {
        super.init()
    }
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let _container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try (_container.decodeIfPresent(Int.self, forKey: .id) ?? 0)
        self.title = try (_container.decodeIfPresent(String.self, forKey: .title) ?? "")
        self.desc = try (_container.decodeIfPresent(String.self, forKey: .desc) ?? "")
        self.image = try (_container.decodeIfPresent(String.self, forKey: .image) ?? "")
    }
    public required init(id: Int, title: String, desc: String, image: String) {
        super.init()
        self.id = id
        self.title = title
        self.desc = desc
        self.image = image
    }
    public required init(data: NSDictionary?) {
        super.init(data: data)
        self.id = (data?[CodingKeys.id.rawValue] as? Int ?? 0)
        self.title = (data?[CodingKeys.title.rawValue] as? String ?? "")
        self.desc = (data?[CodingKeys.desc.rawValue] as? String ?? "")
        self.image = (data?[CodingKeys.image.rawValue] as? String ?? "")
    }
}
