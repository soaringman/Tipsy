//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Алексей Гуляев on 11.08.2022.
//

import UIKit

class ResultViewController: UIViewController {

    var split:Double = 0.0
    var tipText: String = ""
    var result: Double = 0.0

    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        totalLabel.text = String(format: "%.2f", result)
        settingsLabel.text = "Split between \(String(format: "%.0f", split)) people, with \(tipText) tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
}
