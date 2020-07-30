//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    var tip : TipBrain?
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPcButton.isSelected = false
        if sender.currentTitle == "20%"{
            twentyPcButton.isSelected = true
        }
        else if sender.currentTitle == "10%"{
            tenPctButton.isSelected = true
        }
        else{
            zeroPctButton.isSelected = true
        }
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = String(Int(sender.value))
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        billTextField.endEditing(true)
        if(twentyPcButton.isSelected){
            tip = TipBrain(amount: Float(billTextField.text ?? "0"), percentage: 0.2, split: Int(splitNumberLabel.text ?? "1"))
        }
        else if tenPctButton.isSelected {
            tip = TipBrain(amount: Float(billTextField.text ?? "0"), percentage: 0.1, split: Int(splitNumberLabel.text ?? "1"))
        }
        else{
            tip = TipBrain(amount: Float(billTextField.text ?? "0"), percentage: 0.0, split: Int(splitNumberLabel.text ?? "1"))
        }
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult"){
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tip = self.tip!
        }
    }

}

