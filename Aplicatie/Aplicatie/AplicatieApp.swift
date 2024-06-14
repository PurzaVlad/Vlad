import SwiftUI

@main
struct AplicatieApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .rotationEffect(.degrees(0))
                .preferredColorScheme(.light)       
        }
    }
}

extension View {
    @available(iOS 17, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
        return self
    }
}
