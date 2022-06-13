//
//  SelectColorViewController.swift
//  Right on target
//
//  Created by SHREDDING on 10.06.2022.
//

import UIKit

class SelectColorViewController: UIViewController {
    
    
    
    @IBOutlet weak var buttonFirstChoiceOutlet: UIButton!
    
    @IBOutlet weak var buttonSecondChoiceOutlet: UIButton!
    
    @IBOutlet weak var buttonThirdChoiceOutlet: UIButton!
    
    @IBOutlet weak var buttonFourthChoiceOutlet: UIButton!
    
    @IBOutlet weak var currentColor: UILabel!

    @IBOutlet weak var scoreLabel: UILabel!
    
    var game:GameColor!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        game = GameColor(numberOfRounds: 5)
        changeValues()
        
        
    }
    
    
    @IBAction func buttonChoiceAction(_ sender: UIButton) {
        
        let currentColor = game.colors[sender.tag]
        game.calculateScore(currentColor.0)
        scoreLabel.text = String(game.score)
        if game.gameIsEnded{
            createAlert(title: "GAME OVER", score: game.score)
        }else{
            game.startRound()
            changeValues()
        }
    }
    
    func createAlert(title:String,score:Int){
        let alert = UIAlertController(title:title , message: "Score: \(score)" , preferredStyle: .alert)
        let action = UIAlertAction(title: "Начать Заново", style: .default) { _ in
            self.game?.restartGame()
            self.scoreLabel.text = "0"
        }
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func changeValues(){
        currentColor.text = game.secretColor.1
        buttonFirstChoiceOutlet.tintColor = game.colors[0].0
        
        buttonSecondChoiceOutlet.tintColor = game.colors[1].0
        
        buttonThirdChoiceOutlet.tintColor = game.colors[2].0
        
        buttonFourthChoiceOutlet.tintColor = game.colors[3].0
        
        
    }
    
    
}
