import SwiftUI
import Foundation

struct Home: View {
    
    @State private var isLoading: Bool = true
    
    var body: some View {
        
        ZStack {
            if isLoading{
                LoadingView()
            } else {
                
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.isLoading = false
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    Home()
}

