import Foundation

class WalletAPI {
    
    private let symbols = "ZAR,USD,AUD"
    private let base = "BTC"
    private let apiKey = Environment.fixerApiKey
    private let baseUrlString = "https://api.apilayer.com/fixer"
    
    private func fetchData(from urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil, nil)
            return
        }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "apikey")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            completion(data, error)
        }
        .resume()
    }
    
    // Fetch dummy data to reduce real api requests
    func fetchDummyData(_ completion: @escaping (Rates) -> Void) {
        let dummyRates = Rates(zar: 557351.936881, usd: 29387.6684, aud: 45253.918517)
        completion(dummyRates)
    }
    
    // Fetch real currency rates from API
    func fetchRates(_ completion:@escaping (Rates) -> ()) {
        let latestUrlString = "\(baseUrlString)/latest?symbols=\(symbols)&base=\(base)"
        fetchData(from: latestUrlString) { data, error in
            guard let data = data else {
                print("Error: Could not retrieve data")
                return
            }
            do {
                let ratesData = try JSONDecoder().decode(ExchangeRates.self, from: data)
                completion(ratesData.rates)
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    // Fetch real currency fluctuation percentages from API
    func fetchFluctuationRates(_ completion:@escaping ([String: FluctuationRate]) -> ()) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let today = dateFormatter.string(from: Date())
        let yesterday = dateFormatter.string(from: Date().dayBefore)
        let fluctuationUrlString = "\(baseUrlString)/fluctuation?start_date=\(yesterday)&end_date=\(today)&symbols=\(symbols)&base=\(base)"

        fetchData(from: fluctuationUrlString) { data, error in
            guard let data = data else {
                print("Error: Could not retrieve data")
                return
            }
            do {
                let fluctuationData = try JSONDecoder().decode(Fluctuation.self, from: data)
                completion(fluctuationData.rates)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
