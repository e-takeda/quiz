//
//  QuizViewController.swift
//  クイズ
//
//  Created by nttr on 2017/07/25.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController ,UITextFieldDelegate{
    
    var judge: String = ""
    var point = 0
    var quizArray = [String]()
    var quizAnswerArray = [String]()
    var quizNumber = 1
    
    
    @IBOutlet var seikaiLabel: UILabel!
    @IBOutlet var kotaeLabel: UILabel!
    @IBOutlet var usagiImageView: UIImageView!

    @IBOutlet var nextButton: UIButton!
    @IBOutlet var goButton: UIButton!
    
    @IBOutlet var numLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var quizTextLabel: UILabel!
    
    @IBOutlet var inputTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextField.delegate = self

        loadQuizAnswer()
        loadQuiz()
        nameLabel.text = quizAnswerArray[0] + "さんの"
        quizTextLabel.text = quizArray[1]
        
        if quizNumber == 1 {
            
            nextButton.isHidden = true
            
        } else {
            
            nextButton.isHidden = false
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadQuiz() {
        let ud = UserDefaults.standard
            quizArray = ud.array(forKey: "quizArray") as! [String]
    }
    
    
    func loadQuizAnswer() {
        let ud = UserDefaults.standard
        if ud.array(forKey: "quizAnswerArray") != nil {
            quizAnswerArray = ud.array(forKey: "quizAnswerArray") as! [String]
        }
    }
    
    
    
    
    
    
    
    
    
    
    func showQuiz() {
        // クイズ番号、クイズ、各選択肢の表示
        numLabel.text = String(quizNumber) + "問目"
        quizTextLabel.text = quizArray[quizNumber]
        inputTextField.text = ""
    }
    
    func resetQuiz() {
        point = 0
        quizNumber = 1
        // ↓これいる？
        // self.showQuiz()
    }
    
    func updateQuiz() {
        // 問題番号を更新
        quizNumber = quizNumber + 1
        
        // もし最終問題をとき終えたら、アラートを出すして結果表示
        // var quizCount = 0
        
        
        
        
        if quizNumber == quizArray.count {
            let alertText = "\(quizArray.count - 1)問中、\(point)問正解でした。"
            let alertController = UIAlertController(title: "結果", message: alertText, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                
                self.resetQuiz()
                self.dismiss(animated: true, completion: nil)
                
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            showQuiz()
        }
        
        
        /* if quizNumber == quizArray.count {
            let alertText = "答えは\(quizAnswerArray[quizNumber-1])です。\(quizArray.count - 1)問中、\(point)問正解でした。"
            let alertController = UIAlertController(title: judge, message: alertText, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                
                self.resetQuiz()
                self.dismiss(animated: true, completion: nil)

            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            // self.dismiss(animated: true, completion: nil)
        } else {
            // 最終問題以外では次の問題を表示
            
            
            let alertText2 = "答えは\(quizAnswerArray[quizNumber-1])です。"
            let alertController = UIAlertController(title: judge, message: alertText2, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "次", style: .default, handler: { (action) in
               
                self.showQuiz()
                
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
            
            
            
            // showQuiz()
        } 
 */
        
        
    }
    

    
    
        @IBAction func go() {
            
            
            
        
        if quizAnswerArray[quizNumber] == inputTextField.text {
            
            judge = "正解!!"
            print("正解")
            point = point + 1
            
            usagiImageView.image = UIImage(named: "うさぎB.png")
            
        } else{
            judge = "不正解.."
            print("不正解..")
            usagiImageView.image = UIImage(named: "うさぎ悩む.png")
        }
     
        
            nextButton.isHidden = false
            seikaiLabel.text = judge
            kotaeLabel.text = "答えは\(quizAnswerArray[quizNumber])です。"
            goButton.alpha = 0.3
            goButton.isEnabled = false
            
            
    }
    
    
    
    @IBAction func next() {
        
        updateQuiz()
        
        
        seikaiLabel.text = ""
        kotaeLabel.text = ""
        
        nextButton.isHidden = true
        goButton.alpha = 1
        goButton.isEnabled = true
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    
    
    
    
    
    
    
}
