//
//  ViewController.swift
//  Right on target
//
//  Created by SHREDDING on 08.06.2022.
//

import UIKit

class ViewController: UIViewController {
    var game:Game!

    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var userNumber: UILabel!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    //выбранное число
    var curValue = 0
    // score
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad")
        game = Game(startvalue: 0, endValue: 50, rounds: 5)
    }
    
    
    @IBAction func changedSlider(_ sender: UISlider) {
        userNumber.text = String(Int(sender.value))
        
    }
    
    @IBAction func checkButtonAction(_ sender: UIButton) {
        
        self.curValue = Int(self.mySlider.value)
        self.game?.calculateScore(with: self.curValue)
        self.game?.startNewRound()
        self.ScoreLabel.text = String(self.game!.score)
        if self.game.isGameEnded{
            createAlert(title: "GAME OVER", score: self.game.score)
        }
        
    }
    
    
    func createAlert(title:String,score:Int){
        let alert = UIAlertController(title:title , message: "Score: \(score)" , preferredStyle: .alert)
        let action = UIAlertAction(title: "Начать Заново", style: .default) { _ in
            self.game?.restartGame()
            self.ScoreLabel.text = "0"
            self.mySlider.setValue(25.0, animated: true)
            self.userNumber.text = "0"
        }
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    
    
    @IBAction func nextView(_ sender: UIButton) {
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewCont = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        self.present(viewCont, animated: true)
    }
    
    
}
