import Foundation

import StudiqCore
import StudiqUI

@objc public final class BookingTouristItem: CustomDataResult {
    @objc var id: Int = -1
    @objc var name1: String?
    @objc var name2: String?
    @objc var bornDate: String?
    @objc var citizenship: String?
    @objc var passportNum: String?
    @objc var passportDate: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name1 = "name1"
        case name2 = "name2"
        case bornDate = "bornDate"
        case citizenship = "citizenship"
        case passportNum = "passportNum"
        case passportDate = "passportDate"
    }
    public required init(id: Int, name1: String?, name2: String?, bornDate: String?, citizenship: String?, passportNum: String?, passportDate: String?) {
        super.init()
        self.id =  id
        self.name1 = name1
        self.name2 = name2
        self.bornDate = bornDate
        self.citizenship = citizenship
        self.passportNum = passportNum
        self.passportDate = passportDate
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
    public func assignTo(_ target: BookingTouristItem?) {
        target?.id = self.id
        target?.name1 = name1
        target?.name2 = name2
        target?.bornDate = bornDate
        target?.citizenship = citizenship
        target?.passportNum = passportNum
        target?.passportDate = passportDate
    }
    public func clone() -> BookingTouristItem {
        return BookingTouristItem(id: id, name1: name1, name2: name2, bornDate: bornDate, citizenship: citizenship, passportNum: passportNum, passportDate: passportDate)
    }
}
