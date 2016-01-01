//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Md Miah on 12/7/15.
//  Copyright © 2015 Md Miah. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultControl: UISegmentedControl!
    @IBOutlet weak var defaultTheme: UISegmentedControl!
    
    
    @IBOutlet weak var currencyControl: UISegmentedControl!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.integerForKey("defaultTipIndex")
        defaultControl.selectedSegmentIndex = tipValue
        let themeSetting = defaults.integerForKey("themeIndex")
        let currencySetting = defaults.integerForKey("currencyIndex")
        currencyControl.selectedSegmentIndex = currencySetting
        defaultTheme.selectedSegmentIndex = themeSetting
        if themeSetting == 1{
            self.view.backgroundColor = UIColor.cyanColor()
            self.view.tintColor = UIColor.whiteColor()
            tipLabel.textColor = UIColor.whiteColor()
            themeLabel.textColor = UIColor.whiteColor()
        }

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let themeSetting = defaults.integerForKey("themeIndex")
        defaultTheme.selectedSegmentIndex = themeSetting
        if themeSetting == 1{
            self.view.backgroundColor = UIColor.cyanColor()
            self.view.tintColor = UIColor.whiteColor()
            tipLabel.textColor = UIColor.whiteColor()
            themeLabel.textColor = UIColor.whiteColor()
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onEditingChange(sender: AnyObject) {
        var defaultTip = defaultControl.selectedSegmentIndex
        var themeSetting = defaultTheme.selectedSegmentIndex
        var currencySetting = currencyControl.selectedSegmentIndex
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTip, forKey: "defaultTipIndex")
        defaults.setInteger(themeSetting, forKey: "themeIndex")
        defaults.setInteger(currencySetting, forKey: "currencyIndex")
        if themeSetting == 1{
            self.view.backgroundColor = UIColor.cyanColor()
        }
        else {
            self.view.backgroundColor = UIColor.whiteColor()
        }
        // print(themeSetting)
        // print(defaultTip)
        defaults.synchronize()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
