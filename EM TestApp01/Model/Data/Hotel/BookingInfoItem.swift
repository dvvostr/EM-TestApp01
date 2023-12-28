import Foundation

import StudiqCore
import StudiqUI

@objc public final class BookingInfoItem: CustomDataResult {
    @objc var id: Int = -1
    @objc var departure: String?
    @objc var arrival: String?
    @objc var date: String?
    @objc var nightCount: String?
    @objc var hotel: String?
    @objc var room: String?
    @objc var nutrition: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case departure = "departure"
        case arrival = "arrival"
        case date = "date"
        case nightCount = "nightCount"
        case hotel = "hotel"
        case room = "room"
        case nutrition = "nutrition"
    }
    public required init(id: Int, departure: String?, arrival: String?, date: String?, nightCount: String?, hotel: String?, room: String?, nutrition: String?) {
        super.init()
        self.id =  id
        self.departure = departure
        self.arrival = arrival
        self.date = date
        self.nightCount = nightCount
        self.hotel = hotel
        self.room = room
        self.nutrition = nutrition
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
    public func assignTo(_ target: BookingInfoItem?) {
        target?.id = self.id
        target?.departure = departure
        target?.arrival = arrival
        target?.date = date
        target?.nightCount = nightCount
        target?.hotel = hotel
        target?.room = room
        target?.nutrition = nutrition
    }
    public func clone() -> BookingInfoItem {
        return BookingInfoItem(id: id, departure: departure, arrival: arrival, date: date, nightCount: nightCount, hotel: hotel, room: room, nutrition: nutrition)
    }
}
