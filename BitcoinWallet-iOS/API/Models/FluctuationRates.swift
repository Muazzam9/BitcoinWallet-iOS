import Foundation
struct Fluctuation: Codable {
    let success: Bool
    let fluctuation: Bool
    let startDate: String
    let endDate: String
    let base: String
    let rates: [String: FluctuationRate]
    
    private enum CodingKeys: String, CodingKey {
        case success, fluctuation, startDate = "start_date", endDate = "end_date", base, rates
    }
}

struct FluctuationRate: Codable {
    let startRate: Double
    let endRate: Double
    let change: Double
    let changePct: Double
    
    private enum CodingKeys: String, CodingKey {
        case startRate = "start_rate", endRate = "end_rate", change, changePct = "change_pct"
    }
}
