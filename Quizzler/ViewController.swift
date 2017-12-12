//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var count : Int = 0
    var score : Int = 0
    var answer : Bool = true
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "9999"
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            answer = true
        }
        if sender.tag == 2 {
            answer = false
        }
        checkAnswer()
        count = count + 1
        nextQuestion()
        updateUI()
    }
    
    func updateUI() {
        scoreLabel.text = "Score : \(score)"
        progressBar.frame.size.width = (view.frame.size.width/13)*CGFloat(count+1)
    }
    

    func nextQuestion() {
        if count <= 12 {
            questionLabel.text = allQuestions.list[count].questionText
        }
        else {
            let restart = UIAlertController(title: "Game Over", message: "Do You want to restart ", preferredStyle: .alert)
            let action = UIAlertAction(title: "Restart", style: .default, handler: { _ in
                self.startOver()
                self.updateUI()
            })
            restart.addAction(action)
            self.present(restart, animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer() {
        if allQuestions.list[count].answer == answer {
            score += 1
            ProgressHUD.showSuccess("You got it")
        }
        else {
             ProgressHUD.showError("Wrong!")
        }
    }
    
    
    
    func startOver() {
        count = 0
        score = 0
    }
    

    
}
