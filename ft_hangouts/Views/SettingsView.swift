import SwiftUI

struct SettingsView: View {
    @AppStorage("headerColor") private var headerColor: String = "Blue"
    @AppStorage("selectedLanguage") private var selectedLanguage: String = "en"
    let availableColors: [(name: String, color: Color)] = [
        ("Red", .red),
        ("Blue", .blue),
        ("Green", .green),
        ("Gray", .gray),
        ("Orange", .orange)
    ]
    
    let availableLanguages: [(code: String, name: String)] = [
        ("en", "English"),
        ("es", "Español")
    ]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Header Color")) {
                    Picker("Select a color", selection: $headerColor) {
                        ForEach(availableColors, id: \.name) { item in
                            HStack {
                                Circle()
                                    .fill(item.color)
                                    .frame(width: 20, height: 20)
                                Text(item.name)
                            }
                            .tag(item.name)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section(header: Text("Language")) {
                    Picker("Select a language", selection: $selectedLanguage) {
                        ForEach(availableLanguages, id: \.code) { lang in
                            Text(lang.name)
                                .tag(lang.code)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
