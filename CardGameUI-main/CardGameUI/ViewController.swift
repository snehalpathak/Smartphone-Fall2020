//
//  ViewController.swift
//  CardGameUI
//
//  Created by Ashish Ashish on 10/7/20.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var player1Img1: UIImageView!
    
    @IBOutlet weak var player1Img2: UIImageView!
    
    @IBOutlet weak var player1Img3: UIImageView!
    
    @IBOutlet weak var player2Img1: UIImageView!
    
    @IBOutlet weak var player2Img2: UIImageView!
    
    @IBOutlet weak var player2Img3: UIImageView!
    
    
    @IBOutlet weak var lblWinner: UILabel!
    
    let cards = ["2C","2D","2H","2S","3C","3D","3H","3S","4C","4D","4H","4S","5C","5D","5H","5S","6C","6D","6H","6S","7C","7D","7H","7S","8C","8D","8H","8S","9C","9D","9H","9S","10C","10D","10H","10S","AC","AD","AH","AS","JC","JD","JH","JS","QC","QD","QH","QS","KC","KD","KH","KS"]
    
    var player1card1 = -1
    var player1card2 = -1
    var player1card3 = -1
    var player2card1 = -1
    var player2card2 = -1
    var player2card3 = -1
        
    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleCards()
        resetLblWinner()
    }
    
    func shuffleCards(){
        player1card1 = Int.random(in: 0..<cards.count)
        player1card2 = Int.random(in: 0..<cards.count)
        player1card3 = Int.random(in: 0..<cards.count)
        player2card1 = Int.random(in: 0..<cards.count)
        player2card2 = Int.random(in: 0..<cards.count)
        player2card3 = Int.random(in: 0..<cards.count)
        
        player1Img1.image = UIImage(named: cards[player1card1])
        player1Img2.image = UIImage(named: cards[player1card2])
        player1Img3.image = UIImage(named: cards[player1card3])
        player2Img1.image = UIImage(named: cards[player2card1])
        player2Img2.image = UIImage(named: cards[player2card2])
        player2Img3.image = UIImage(named: cards[player2card3])
        
    }
    
    @IBAction func playGame(_ sender: Any) {
        shuffleCards()
        checkCards()
    }
    
    func checkCards(){
        print(cards[player1card1])
        if(cards[player1card1] == "AS" || cards[player1card2] == "AS" || cards[player1card3] == "AS" ){
            lblWinner.text = "Player 1 Wins !!!"
            showAlert()
        }
        else if(cards[player2card1] == "AS" || cards[player2card2] == "AS" || cards[player2card3] == "AS" ){
            lblWinner.text = "Player 2 Wins !!!"
            showAlert()
        }
        else {
            resetLblWinner()
        }
    }
    
      
    func showAlert(){
        let alert = UIAlertController(title: self.lblWinner.text, message: "Press Yes to play again", preferredStyle: .alert)
        
        let yes = UIAlertAction(title: "Yes", style: .default) { (action) in
            self.resetLblWinner()
            self.shuffleCards()
            NSLog("Yes pressed")
        }
        
        let no = UIAlertAction(title: "No", style: .cancel) { (action) in
            NSLog("No pressed")
        }
        
        alert.addAction(no)
        alert.addAction(yes)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func resetLblWinner(){
        lblWinner.text = "No Winner"
    }
}

