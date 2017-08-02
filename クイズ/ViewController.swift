//
//  ViewController.swift
//  クイズ
//
//  Created by nttr on 2017/07/20.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var quizArray = ["なまえ",
                     "誕生日は？",
                     "血液型は？",
                     "年齢は？",
                     "フルネームは？",
                     "兄弟は？"]
    
    @IBOutlet var titleLabel1: UILabel!
    @IBOutlet var titleLabel2: UILabel!
    var transRotate1 = CGAffineTransform()
    var transRotate2 = CGAffineTransform()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ud = UserDefaults.standard
        ud.set(quizArray, forKey: "quizArray")
        ud.synchronize()
        
        let angle1 = -15 * CGFloat.pi / 180
        transRotate1 = CGAffineTransform(rotationAngle: CGFloat(angle1));
        titleLabel1.transform = transRotate1
        
        let angle2 = -15 * CGFloat.pi / 180
        transRotate2 = CGAffineTransform(rotationAngle: CGFloat(angle2));
        titleLabel2.transform = transRotate2
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func start() {
        
        let ud = UserDefaults.standard
        
        
         if ud.array(forKey: "quizAnswerArray") == nil{
            
            // alert
            
            
            let alert = UIAlertController(title: "注意", message: "問題を作成してください", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (action) in
                alert.dismiss(animated: true, completion: nil)
            }
            
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
            
         } else {
            
            self.performSegue(withIdentifier: "toStart", sender: nil)
            
            
        }
        
    
    }
}

