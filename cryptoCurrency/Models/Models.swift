import Foundation

struct Welcome: Codable {
    let Message: String?
    let Data: [Datum]?
}

struct Datum: Codable {
    let CoinInfo: CoinInfo?
    let DISPLAY: Display?
    let RAW: Raw?
    
}

struct CoinInfo: Codable {
    let Name: String?
    let FullName: String?
}

struct Display: Codable {
    let USD: DisplayUsd?
}

struct DisplayUsd: Codable {
    let PRICE: String?
    let VOLUME24HOUR: String?
    let CHANGE24HOUR:String?
}

struct Raw:Codable {
    let USD: RawUsd?
}

struct RawUsd:Codable {
    let CHANGE24HOUR: Double?
}

// MARK: - Second Module
struct Chart: Codable {
    let Data: DataClass?
}
struct DataClass: Codable {
    let Data: [Price]?
}

struct Price: Codable {
    let close: Double?
    let open: Double?
}








