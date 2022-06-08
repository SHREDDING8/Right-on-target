//
//  ViewController.swift
//  Right on target
//
//  Created by SHREDDING on 08.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var userNumber: UILabel!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    // загаданное число
    var comtuterNumber = 0
    // раунд
    var round = 0
    //выбранное число
    var curValue = 0{
        didSet{
            let chousenNumber = curValue
            if chousenNumber == comtuterNumber{
                score+=50
            }else if chousenNumber > comtuterNumber{
                score+=50+comtuterNumber-chousenNumber
            }else{
                score+=50+chousenNumber-comtuterNumber
            }
            
            ScoreLabel.text = String(score)
        }
    }
    // score
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func changedSlider(_ sender: UISlider) {
        userNumber.text = String(Int(sender.value))
        
    }
    
    @IBAction func checkButtonAction(_ sender: UIButton) {
        if round == 0{
            comtuterNumber = Int.random(in: 0...50)
            self.curValue = Int(self.mySlider.value)
            round+=1
            
        }else if round == 5{
            createAlert(title: "Game Over! Number is \(comtuterNumber )", score: score)
        
        }else{
            self.curValue = Int(self.mySlider.value)
            round+=1
        }
        
        if comtuterNumber == Int(self.mySlider.value){
            createAlert(title: "Win! Number is \(comtuterNumber )", score: score)
        }
    }
    
    
    func createAlert(title:String,score:Int){
        let alert = UIAlertController(title:title , message: "Score: \(score)" , preferredStyle: .alert)
        let action = UIAlertAction(title: "дать егору пиздюлей", style: .default) { _ in
            self.round = 0
            self.curValue = 0
            self.score = 0
            self.comtuterNumber = 0
            self.ScoreLabel.text = "0"
            self.mySlider.setValue(25.0, animated: true)
            self.userNumber.text = "0"
        }
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
}
