import Foundation

class WalletAPI {
    
    let symbols = "ZAR,USD,AUD"
    let base = "BTC"
    let apiKey = Environment.fixerApiKey
    let baseUrlString = "https://api.apilayer.com/fixer"
    
    func fetchDummyData(_ completion: @escaping (Rates) -> Void) {
        let dummyRates = Rates(zar: 557351.936881, usd: 29387.6684, aud: 45253.918517)
            completion(dummyRates)
        }
    
    func fetchRates(_ completion:@escaping (Rates) -> ()) {
        let latestUrlString = baseUrlString + "/latest?symbols=\(symbols)&base=\(base)"
        guard
            let latestUrl = URL(string: latestUrlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: latestUrl, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "apikey")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else {
                print("Error: Could not retrieve data")
                return
            }
            do {
                let ratesData = try JSONDecoder().decode (ExchangeRates.self, from: data)
                completion (ratesData.rates)
            } catch {
                print("Error: \(error)")
            }
        }
        .resume()
        
    }
    
    func fetchFluctuationRates(_ completion:@escaping ([String: FluctuationRate]) -> ()) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let today = dateFormatter.string(from: Date())
        let yesterday = dateFormatter.string(from: Date().dayBefore)
        let fluctuationUrlString = baseUrlString + "/fluctuation?start_date=\(yesterday)&end_date=\(today)&symbols=\(symbols)&base=\(base)"

    //        Test previous date calc with hardcoded current date
    //        let testDate = dateFormatter.date(from: "2023-08-01")!
    //        let today = dateFormatter.string(from: testDate)
    //        let yesterday = dateFormatter.string(from: testDate.dayBefore)
    //        print(today)
    //        print(yesterday)
    //        Output:
    //        2023-08-01
    //        023-07-31

        guard
            let fluctuationUrl = URL(string: fluctuationUrlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: fluctuationUrl, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "apikey")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else {
                print("Error: Could not retrieve data")
                return
            }
            do {
                let fluctuationData = try JSONDecoder().decode (Fluctuation.self, from: data)
                completion (fluctuationData.rates)
            } catch {
                print("Error: \(error)")
            }
        }
        .resume()
        
    }
}
