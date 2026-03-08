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
                 options: ["10", "11", "12", "13"],
                 correctAnswer: "12"),
        Question(text: "Vilket år landade människan på månen?",
                 options: ["1965", "1969", "1972", "1959"],
                 correctAnswer: "1969"),
        Question(text: "Vad är 8 x 7?",
                 options: ["54", "56", "58", "52"],
                 correctAnswer: "56")
    ]
    
    @State private var currentIndex = 0
    @State private var score = 0
    @State private var showResult = false
    @State private var selectedAnswer: String? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            if showResult {
                // Resultatsida
                VStack(spacing: 20) {
                    Text("Quiz klart! 🎉")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Du fick \(score) av \(questions.count) rätt")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    Button("Försök igen") {
                        currentIndex = 0
                        score = 0
                        showResult = false
                        selectedAnswer = nil
                    }
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            } else {
                // Frågasida
                Text("Fråga \(currentIndex + 1) av \(questions.count)")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.top, 40)
                
                Text(questions[currentIndex].text)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                VStack(spacing: 12) {
                    ForEach(questions[currentIndex].options, id: \.self) { option in
                        Button(action: {
                            if selectedAnswer == nil {
                                selectedAnswer = option
                                if option == questions[currentIndex].correctAnswer {
                                    score += 1
                                }
                            }
                        }) {
                            Text(option)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(buttonColor(for: option))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                }
                
                if selectedAnswer != nil {
                    Button("Nästa fråga →") {
                        if currentIndex + 1 < questions.count {
                            currentIndex += 1
                            selectedAnswer = nil
                        } else {
                            showResult = true
                        }
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                
                Spacer()
            }
        }
    }
    
    func buttonColor(for option: String) -> Color {
        guard let selected = selectedAnswer else {
            return Color.purple
        }
        if option == questions[currentIndex].correctAnswer {
            return Color.green
        } else if option == selected {
            return Color.red
        }
        return Color.gray
    }
}
