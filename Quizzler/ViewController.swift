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
    var score : Float = 0.0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "9999"
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if checkAnswer(tag: sender.tag) {
         //   progressBar.
        }
    }
    
    
    func updateUI() {
        scoreLabel.text = "\(score)"
        
    }
    

    func nextQuestion() {
        questionLabel.text = allQuestions.list[count].questionText
    }
    
    
    func checkAnswer(tag : Int) -> Bool{
        if tag == 1 {
            score += 1
            return true
        }
        return false
    }
    
    
    func startOver() {
        count = 0
        score = 0
    }
    

    
}
