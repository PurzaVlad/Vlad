import SwiftUI

struct SignIn: View {
    @State private var password: String = ""
    @State private var isPasswordVisible = false
    @State private var email: String = ""
    @State private var username: String = ""
    
    var body: some View {
        VStack() {
            
            Image("LogoTransparent")
                .resizable()
                .frame(width: 50.0, height: 50.0)
                .padding()
                
            HStack{
                
                TextField("",text:$email,prompt: Text("Email")
                    .foregroundColor(.gray))
                .frame(height:20)
                .foregroundColor(.black)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.fadedPink))
                .cornerRadius(10)
                
            }
            .padding(.horizontal)

            HStack {
                
                if isPasswordVisible {
                    TextField("", text: $password)
                } else {
                    SecureField("", text: $password, prompt:
                                    Text("Password")
                        .foregroundColor(.gray))
                }
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.fill" :"eye.slash.fill")
                        .foregroundColor(.gray)
                        .font(.footnote)                }
            }
            .frame(height:20)
            .foregroundColor(.black)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.fadedPink)
            )
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: ResetPassword()) {
                    Text("Forgot Password?")
                        .font(.callout)
                        .bold()
                        .foregroundColor(.brightPink)
            }
            .padding(.horizontal)

            NavigationLink(destination: Home()) {
                Text("Sign in")
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.brightPink)
                            .frame(height:50)
                    )
                    .cornerRadius(10)
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.horizontal)
            .padding(.bottom, 60)
        }
        .background(Color.white)
        .navigationBarTitle(Text("Sign in"), displayMode: .inline)
        .navigationBarTitleTextColor(.brightPink)
        .overlay(
            ZStack(){
                Color.white
                    .frame(height: 60)
                    .opacity(1)
                    .edgesIgnoringSafeArea(.bottom)

                VStack{
                    Divider()
                        .padding(.vertical)
                    
                    HStack {
                        
                        Text("Don't have an account?")
                            .foregroundColor(.black)
                            .font(.callout)
                            .fontWeight(.regular)
                        NavigationLink(destination: SignUp()) {
                            Text("Sign up")
                                .foregroundColor(.brightPink)
                                .font(.callout)
                                .fontWeight(.regular)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea(.keyboard)
        )
    }
}

#Preview{
    SignIn()
}

