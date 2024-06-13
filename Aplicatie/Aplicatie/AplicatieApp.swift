import SwiftUI

@main
struct AplicatieApp: App {
    var body: some Scene {
        WindowGroup {
            LogIn()
                .rotationEffect(.degrees(0))
                .preferredColorScheme(.light)       
        }
    }
}

extension View {
    @available(iOS 14, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
        return self
    }
}
