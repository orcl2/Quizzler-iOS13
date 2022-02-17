//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!

    @IBOutlet weak var scoreLabel: UILabel!
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        setButtonBackground(sender)
        
        quizBrain.moveNextQuestion()
        
        disableButtons()
        
        initTimer()
    }
    
    func initTimer() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    func setButtonBackground(_ sender: UIButton) {
        let userAnsware = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnsware(answare: userAnsware)
        
        sender.backgroundColor = userGotItRight ? .green : .red
    }
    
    @objc func updateUI() {
        resetButtons()
        
        questionText.text = quizBrain.currentQuestion.description
        
        progressBar.progress = quizBrain.getProgress()
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    
    func resetButtons() {
        enableButtons()
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
    }
    
    func disableButtons() {
        trueButton.isEnabled = false
        falseButton.isEnabled = false
    }
    
    func enableButtons() {
        trueButton.isEnabled = true
        falseButton.isEnabled = true
    }
}

