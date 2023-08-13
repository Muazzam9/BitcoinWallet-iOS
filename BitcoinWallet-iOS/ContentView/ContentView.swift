import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel(rates: Rates(zar: 0, usd: 0, aud: 0)) // Initialize with initial rates
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter bitcoin amount", value: $vm.amount, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .onChange(of: vm.amount ?? 0.0) { newValue in
                            vm.updateAmount(newValue)}
                    Text("BTC")
                }
                .padding()
                
                List {
                    ForEach(vm.rates.currencies, id: \.self) { currency in
                        HStack {
                            Text(currency)
                                .bold()
                            Spacer()
                            Text("\(vm.calculate(rate: vm.rates, currency: currency), specifier: "%.2f")")
                                .padding()
                            Text(String(format: "%.2f%%", vm.fluctuationRates[currency]?.changePct ?? 0.0))
                                .foregroundColor(vm.fluctuationRates[currency]?.changePct ?? 0.0 > 0 ? .green : .red)
                        }
                    }
                }
                
            }
            .onAppear(perform: vm.refreshData)
            .navigationTitle("Bitcoin Wallet")
            .toolbar {
                ToolbarItem {
                    Button("Refresh", action: vm.refreshData)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
