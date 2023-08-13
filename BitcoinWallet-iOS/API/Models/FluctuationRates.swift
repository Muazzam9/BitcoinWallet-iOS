import Foundation
struct Fluctuation: Codable {
    let success: Bool
    let fluctuation: Bool
    let startDate: String
    let endDate: String
    let base: String
    let rates: [String: FluctuationRate]
    
    private enum CodingKeys: String, CodingKey {
        case success
        case fluctuation
        case startDate = "start_date"
        case endDate = "end_date"
        case base
        case rates
    }
}

struct FluctuationRate: Codable {
    let startRate: Double
    let endRate: Double
    let change: Double
    let changePct: Double
    
    private enum CodingKeys: String, CodingKey {
        case startRate = "start_rate"
        case endRate = "end_rate"
        case change
        case changePct = "change_pct"
    }
}
