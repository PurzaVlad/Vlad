import SwiftUI
import Foundation

struct Home: View {
    
    @State private var isLoading: Bool = true
    
    var body: some View {
        
        ZStack {
            if isLoading{
                LoadingView()
            } else {
                ScrollView{
                    ForEach(1...5, id: \.self) { number in
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.white)
                            .frame(height:300)
                            .overlay(
                                Text("Muie")
                            )
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.isLoading = false
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
}



#Preview {
    Home()
}

