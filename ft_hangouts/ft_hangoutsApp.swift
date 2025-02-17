import SwiftUI

@main
struct ft_hangoutsApp: App {
    init() {
        UIView.appearance().overrideUserInterfaceStyle = .dark
        let window = UIWindow.appearance()
        window.backgroundColor = UIColor.black
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
                .background(Color.black)
        }
    }
}
