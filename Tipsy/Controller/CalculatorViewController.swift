//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    var finalAmount = "0.0"
    var billAmount = 0.0
    var tip = 0.10
    var numberOfPerson = 2
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // testing changes
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentage = String(buttonTitle.dropLast())
        let buttonAsNumber = Double(buttonTitleMinusPercentage)!
        tip = buttonAsNumber/100
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f",sender.value)
        numberOfPerson = Int(sender.value)
        
        
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        if bill != "" {
            let total = Double(bill)! * (1 + tip) / Double(numberOfPerson)
            finalAmount = String(format: "%.2f", total)
        }
        self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = finalAmount
            destinationVC.tip = Int(tip*100)
            destinationVC.split = numberOfPerson
            
        }
            
    }
    
}
