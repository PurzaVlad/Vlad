import SwiftUI

struct LoadingViewFullScreen: View {
    
    @State private var isBreathing = false
    
    var body: some View {
        ZStack{
            Color.white
            VStack {
                Image("LogoTransparent")                         
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
            .overlay(
                Circle()
                    .stroke(Color.white, lineWidth: 155)
                    .frame(width: 230, height: 230)
                    .offset(y: -10)
            )
        }
    }
}

#Preview {
    LoadingViewFullScreen()
}
