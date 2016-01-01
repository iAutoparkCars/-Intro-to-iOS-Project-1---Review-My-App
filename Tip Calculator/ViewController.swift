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
    
    @IBOutlet weak var personFour: UILabel!
    @IBOutlet weak var personThree: UILabel!
    @IBOutlet weak var personTwo: UILabel!
    @IBOutlet weak var personOne: UILabel!
    var venueTip = 0.02;
    var serviceTip = 0.01;
    var currencyValue = [1.00, 1.33, 1.54, 0.20]
    var currencyIndex = 1.00;
    
    @IBOutlet weak var imageController: UICollectionView!
    @IBOutlet weak var imageview: UICollectionViewCell!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        tipLabel.text = "$0.00"
        finalBill.text = "$0.00"
        personOne.text = "$0.00"
        personTwo.text = "$0.00"
        personThree.text = "$0.00"
        personFour.text = "$0.00"
      
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        venueTip = 0.02
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.integerForKey("defaultTipIndex")
        print("New defaults")
        print(tipValue)
        tipControl.selectedSegmentIndex = tipValue
        let themeSetting = defaults.integerForKey("themeIndex")
        let currencySetting = defaults.integerForKey("currencyIndex")
        currencyIndex = currencyValue[currencySetting]
        print(currencySetting)
        // print(themeSetting)
        if themeSetting == 1 {
            self.view.backgroundColor = UIColor.cyanColor()
        }
        else {
            self.view.backgroundColor = UIColor.whiteColor()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
        print("view did appear")
    }
    /*
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
        var totalTip = serviceTip + venueTip + tipPercentage
        print(totalTip)
        let tip = billAmount * totalTip
        let total = billAmount + tip
        
        tipLabel.text = "$ \(tip)"
        finalBill.text = "$ \(total)"
        tipLabel.text = String(format: "$%.2f", tip)
        finalBill.text = String(format: "$%.2f", total)
        personOne.text = String(format: "$%.2f", total)
        personTwo.text = String(format: "$%.2f", total/2)
        personThree.text = String(format: "$%.2f", total/3)
        personFour.text = String(format: "$%.2f", total/5)
        
    }

    @IBAction func serviceTipOne(sender: AnyObject) {
            serviceTip = 0.01
    }
    @IBAction func serviceTipTwo(sender: AnyObject) {
        serviceTip = 0.02
    }
    @IBAction func serviceTipThree(sender: AnyObject) {
        serviceTip = 0.04;
    }
    
    @IBAction func venueOne(sender: AnyObject) {
        venueTip = 0.05;
     // print(venueTip)
    }

    @IBAction func venueTwo(sender: AnyObject) {
        venueTip = 0.04;
       // print(venueTip)
    }
    @IBAction func venueThree(sender: AnyObject) {
        venueTip = 0.03;
       // print(venueTip)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

