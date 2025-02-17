import SwiftUI

struct CallsView: View {
    var body: some View {
        VStack() {
            HStack() {
                Text("42")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }.padding()
            Text("Calls")
                .font(.title)
                .fontWeight(.bold)
            List {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
            }
        }
    }
}

#Preview {
    CallsView()
}
