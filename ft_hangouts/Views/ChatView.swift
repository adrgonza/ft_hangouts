import SwiftUI

struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let phone: String
    let profileImage: String
    let lastMessage: String
    let time: String
    //let Chats
}

struct CreateContactView: View {
    @Environment(\.dismiss) var dismiss
    @State private var profileImage: String = ""
    @State private var name: String = ""
    @State private var phone: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Create Contact")
                    .font(.title)
                    .fontWeight(.bold)
                Button(action: {
                    
                }) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                .padding()
                Text("Add Profile Image")
                Form {
                    Section(header: Text("Contact Info")) {
                        TextField("Name", text: $name)
                        TextField("Phone", text: $phone)
                    }
                }
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
            .padding(20)
        }
    }
}

struct ChatRow: View {
    let name: String
    let profileImage: String
    let lastMessage: String
    let time: String
    
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
            Text(time)
        }
    }
}

struct ContactRow: View {
    let name: String
    let profileImage: String

    var body: some View {
        HStack () {
            Image(systemName: profileImage)
                .resizable()
                .frame(width: 44, height: 44)
            Text(name)
            Spacer()
        }
    }
}

struct ChatView: View {
    @State private var showingCreateContact = false
    
    var contacts: [Contact] = [
        Contact(name: "Pedro Picapiedra", phone: "42432", profileImage: "person.crop.circle.fill", lastMessage: "Hola, ¿cómo estás?", time: "12:30"),
        Contact(name: "Juan Pérez", phone: "42432", profileImage: "person.crop.circle.fill", lastMessage: "", time: ""),
        Contact(name: "Ana García", phone: "42432", profileImage: "person.crop.circle.fill", lastMessage: "¡Genial!", time: "Ayer")
    ]
    
    var contactsWithMessages: [Contact] {
            contacts.filter { !$0.lastMessage.isEmpty || !$0.time.isEmpty }
        }

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
            
            List {
                Section(header: Text("chats")) {
                    ForEach(contactsWithMessages, id: \.id) { chat in
                        ChatRow(
                            name: chat.name,
                            profileImage: chat.profileImage,
                            lastMessage: chat.lastMessage,
                            time: chat.time
                        )
                    }
                }
                Section(header: Text("Contacts")) {
                    ForEach(contacts, id: \.id) { contact in
                        ContactRow(
                            name: contact.name,
                            profileImage: contact.profileImage)
                    }
                }
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
