//
//  CalculateViewController.swift
//  Tipsy
//
//  Created by Алексей Гуляев on 11.08.2022.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var tipsy = Tipsy()

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    @IBAction func tipChanged(_ sender: UIButton) {

        let currentTitle =
            sender.currentTitle ?? "Не удалось получить название кнопки"
        
        switch currentTitle {
            
        case "0%":
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipsy.currentPercentOfTips = 0.0
            tipsy.currentPersentFromLabel = "0%"
            
        case "10%":
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tipsy.currentPercentOfTips = 0.1
            tipsy.currentPersentFromLabel = "10%"

        case "20%":
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tipsy.currentPercentOfTips = 0.2
            tipsy.currentPersentFromLabel = "20%"
            
        default:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipsy.currentPersentFromLabel = "0%"
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        tipsy.numberOfPerson = sender.value
        print(tipsy.numberOfPerson)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        if let unwrappedCurrentBill = billTextField.text {
            tipsy.currentBill = Double(unwrappedCurrentBill) ?? 0.0
            tipsy.getPersonalBill()
        }
        performSegue(withIdentifier: "goToResult", sender: self)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.split = tipsy.numberOfPerson
            destinationVC.tipText = tipsy.currentPersentFromLabel
            destinationVC.result = tipsy.personalBill
        }
    }
}
