import SwiftUI

struct TabBar: View {
    @State private var selectedTab = 1
    init() { UITabBar.appearance().backgroundColor = UIColor.systemGray6 }

    var body: some View {
        TabView(selection: $selectedTab) {
            CallsView()
                .tabItem {
                    Image(systemName: "phone.fill")
                    Text("Calls")
                }
                .tag(0)

            ChatView()
                .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                    Text("Chats")
                }
                .tag(1)

            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
                .tag(2)
        }
    }
}

#Preview {
    TabBar()
}
