import SwiftUI

struct LogIn: View {
    @State private var isFaded = false
    @State private var isPulsing = false
    @State private var hasPerformedAnimation = false
    
    var body: some View {
        NavigationView{
            VStack {
                
                Spacer()
                
                Text("Aplicatie")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.brightPink)
                    .offset(y: -75)
                    .opacity(isFaded ? 1 : 0)
                
                Spacer()
                
                VStack() {
                    if hasPerformedAnimation {
                        
                        NavigationLink(destination: SignIn()) {
                            Text("Sign in")
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.brightPink)
                                .frame(height: 50)
                                .cornerRadius(10)
                                .opacity(isFaded ? 1 : 0)
                        }
                        
                        NavigationLink(destination: SignUp()) {
                            Text("Create account")
                                .fontWeight(.heavy)
                                .foregroundColor(.brightPink)
                                .frame( height: 50)
                                .frame(maxWidth: .infinity)
                                .background(){
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.brightPink, lineWidth: 3)
                                        .frame(height: 50)
                                    
                                    
                                }
                                .opacity(isFaded ? 1 : 0)
                        }
                    }
                }
            }
            .overlay(
                Image("LogoTransparent")
                    .resizable()
                    .frame(width: isPulsing ? 100 : 400, height: isPulsing ? 100 : 400)
                    .offset(y: isPulsing ? -200 : -50)
                    .onAppear {
                        if !self.hasPerformedAnimation {                             DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            
                            withAnimation(Animation.easeInOut(duration: 2)) {
                                self.isPulsing = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    self.isFaded = true
                                }
                            }
                            self.hasPerformedAnimation = true
                        }
                        }
                    }
                .overlay(
                    Circle()
                            .stroke(Color.white, lineWidth: isPulsing ? 725 : 650)
                            .opacity(isFaded ? 0 : 1)
                            .offset(y: isPulsing ? -190 : 0)
                            .frame(width: 750, height: 750)
                    )
                )
            .padding()
        }
    }
}

struct LogInTeste_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
    }
}
