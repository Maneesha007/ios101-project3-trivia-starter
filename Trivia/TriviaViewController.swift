//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Maneesha Reddy gurrala on 3/9/24.
//

// TriviaViewController.swift

import UIKit

class TriviaViewController: UIViewController {
    
    var currentQuestionIndex = 0
    var correctAnswersCount = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var questionAskedLabel: UILabel!{
        didSet {
            questionAskedLabel.layer.cornerRadius = 10 // Adjust the corner radius value as needed
            questionAskedLabel.clipsToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayCurrentQuestion()
    }
    
    func displayCurrentQuestion() {
        guard currentQuestionIndex < triviaQuestions.count else {
            // Handle end of questions
            return
        }
        
        let currentQuestion = triviaQuestions[currentQuestionIndex]
        questionLabel.text = "Question: \(currentQuestionIndex + 1)/\(triviaQuestions.count)"
        categoryLabel.text = currentQuestion.genre.rawValue
        questionAskedLabel.text = currentQuestion.questionText
    }
    
    func checkAnswer(optionIndex: Int) {
       
        
        let currentQuestion = triviaQuestions[currentQuestionIndex]
        if optionIndex == currentQuestion.correctAnswerIndex {
            correctAnswersCount += 1
            // Correct answer logic
        } else {
            // Incorrect answer logic
        }
        
        // Move to the next question
        currentQuestionIndex += 1
        displayCurrentQuestion()
        
        if currentQuestionIndex == triviaQuestions.count {
                displayGameOver() // Call displayGameOver if it's the last question
            } else {
                displayCurrentQuestion()
            }
        
    }
    func displayGameOver() {
        let message = "You have answered all questions.\nNumber of correct answers: \(correctAnswersCount)"
                let alertController = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
                    self.restartGame()
                }))
                present(alertController, animated: true, completion: nil)
    }

    func restartGame() {
        // Reset the current question index and correct answers count
                currentQuestionIndex = 0
                correctAnswersCount = 0
                
                // Display the first question
                displayCurrentQuestion()
    }

    
    @IBAction func option1ButtonTapped() {
        checkAnswer(optionIndex: 0)
    }
    
    @IBAction func option2ButtonTapped() {
        checkAnswer(optionIndex: 1)
    }
    
    @IBAction func option3ButtonTapped() {
        checkAnswer(optionIndex: 2)
    }
    
    @IBAction func option4ButtonTapped() {
        checkAnswer(optionIndex: 3)
        
        
    }
    
    
}
