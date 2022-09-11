//
//  ViewController.swift
//  NumberEstimate
//
//  Created by YUSUF ÖZATA on 10.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageSave: UIImageView!
    
    @IBOutlet var buttonsave: UIButton!
    
    @IBOutlet var estimateNumber: UITextField!
    @IBOutlet var textNumberEstimate: UITextField!
    @IBOutlet var imageGuess: UIImageView!
    
    @IBOutlet var buttonTry: UIButton!
    
    @IBOutlet var yelloewStars1: UIImageView!
    
    @IBOutlet var yellowStars2: UIImageView!
    
    @IBOutlet var yellowStars3: UIImageView!
    @IBOutlet var yellowStars4: UIImageView!
    
    @IBOutlet var yellowStars5: UIImageView!
    @IBOutlet var conclusionLabel: UILabel!
    
    var stars : [UIImageView] = [UIImageView]()
    var maxNumberOfAttempts : Int = 5
    var numberOfAttempts : Int = 0
    var targetNumber : Int = -1
    var gameSuccessful : Bool = false
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        stars = [yelloewStars1,yellowStars2,yellowStars3,yellowStars4,yellowStars5]
        imageSave.isHidden = true
        imageGuess.isHidden = true
        buttonTry.isEnabled = false
        estimateNumber.isSecureTextEntry = true
        conclusionLabel.text = ""
        
    }
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        imageSave.isHidden = false
        if let t = Int(estimateNumber.text!){
            targetNumber = t
            buttonTry.isEnabled = true
            textNumberEstimate.isEnabled = true
            buttonsave.isEnabled = false
            imageSave.image = UIImage(named: "confirmation")
        }else {
            imageSave.image = UIImage(named: "warning")
        }
    }
    
    @IBAction func tryButtonClicked(_ sender: UIButton) {
        
        if gameSuccessful == true || numberOfAttempts > maxNumberOfAttempts{
            return
        }
        if let enteredNumber = Int(textNumberEstimate.text!){
            numberOfAttempts += 1
            stars[numberOfAttempts-1].image = UIImage(named: "blackStar")
            imageGuess.isHidden = false
            if enteredNumber > targetNumber{
                imageGuess.image = UIImage(named: "icons8-below-40")
                textNumberEstimate.backgroundColor = UIColor.red
            } else if enteredNumber < targetNumber {
                imageGuess.image = UIImage(named: "icons8-upward-arrow-48")
                textNumberEstimate.backgroundColor = UIColor.yellow
            } else {
                estimateNumber.isSecureTextEntry = false
                conclusionLabel.text = "Succesfuly"
                conclusionLabel.backgroundColor = UIColor.green
                buttonsave.isEnabled = true
                imageGuess.image = UIImage(named: "okey-hand")
                textNumberEstimate.isSecureTextEntry = false
                gameSuccessful = true
                
                var alertController = UIAlertController(title: "Congratulations", message: "correct number", preferredStyle: UIAlertController.Style.alert)
                var okeyAction = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil)
                alertController.addAction(okeyAction)
                present(alertController, animated: true, completion: nil)
            
                
                return
                
            }
            
        }
        
        else {
            imageGuess.isHidden = false
            imageGuess.image = UIImage(named: "warning")
        }
        
        if numberOfAttempts == maxNumberOfAttempts {
            buttonTry.isEnabled = true
            imageGuess.image = UIImage(named: "warning")
            conclusionLabel.text = "game over "
            
            let alertController = UIAlertController(title: "Game Over", message: "you used all your rights", preferredStyle: UIAlertController.Style.alert)
            let okeyAction = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil)
            alertController.addAction(okeyAction)
            
            let playAgainAction = UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default) { [self]
                (action: UIAlertAction) in
                var tryAgain =  ViewController()
            }
            alertController.addAction(okeyAction)
            alertController.addAction(playAgainAction)
            
            present(alertController, animated: true, completion: nil)
            
            
            
        }
    
        
        
    }
    
    
    
    


}

