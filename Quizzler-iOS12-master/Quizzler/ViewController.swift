//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables let here
    let allQuestion = Questionbank()
    
    //Place your instance variables var here
    var pickedanswer:Bool = false
    var questionposition = 0
    var score:Int = 0
    
    
    //Place your instance variables layout here
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("numbs all qus: \(allQuestion.list.count)")
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedanswer = true
        }else if sender.tag == 2 {
            pickedanswer = false
        }
        checkAnswer()
        
        questionposition = questionposition + 1
        
        updateUI()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score \(score)"
        progressLabel.text = "\(questionposition) /13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionposition)
        nextQuestion()
    }
    

    func nextQuestion() {
        if questionposition <= 12{
            questionLabel.text = allQuestion.list[questionposition].questiontext
        }else{
            if let arlert:UIAlertController = UIAlertController(title: "Awesome", message: "You've finish all question ", preferredStyle: .alert){
                let restartAct:UIAlertAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                    self.startOver()
                }
                arlert.addAction(restartAct)
                present(arlert,animated: true,completion: nil)
                
            }
        }
    }
    
    
    func checkAnswer() {
        let correctanswer = allQuestion.list[questionposition].answer
        if correctanswer == pickedanswer{
            ProgressHUD.showSuccess("Correct")
            score = score + 1
            
        }else{
            ProgressHUD.showError("Wrong")
            print("you wrong")
        }
        updateUI()
    }
    
    
    func startOver() {
        questionposition = 0
        score = 0
        
       updateUI()
    }
    

    
}
