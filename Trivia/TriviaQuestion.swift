//
//  TriviaQuestion.swift
//  Trivia
//
//  Created by Maneesha Reddy gurrala on 3/10/24.
//

// TriviaQuestion.swift

import Foundation

// Enumeration to represent different genres/categories of questions
enum QuestionGenre: String {
    case history = "History"
    case science = "Science"
    case literature = "Literature"
    // Add more genres if needed
}

// Structure to represent options for a question
struct Option {
    let text: String
    let isCorrect: Bool
}

// Class to represent a trivia question
class Question {
    let questionText: String
    let genre: QuestionGenre
    let options: [Option]
    let correctAnswerIndex: Int
    
    init(questionText: String, genre: QuestionGenre, options: [Option], correctAnswerIndex: Int) {
        self.questionText = questionText
        self.genre = genre
        self.options = options
        self.correctAnswerIndex = correctAnswerIndex
    }
}

// Define your trivia questions here
let question1Options = [
    Option(text: "Paris", isCorrect: true),
    Option(text: "London", isCorrect: false),
    Option(text: "Berlin", isCorrect: false),
    Option(text: "Rome", isCorrect: false)
]

let question1 = Question(questionText: "What is the capital of France?", genre: .history, options: question1Options, correctAnswerIndex: 0)

let question2Options = [
    Option(text: "Earth", isCorrect: false),
    Option(text: "Mars", isCorrect: true),
    Option(text: "Venus", isCorrect: false),
    Option(text: "Jupiter", isCorrect: false)
]

let question2 = Question(questionText: "Which planet is known as the Red Planet?", genre: .science, options: question2Options, correctAnswerIndex: 1)

let question3Options = [
    Option(text: "Jane Austen", isCorrect: false),
    Option(text: "Mark Twain", isCorrect: false),
    Option(text: "William Shakespeare", isCorrect: true),
    Option(text: "Charles Dickens", isCorrect: false)
]

let question3 = Question(questionText: "Who wrote 'Romeo and Juliet'?", genre: .literature, options: question3Options, correctAnswerIndex: 2)

// Array containing all the trivia questions
let triviaQuestions = [question1, question2, question3]
