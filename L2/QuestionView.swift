import SwiftUI

struct QuestionView: View {
    let question: Question
    let shuffledAnswers: [String]
    let currentIndex: Int
    let totalQuestions: Int
    let selectedAnswer: String?
    let onSelect: (String) -> Void
    let onNext: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Fråga \(currentIndex + 1) av \(totalQuestions)")
                .font(.caption).foregroundColor(.gray)
            ProgressView(value: Double(currentIndex + 1), total: Double(totalQuestions))
                .accentColor(.purple)
                .padding(.horizontal)
            Text(question.text)
                .font(.title3).fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding()
            ForEach(shuffledAnswers, id: \.self) { answer in
                Button(action: { onSelect(answer) }) {
                    HStack {
                        Text(answer)
                        Spacer()
                        if selectedAnswer != nil {
                            if answer == question.correctAnswer {
                                Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                            } else if answer == selectedAnswer {
                                Image(systemName: "xmark.circle.fill").foregroundColor(.red)
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(buttonColor(for: answer))
                    .cornerRadius(10)
                }
                .foregroundColor(.primary)
            }
            .padding(.horizontal)
            if selectedAnswer != nil {
                Button(currentIndex + 1 == totalQuestions ? "Se resultat" : "Nästa fråga") {
                    onNext()
                }
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
    }

    func buttonColor(for answer: String) -> Color {
        guard let selected = selectedAnswer else { return Color(.systemGray6) }
        if answer == question.correctAnswer { return Color.green.opacity(0.2) }
        if answer == selected { return Color.red.opacity(0.2) }
        return Color(.systemGray6)
    }
}
