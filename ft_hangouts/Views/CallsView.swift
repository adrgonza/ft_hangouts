import SwiftUI

struct CallContactRow: View {
    let contact: Contact
    @Environment(\.openURL) var openURL

    var body: some View {
        HStack {
            Image(systemName: contact.profileImage)
                .resizable()
                .frame(width: 44, height: 44)
            Text(contact.name)
            Spacer()
            Button(action: {
                let phoneNumber = contact.phone.filter("0123456789".contains)
                if let url = URL(string: "tel://\(phoneNumber)"),
                   UIApplication.shared.canOpenURL(url) {
                    openURL(url)
                }
            }) {
                Image(systemName: "phone.fill")
                    .foregroundColor(.blue)
            }
        }
        .padding(.vertical, 4)
    }
}

struct CallsView: View {
    let contacts: [Contact] = [
        Contact(name: "Pedro Picapiedra", phone: "42432", profileImage: "person.crop.circle.fill", lastMessage: "Hola, ¿cómo estás?", time: "12:30"),
        Contact(name: "Juan Pérez", phone: "42432", profileImage: "person.crop.circle.fill", lastMessage: "", time: ""),
        Contact(name: "Ana García", phone: "42432", profileImage: "person.crop.circle.fill", lastMessage: "¡Genial!", time: "Ayer")
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("42")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding()
            
            Text("Calls")
                .font(.title)
                .fontWeight(.bold)
            
            List(contacts) { contact in
                CallContactRow(contact: contact)
            }
        }
    }
}

#Preview {
    CallsView()
}
