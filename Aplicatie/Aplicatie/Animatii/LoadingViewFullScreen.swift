import SwiftUI

struct LoadingViewFullScreen: View {
    
    @State private var isBreathing = false
    
    var body: some View {
        ZStack{
            Color.white
            VStack {
                Image("LogoNas")
                    .frame(width: 50, height: 50)
                    .offset(y: -50)
                    .scaleEffect(isBreathing ? 0.8 : 1)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                            withAnimation {
                                self.isBreathing.toggle()
                            }
                        }
                    }
                
            }
        }
    }
}

#Preview {
    LoadingViewFullScreen()
}
