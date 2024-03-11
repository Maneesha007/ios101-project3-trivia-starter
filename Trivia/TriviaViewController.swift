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

    @IBOutlet weak var Option1Button: UIButton!
    @IBOutlet weak var Option2Button: UIButton!
    @IBOutlet weak var Option3Button: UIButton!
    @IBOutlet weak var Option4Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayCurrentQuestion()
        questionAskedLabel.numberOfLines = 0
        questionAskedLabel.lineBreakMode = .byWordWrapping
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

        // Set the options for the current question
        for (index, option) in currentQuestion.options.enumerated() {
            let optionButton = view.viewWithTag(index + 1) as? UIButton
            optionButton?.setTitle(option.text, for: .normal)
            print("Setting option \(index + 1) title to \(option.text)")
        }
        
        // Set the options for the current question
            Option1Button.setTitle(currentQuestion.options[0].text, for: .normal)
            Option2Button.setTitle(currentQuestion.options[1].text, for: .normal)
            Option3Button.setTitle(currentQuestion.options[2].text, for: .normal)
            Option4Button.setTitle(currentQuestion.options[3].text, for: .normal)
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
