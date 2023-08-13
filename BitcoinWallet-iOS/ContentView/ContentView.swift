import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel(rates: Rates(zar: 0, usd: 0, aud: 0)) // Initialize with 0 rates
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter bitcoin amount", value: $vm.amount, format: .number)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        .onChange(of: vm.amount ?? 0.0) { newValue in
                            vm.updateAmount(newValue)
                        }
                    Text("BTC")
                        .foregroundColor(Color.black)
                        .font(Font.custom("Gilroy", size: 25))
                }
                .padding()
                
                List {
                    ForEach(vm.rates.currencies, id: \.self) { currency in
                        HStack {
                            Text(currency)
                                .font(.title3)
                                .bold()
                                .foregroundColor(Color.black)
                                .font(Font.custom("Gilroy", size: 20))
                            Spacer()
                            Text("\(vm.calculate(rate: vm.rates, currency: currency), specifier: "%.2f")")
                                .foregroundColor(Color.black)
                                .padding()
                                .font(Font.custom("Gilroy", size: 20))
                            Spacer()
                            HStack {
                                Text("\(vm.fluctuationRates[currency]?.changePct ?? 0.0, specifier: "%.2f")%")
                                    .foregroundColor(vm.fluctuationRates[currency]?.changePct ?? 0.0 > 0 ? Color(hex: "#C1F74E") : .red)
                                    .font(Font.custom("Gilroy", size: 20))
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }
                .listStyle(InsetGroupedListStyle())
                
                Button(action: {
                    withAnimation {
                        vm.refreshData()
                    }
                }) {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
                        .font(.title)
                        
                        .foregroundColor(Color.black)
                }
                .padding(.top, 10)
            }
            .onAppear(perform: vm.refreshData)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Bitcoin Wallet")
                            .font(Font.custom("Gilroy", size: 30))
                            .foregroundColor(Color.black)
                    }
                }
            }
            .background((Color(hex: "#C1F74E")).ignoresSafeArea())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
