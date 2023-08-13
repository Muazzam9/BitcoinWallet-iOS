import SwiftUI

struct LaunchScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        ZStack {
            Color(hex: "#C1F74E")
                .edgesIgnoringSafeArea(.all)
            if isActive {
                ContentView()
            } else {
                VStack {
                    VStack {
                        Image("FlashLogo")
                            .resizable()
                            .scaledToFit()
                        Text("Bitcoin Wallet")
                            .font(Font.custom("Gilroy", size: 64))
                            .foregroundColor(.black.opacity(0.80))
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
