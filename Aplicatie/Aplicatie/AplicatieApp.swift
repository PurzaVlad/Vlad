import SwiftUI

@main
struct AplicatieApp: App {
    var body: some Scene {
        WindowGroup {
            LogIn()
                .rotationEffect(.degrees(0))
                .preferredColorScheme(.light) // Apply dark mode based on toggle

        }
    }
}
