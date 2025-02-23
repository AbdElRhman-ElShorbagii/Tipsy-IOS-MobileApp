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
    
    @IBOutlet weak var zeroPerButton: UIButton!
    
    @IBOutlet weak var tenPerButton: UIButton!
    
    @IBOutlet weak var twentyPerButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var totalPerPerson = "0"
    

    
    @IBAction func tipPerChanged(_ sender: UIButton) {
        zeroPerButton.isSelected = false
        tenPerButton.isSelected = false
        twentyPerButton.isSelected = false
        sender.isSelected = true
        let buttonTitle = sender.currentTitle!
        
        let titleWithoutPer = String(buttonTitle.dropLast())
        
        let titleToDoubleConvert = Double(titleWithoutPer)!
        
        tip = titleToDoubleConvert / 100
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        //Get the text the user typed in the billTextField
        let bill = billTextField.text!
        
        //If the text is not an empty String ""
        if bill != "" {
            
            //Turn the bill from a String e.g. "123.50" to an actual String with decimal places.
            //e.g. 125.50
            billTotal = Double(bill)!
            
            //Multiply the bill by the tip percentage and divide by the number of people to split the bill.
            let result = billTotal * (1 + tip) / Double(numberOfPeople)

            //Round the result to 2 decimal places and turn it into a String.
            let resultTo2DecimalPlaces = String(format: "%.2f", result)
            
            totalPerPerson = resultTo2DecimalPlaces
            
        }
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"  {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalPerPerson = totalPerPerson
            destinationVC.numberOfPersons = numberOfPeople
            destinationVC.tipPercentage = Int(tip * 100)
        }
    }

}
