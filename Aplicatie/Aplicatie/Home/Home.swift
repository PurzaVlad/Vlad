import SwiftUI

struct Home: View {
    
    @State private var isLoading: Bool = true
    
    var body: some View {
        ScrollView{
            ForEach(1...5, id: \.self) { number in
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                    .frame(height:300)
                    .overlay(
                        Text("ceva")
                    )
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.isLoading = false
            }
        }
        .overlay(
            isLoading ? AnyView(LoadingViewFullScreen()) : AnyView(EmptyView())
        )
        .navigationBarBackButtonHidden(true)
        .padding()
        
    }
}

#Preview {
    Home()
}

