import SwiftUI

struct ChatData: Identifiable {
    let id = UUID()
    let name: String
    let profileImage: String
    let lastMessage: String
    let time: String
    let unreadMessages: Int
}

struct CreateContactView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var phone: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Contact Info")) {
                    TextField("Name", text: $name)
                    TextField("Phone", text: $phone)
                }
            }
            .navigationTitle("Create Contact")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        dismiss()
                    }
                }
            }
        }
    }
}


struct ChatRow: View {
    let name: String
    let profileImage: String
    let lastMessage: String
    let time: String
    let unreadMessages: Int
    
    var body: some View {
        HStack () {
            Image(systemName: profileImage)
                .resizable()
                .frame(width: 44, height: 44)
            VStack(alignment: .leading) {
                Text(name)
                Text(lastMessage)
                    .foregroundColor(.gray)
            }
            Spacer()
            VStack() {
                Text(time)
                if unreadMessages > 0 {
                    Text(String(unreadMessages))
                }
                else {
                    Spacer()
                }
            }
        }
    }
}

struct ChatView: View {
    @State private var showingCreateContact = false
    
    var chats: [ChatData] = [
        ChatData(name: "Pedro Picapiedra", profileImage: "person.crop.circle.fill", lastMessage: "Hola, ¿cómo estás?", time: "12:30", unreadMessages: 2),
        ChatData(name: "Juan Pérez", profileImage: "person.crop.circle.fill", lastMessage: "Nos vemos mañana", time: "11:00", unreadMessages: 0),
        ChatData(name: "Ana García", profileImage: "person.crop.circle.fill", lastMessage: "¡Genial!", time: "Ayer", unreadMessages: 5)
    ]
    var body: some View {
        VStack {
            HStack() {
                Text("42")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                Spacer()
                Button(action: {
                    showingCreateContact.toggle()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }.padding()
            
            Text("Chat")
                .font(.title)
                .fontWeight(.bold)
            
            List(chats, id: \.name) { chat in
                ChatRow(
                    name: chat.name,
                    profileImage: chat.profileImage,
                    lastMessage: chat.lastMessage,
                    time: chat.time,
                    unreadMessages: chat.unreadMessages
                )
            }
        }
        .sheet(isPresented: $showingCreateContact) {
            CreateContactView()
        }
    }
}

#Preview {
    ChatView()
}
