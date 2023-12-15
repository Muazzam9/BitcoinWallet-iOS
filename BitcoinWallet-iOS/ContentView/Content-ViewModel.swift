import Foundation
import SwiftUI

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var rates: Rates
        @Published var fluctuationRates: [String: FluctuationRate]
        @Published var amount: Double?
        
        init(rates: Rates) {
            self.rates = rates
            self.fluctuationRates = [:]
            self.loadSavedAmount()
        }
        
        func saveAmount() {
            UserDefaults.standard.set(amount, forKey: "SavedAmountKey")
        }
        
        // Function to load the saved amount from UserDefaults
        func loadSavedAmount() {
            if let savedAmount = UserDefaults.standard.value(forKey: "SavedAmountKey") as? Double {
                amount = savedAmount
            }
        }
        
        func updateAmount(_ newAmount: Double) {
            amount = newAmount
            // Save the updated amount
            saveAmount()
        }
        
        func calculate(rate: Rates, currency: String) -> Double {
            switch currency {
            case "ZAR":
                return (amount ?? 0.0) * rate.zar
            case "USD":
                return (amount ?? 0.0) * rate.usd
            case "AUD":
                return (amount ?? 0.0) * rate.aud
            default:
                // Handle unknown currency
                return 0.0
            }
        }
        
        // Function used to get most up to date
        func refreshData() {
            let walletAPI = WalletAPI()
#if DEBUG
            walletAPI.fetchDummyData { dummyRates in
                DispatchQueue.main.async {
                    withAnimation {
                        self.rates = dummyRates
                    }
                    print("Successfully got dummy rates: ZAR \(dummyRates.zar), USD \(dummyRates.usd), AUD \(dummyRates.aud)")
                }
            }
#else
            walletAPI.fetchRates { result in
                DispatchQueue.main.async {
                    withAnimation {
                        self.rates = result
                    }
                    print("Successfully got rates: ZAR \(self.rates.zar), USD \(self.rates.usd), AUD \(self.rates.aud)")
                }
            }
            
            walletAPI.fetchFluctuationRates { result in
                DispatchQueue.main.async {
                    withAnimation {
                        self.fluctuationRates = result
                    }
                    
                    if let zarChangePct = self.fluctuationRates["ZAR"]?.changePct,
                       let usdChangePct = self.fluctuationRates["USD"]?.changePct,
                       let audChangePct = self.fluctuationRates["AUD"]?.changePct {
                        print("Successfully got Fluctuation Rates: ZAR \(zarChangePct), USD \(usdChangePct), AUD \(audChangePct)")
                    } else {
                        print("Failed to get Fluctuation Rates")
                    }
                }
            }
#endif
        }
    }
}
