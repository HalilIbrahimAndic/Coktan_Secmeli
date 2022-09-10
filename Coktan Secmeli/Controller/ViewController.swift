//
//  ViewController.swift
//  Coktan Secmeli
//
//  Created by Halil Ibrahim Andic on 9.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //UI outlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    
    // Created
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = 0.0
        updateUI()
    }
    
    // User answered question
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.getQuestionNumber()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.updateUI()
        }
        
    }
    
    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        button1.setTitle(quizBrain.getButtonText(0), for: .normal)
        button2.setTitle(quizBrain.getButtonText(1), for: .normal)
        button3.setTitle(quizBrain.getButtonText(2), for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        button1.backgroundColor = UIColor.clear
        button2.backgroundColor = UIColor.clear
        button3.backgroundColor = UIColor.clear
    }

}

