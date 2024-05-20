import SwiftUI

struct LogIn: View {
    @State private var isFaded = false
    @State private var isPulsing = false
    @State private var signInOpacity = 0.0 // Initial opacity for the "Sign in" button
    @State private var hasPerformedAnimation = false // Track whether the animation has been performed

    var body: some View {
        NavigationView{
            VStack {
                /*HStack {
                    Spacer()
                    NavigationLink(destination: Home()) {
                        Text("Skip")
                            .font(.body)
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                    }
                    .padding()
                }*/
                Spacer()
                Image("LogoTransparent")
                    .resizable()
                    .frame(width: isPulsing ? 100 : 400, height: isPulsing ? 100 : 400)
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
                            self.hasPerformedAnimation = true // Set the flag to indicate that animation has been performed
                        }
                        }
                    }
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: isPulsing ? 475 : 400)
                            .opacity(isFaded ? 0 : 1)
                            .offset(y: isPulsing ? min(10, UIScreen.main.bounds.height * 0.1) : 35) // Limit the offset
                            .frame(width: 500, height: 500)
                    )
                    .offset(y: isPulsing ? -min(0, UIScreen.main.bounds.height * 0.2) : 50)
                    .padding(.top)
                Text("Aplicatie")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.brightPink)
                    .opacity(isFaded ? 1 : 0)

                Spacer()
                
                VStack() {
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
                            .frame(height: 50)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(){
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.brightPink, lineWidth: 3)
                                               .frame(height: 50)


                            }
                            .opacity(isFaded ? 1 : 0)
                    }
                }
                .padding()
            }
        }
    }
}

struct LogInTeste_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
    }
}
