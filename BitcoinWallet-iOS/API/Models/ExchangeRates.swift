import Foundation

struct ExchangeRates: Codable {
    let success: Bool
    let timestamp: Int
    let base: String
    let date: String
    let rates: Rates
}

struct Rates: Codable {
    let zar: Double
    let usd: Double
    let aud: Double

    enum CodingKeys: String, CodingKey {
        case zar = "ZAR"
        case usd = "USD"
        case aud = "AUD"
    }
}
