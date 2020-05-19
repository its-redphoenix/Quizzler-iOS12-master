

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNo : Int = 0
    var score : Int = 0
    
    

    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
  
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        
        questionNo = questionNo + 1
        
        
        
       nextQuestion()

        
        
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score : \(score)"
        progressLabel.text = "\(questionNo + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat (questionNo + 1)
        
    }
    

    func nextQuestion() {
        
        if questionNo <= 12{
         questionLabel.text = allQuestions.list[questionNo].questionText
            updateUI()
        }
        
        else {
            
            let alert = UIAlertController(title: "Awesome Bro!", message: "You've sucessfully finished the quiz, wanna restart?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
                
            }
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
            
            
        }
        
        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNo].answer
        
        if correctAnswer == pickedAnswer {
           score = score + 1
            
            ProgressHUD.showSuccess("Correct, Bro!")
            
        }
        
        else {
            print ("Wrong")
            
            ProgressHUD.showError("Bongya! It's Wrong!")
        }
    }
    
    
    func startOver() {
        
        score = 0
        questionNo = 0
        nextQuestion()
       
    }
    

    
}
