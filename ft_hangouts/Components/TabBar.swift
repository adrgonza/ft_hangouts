//
//  TabBar.swift
//  ft_hangouts
//
//  Created by Adrian Gonzalez Serrano on 17.02.2025.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            CallsView()
                .tabItem { Text("Calls") }
                .tag(2)
            ChatView()
                .tabItem { Text("Chats") }
                .tag(1)
            SettingsView()
                .tabItem { Text("Settigns") }
                .tag(3)
        }
    }
}

#Preview {
    TabBar()
}
