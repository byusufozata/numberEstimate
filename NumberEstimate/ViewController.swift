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
    var numberOfAttempts : Int = -1
    var targetNumber : Int = -1
    var gameSuccessful : Bool = false
    
    
    
    

    override func viewDidLoad() {
        
        stars = [yelloewStars1,yellowStars2,yellowStars3,yellowStars4,yellowStars5]
        super.viewDidLoad()
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
            textNumberEstimate.isEnabled = false
            buttonsave.isEnabled = false
            imageSave.image = UIImage(named: "confirmation")
        }else {
            imageSave.image = UIImage(named: "warning")
        }
    }
    
    @IBAction func tryButtonClicked(_ sender: UIButton) {
    }
    
    
    
    


}

