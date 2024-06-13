import SwiftUI

struct ResetPassword: View {
    @State private var password: String = ""
    @State private var isPasswordVisible = false
    @State private var email: String = ""
    @State private var username: String = ""
    
    var body: some View {
        VStack {
            Image("LogoTransparent")
                .resizable()
                .frame(width: 50.0, height: 50.0)
                .padding()
            
            HStack{
                Text("Enter your email address and we'll send you a reset link.")
                    .multilineTextAlignment(.center)
                    .gridColumnAlignment(.center)
                    .padding()
            }
            .padding()
            
            HStack {
                TextField("", text: $email, prompt: Text("Email").foregroundColor(.gray))
                    .frame(height: 20)
                    .foregroundColor(.black)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("fadedPink"))
                    )
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Spacer()
            
            NavigationLink(destination: Home()) {
                Text("Send Verification Email")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("brightPink"))
                            .frame(height:50)
                    )
                    .cornerRadius(10)
            }
            
            .buttonStyle(PlainButtonStyle())
            .padding(.horizontal)
            .padding(.bottom, 60)
            
        }
        .background(Color.white)
        .navigationBarTitle(Text("Reset Password"), displayMode: .inline)
        .navigationBarTitleTextColor(.brightPink)
        .accentColor(.black)
    }
}


#Preview {
    ResetPassword()
}
