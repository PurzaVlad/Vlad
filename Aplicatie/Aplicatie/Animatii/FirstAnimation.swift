import SwiftUI

struct FirstAnimation: View {
    
    @State private var isAnimated = true
    @State private var overlayDisappear = false
    
    var body: some View {
        Image("LogoTransparent")
            .resizable()
            .frame(width: isAnimated ? 400 : 100, height: isAnimated ? 400 : 100)
            .offset(y: isAnimated ? -50 : -200)
            .overlay(
                Circle()
                    .stroke(Color.blue, lineWidth: isAnimated ? 400 : 50)
                    .offset(y: isAnimated ? 0 : -185)
                    .frame(width: isAnimated ? 500 : 75, height: isAnimated ? 500 : 75)
                    .opacity(overlayDisappear ? 0 : 1)

                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                                    withAnimation(Animation.easeInOut(duration: 1)) {
                                                        self.overlayDisappear = true
                                                    }
                                                }
                    }
            )
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation(Animation.easeInOut(duration: 2)){
                        self.isAnimated = false
                    }
                }
            }
    }
}

#Preview {
    FirstAnimation()
}
