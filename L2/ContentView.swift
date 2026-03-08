import SwiftUI

struct Question {
    let text: String
    let options: [String]
    let correctAnswer: String
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Pop Quiz")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}
