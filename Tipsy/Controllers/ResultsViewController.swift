//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Abdelrhman Taha on 4/5/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalPerPerson = "0.0"
    var numberOfPersons = 10
    var tipPercentage = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalPerPerson
        settingsLabel.text = "Split between \(numberOfPersons) people, with \(tipPercentage)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
