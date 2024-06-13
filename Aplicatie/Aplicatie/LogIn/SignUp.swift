import SwiftUI

struct SignUp: View {
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
            
            HStack {
                TextField("", text: $username, prompt: Text("Username").foregroundColor(.gray))
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
            
            HStack {
                if isPasswordVisible {
                    TextField("", text: $password)
                } else {
                    SecureField("", text: $password, prompt: Text("Password").foregroundColor(.gray))
                }
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
            }
            .frame(height: 20)
            .foregroundColor(.black)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("fadedPink"))
            )
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: Home()) {
                Text("Create account")
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
        .navigationBarTitle(Text("Sign up"), displayMode: .inline)
        .navigationBarTitleTextColor(.brightPink)
        .overlay(
            ZStack {
                Color.white
                    .frame(height: 60)
                    .opacity(1)
                    .edgesIgnoringSafeArea(.bottom)
                
                VStack {
                    Divider()
                        .padding(.vertical)
                    
                    HStack {
                        Text("Already have an account?")
                            .font(.callout)
                            .fontWeight(.regular)
                            .foregroundColor(.black)
                        NavigationLink(destination: SignIn()) {
                            Text("Sign In")
                                .foregroundColor(Color("brightPink"))
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


#Preview {
    SignUp()
}
