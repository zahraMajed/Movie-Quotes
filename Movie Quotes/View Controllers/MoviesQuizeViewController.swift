//
//  MoviesQuizeViewController.swift
//  Movie Quotes
//
//  Created by admin on 21/12/2021.
//

import UIKit

class MoviesQuizeViewController: UIViewController {

    var questions: [MovieQuotes]?
    var currentAnswer = ""
    var delgate: MovieDelegate?
    var score = 0
    
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var sendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let questions = questions {
            for question in questions {
                lblQuestion.text = question.qute
                currentAnswer = question.answer
            }
        }
        backBtn.isHidden = true
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
        
        if let text = answerTextField.text , !text.isEmpty {
            if text == currentAnswer {
                 score += 1
                lblScore.text = "Score : \(score)"
                backBtn.isHidden = false
                sendBtn.isEnabled = false
            }
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
