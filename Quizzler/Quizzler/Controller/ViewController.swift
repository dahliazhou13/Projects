//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quiz = QuizBrain()
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        middleButton.isHidden = true
        updateUI()
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        if(quiz.checkAnswer(userAnswer)){
            sender.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }
        else{
            sender.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2){
            sender.backgroundColor = UIColor.clear
        }
        updateUI()
        
        
    }

    func updateUI(){
        questionLabel.text = quiz.getText()
        if(quiz.getIsMultiple()){
            let a = quiz.getAnswers()
            trueButton.setTitle(a[0], for: .normal)
            middleButton.setTitle(a[1], for: .normal)
            falseButton.setTitle(a[2], for: .normal)
            middleButton.isHidden = false
        }
        else{
            trueButton.setTitle("True", for: .normal)
            falseButton.setTitle("False", for: .normal)
            middleButton.isHidden = true
        }
        progressBar.progress = quiz.getProgress()
        scoreLabel.text = "Score: \(quiz.getScore())"
    }
}

