import SwiftUI

struct LoadingViewPartial: View {
    
    @State private var isBreathing = false
    
    var body: some View {
        ZStack{
            Color.clear
            VStack {
                RoundedRectangle(cornerRadius: 15.0)
                    .foregroundColor(.white)
                    .frame(width:100, height: 100)
                    .offset(y: -5)
                
                    .overlay(
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
                    )
            }
        }
        .background(.thinMaterial)
    }
}

#Preview {
    LoadingViewPartial()
}
