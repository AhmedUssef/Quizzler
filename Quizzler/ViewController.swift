//
//  ViewController.swift
//  Quizzler
//
//  Created by Ahmed on 4/3/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
   let allQuestion = QuestionBank()
    var pickedanswer :Bool = false
    var questionnumber : Int = 0
    var score : Int = 0
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = allQuestion.list[questionnumber].questiontext
       
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
  
        if sender.tag == 1
        {
            pickedanswer = true
        }
        else if sender.tag == 2
        {
            pickedanswer = false
        }
        
        checkAnswer()
        questionnumber = questionnumber + 1
        nextQuestion()
        
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score:" + String(score)
        progressLabel.text = String(questionnumber+1) + "/13"
         progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionnumber+1)
        
      
    }
    

    func nextQuestion() {
        if questionnumber < allQuestion.list.count{
        questionLabel.text = allQuestion.list[questionnumber].questiontext
            updateUI()
        }
        else{
            let alert = UIAlertController(title: "Awesome", message: "You have finished all the question , Do you want to start over ? ", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer() {
        
        if pickedanswer == allQuestion.list[questionnumber].answer
        {
            ProgressHUD.showSuccess("Correct")
            score = score + 1
            
            
        }
        else {
             ProgressHUD.showError("Wrong!")
            
        }
        
    }
    
    
    func startOver() {
        score = 0
        questionnumber = 0
        nextQuestion()
       
    }
    

    
}
