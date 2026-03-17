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
                VStack(spacing: 24) {
                    Text(score >= 4 ? "🏆" : "😅").font(.system(size: 80))
                    Text("Quiz klart!").font(.largeTitle).fontWeight(.bold)
                    Text("Du fick \(score) av \(questions.count) rätt")
                        .font(.title3).foregroundColor(.gray)
                    HStack(spacing: 20) {
                        Label("\(score) rätt", systemImage: "checkmark.circle.fill")
                            .foregroundColor(.green)
                        Label("\(questions.count - score) fel", systemImage: "xmark.circle.fill")
                            .foregroundColor(.red)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    Button("Spela igen") {
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
                QuestionView(
                    question: questions[currentIndex],
                    shuffledAnswers: questions[currentIndex].options,
                    currentIndex: currentIndex,
                    totalQuestions: questions.count,
                    selectedAnswer: selectedAnswer,
                    onSelect: { answer in
                        if selectedAnswer == nil {
                            selectedAnswer = answer
                            if answer == questions[currentIndex].correctAnswer {
                                score += 1
                            }
                        }
                    },
                    onNext: {
                        if currentIndex + 1 < questions.count {
                            currentIndex += 1
                            selectedAnswer = nil
                        } else {
                            showResult = true
                        }
                    }
                )
            }
        }
    }
}
