import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            
            // Profilbild
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.purple)
                .padding(.top, 40)
            
            // Namn och stad
            VStack(spacing: 8) {
                Text("Yazan")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Göteborg")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Divider()
                .padding(.horizontal)
            
            // Erfarenhet
            VStack(alignment: .leading, spacing: 12) {
                Text("Experience")
                    .font(.headline)
                    .padding(.horizontal)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Ålleberggymnasiet")
                            .font(.body)
                        Text("2020 - 2023")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Jönköping university")
                            .font(.body)
                        Text("2023 - Nu")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
    }
}
