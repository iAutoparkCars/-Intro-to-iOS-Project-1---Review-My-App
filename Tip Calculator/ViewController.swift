//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Md Miah on 12/5/15.
//  Copyright © 2015 Md Miah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var finalBill: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var imageview: UICollectionViewCell!
    override func viewDidLoad() {
        super.viewDidLoad()
        cell.imageview.image = [UIImage 23.png];
    }
    /*
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        */
    @IBAction func onEditingchange(sender: AnyObject) {
        var tipPercentages = [0.15, 0.18, 0.20]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue;
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$ \(tip)"
        finalBill.text = "$ \(total)"
        tipLabel.text = String(format: "$%.2f", tip)
        finalBill.text = String(format: "$%.2f", total)
        
    }


    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

