import SwiftUI

struct LoadingViewPartial: View {
    
    @State private var isBreathing = false
    
    var body: some View {
        ZStack{
            Color.clear
            VStack {
                Image("LogoTransparent")
                    .frame(width: 50, height: 50)
                    .offset(y: -100)
                    .scaleEffect(isBreathing ? 0.8 : 1)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                            withAnimation {
                                self.isBreathing.toggle()
                            }
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 5.0)
                            .stroke(Color.blue, lineWidth: 180)
                            .frame(width: 300, height: 800)
                            .offset(y: -50)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 5.0)
                            .stroke(Color.clear, lineWidth: 15)
                            .frame(width: 300, height: 400)
                            .offset(y: -50)
                            .background(.thinMaterial)
                    )
            }
            .overlay(
                RoundedRectangle(cornerRadius: 5.0)
                    .stroke(Color.black, lineWidth: 110)
                    .frame(width: 160, height: 160)
                    .offset(y: -50))
        }
    }
}

#Preview {
    LoadingViewPartial()
}
