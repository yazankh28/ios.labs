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

    @State private var currentIndex = 0
    @State private var score = 0
    @State private var selectedAnswer: String? = nil
    @State private var showResult = false

    var body: some View {
        VStack(spacing: 20) {
            if showResult {
                VStack(spacing: 20) {
                    Text("Quiz klart! 🎉")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Du fick \(score) av \(questions.count) rätt")
                        .font(.title2)
                        .foregroundColor(.gray)

                    HStack(spacing: 20) {
                        Label("\(score) rätt", systemImage: "checkmark.circle.fill")
                            .foregroundColor(.green)
                        Label("\(questions.count - score) fel", systemImage: "xmark.circle.fill")
                            .foregroundColor(.red)
                    }

                    Button("Försök igen") {
                        currentIndex = 0
                        score = 0
                        selectedAnswer = nil
                        showResult = false
                    }
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            } else {
                Text("Fråga \(currentIndex + 1) av \(questions.count)")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.top, 40)

                Text(questions[currentIndex].text)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding()

                ForEach(questions[currentIndex].options, id: \.self) { option in
                    Button(action: {
                        if selectedAnswer == nil {
                            selectedAnswer = option
                            if option == questions[currentIndex].correctAnswer {
                                score += 1
                            }
                        }
                    }) {
                        HStack {
                            Text(option)
                            Spacer()
                            if let selected = selectedAnswer {
                                if option == questions[currentIndex].correctAnswer {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                } else if option == selected {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(buttonColor(for: option))
                        .cornerRadius(10)
                    }
                    .foregroundColor(.primary)
                    .disabled(selectedAnswer != nil)
                }
                .padding(.horizontal)

                if selectedAnswer != nil {
                    Button(currentIndex + 1 == questions.count ? "Se resultat" : "Nästa fråga") {
                        if currentIndex + 1 < questions.count {
                            currentIndex += 1
                            selectedAnswer = nil
                        } else {
                            showResult = true
                        }
                    }
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
    }

    func buttonColor(for option: String) -> Color {
        guard let selected = selectedAnswer else {
            return Color(.systemGray6)
        }
        if option == questions[currentIndex].correctAnswer {
            return Color.green.opacity(0.2)
        } else if option == selected {
            return Color.red.opacity(0.2)
        }
        return Color(.systemGray6)
    }
}
