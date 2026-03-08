import SwiftUI

struct Question {
    let text: String
    let options: [String]
    let correctAnswer: String
}

struct ContentView: View {
    let questions = [
        Question(text: "Vad är huvudstaden i Sverige?",
                 options: ["Göteborg", "Stockholm", "Malmö", "Uppsala"],
                 correctAnswer: "Stockholm"),
        Question(text: "Hur många månader har ett år?",
                 options: ["10", "12", "11", "13"],
                 correctAnswer: "12"),
        Question(text: "Vilket år landade människan på månen?",
                 options: ["1965", "1969", "1972", "1959"],
                 correctAnswer: "1969"),
        Question(text: "Vad är 8 x 7?",
                 options: ["54", "56", "58", "52"],
                 correctAnswer: "56"),
        Question(text: "Vilket språk används för iOS-appar?",
                 options: ["Java", "Swift", "Python", "Kotlin"],
                 correctAnswer: "Swift")
    ]

    var body: some View {
        VStack {
            Text("Pop Quiz")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("\(questions.count) frågor")
                .foregroundColor(.gray)
        }
    }
}
