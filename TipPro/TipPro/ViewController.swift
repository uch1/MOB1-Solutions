//
//  ViewController.swift
//  TipPro
//
//  Created by Uchenna  on 9/20/17.
//  Copyright © 2017 Uchenna Aguocha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountTextField: UITextField!
    @IBOutlet weak var totalAmountTextField: UITextField!
    
    @IBAction func calculateTip(_ sender: Any) {
        
        if let billAmount = Double(billAmountTextField.text!) {
            var tipPercentage = 0.0
            
            switch tipSelector.selectedSegmentIndex {
            case 0:
                tipPercentage = 0.15
            case 1:
                tipPercentage = 0.18
            case 2:
                tipPercentage = 0.20
            default:
                break
            }
           
            let roundedBillAmount = round(100 * billAmount) / 100
            let tipAmount = roundedBillAmount * tipPercentage
            let roundedTipAmount = round(100 * tipAmount) / 100
            let totalAmount = roundedBillAmount + roundedTipAmount
            
            if (!billAmountTextField.isEditing) {
                billAmountTextField.text = String(format: "%.2f", roundedBillAmount)
            }
            tipAmountTextField.text = String(format: "%.2f", roundedTipAmount)
            totalAmountTextField.text = String(format: "%.2f", totalAmount)
        } else {
            //show error
            billAmountTextField.text = ""
            tipAmountTextField.text = ""
            totalAmountTextField.text = ""
        }
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

