//
//  CreateViewController.swift
//  クイズ
//
//  Created by nttr on 2017/07/25.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UITextFieldDelegate{
    
    
    var quizArray = [String]()
    
    @IBOutlet var createTextField0: UITextField!
    @IBOutlet var createTextField1: UITextField!
    @IBOutlet var createTextField2: UITextField!
    @IBOutlet var createTextField3: UITextField!
    @IBOutlet var createTextField4: UITextField!
    @IBOutlet var createTextField5: UITextField!
    
    //@IBOutlet var createTextField6: UITextField!
    
    //@IBOutlet var createQuizField: UITextField!
    
    
    @IBOutlet var quizLabel0: UILabel!
    @IBOutlet var quizLabel1: UILabel!
    @IBOutlet var quizLabel2: UILabel!
    @IBOutlet var quizLabel3: UILabel!
    @IBOutlet var quizLabel4: UILabel!
    @IBOutlet var quizLabel5: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizText()
        
        createTextField0.delegate = self
        createTextField1.delegate = self
        createTextField2.delegate = self
        createTextField3.delegate = self
        createTextField4.delegate = self
        createTextField5.delegate = self
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func save(){
        let inputText0 = createTextField0.text
        let inputText1 = createTextField1.text
        let inputText2 = createTextField2.text
        let inputText3 = createTextField3.text
        let inputText4 = createTextField4.text
        let inputText5 = createTextField5.text
        //let inputText6 = createTextField6.text
        
        let ud = UserDefaults.standard
        
        var newQuizArray = [String]()
        
        if validation() == true {
            
            
            
            if ud.array(forKey: "quizAnswerArray") != nil{
                ud.removeObject(forKey: "quizAnswerArray")
            }
            
            
            newQuizArray.append(contentsOf: [inputText0!, inputText1!, inputText2!, inputText3!, inputText4!, inputText5!])
            ud.set(newQuizArray, forKey: "quizAnswerArray")
            ud.synchronize()
            self.dismiss(animated: true, completion: nil)
            
            
        } else {
            let alert = UIAlertController(title: "注意", message: "全て入力してください", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (action) in
                alert.dismiss(animated: true, completion: nil)
            }
            
            
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
            
            print("全て入力してください")
        }
        
        
        
        
        
    }
    
    func validation() -> Bool {
        if createTextField0.text?.characters.count == 0 {
            return false
        }
        
        if createTextField1.text?.characters.count == 0 {
            return false
        }
        if createTextField2.text?.characters.count == 0 {
            return false
        }
        if createTextField3.text?.characters.count == 0 {
            return false
        }
        if createTextField4.text?.characters.count == 0 {
            return false
        }
        if createTextField5.text?.characters.count == 0 {
            return false
        }
        /*
         if createTextField6.text?.characters.count == 0 {
            return false
        }
        */
        
        return true
    }
    
    
    func quizText() {
        let ud = UserDefaults.standard
        quizArray = ud.array(forKey: "quizArray") as! [String]
        
        print(quizArray)
        
        quizLabel0.text = quizArray[0]
        quizLabel1.text = quizArray[1]
        quizLabel2.text = quizArray[2]
        quizLabel3.text = quizArray[3]
        quizLabel4.text = quizArray[4]
        quizLabel5.text = quizArray[5]
    }
    
    
    @IBAction func back(){
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
    
        return true
    }
    
    
    
    
}




