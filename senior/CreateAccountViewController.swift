//
//  CreateAccountViewController.swift
//  senior
//
//  Created by \ \ ' on 24/2/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var RegisterName: UITextField!
    @IBOutlet weak var RegisterEmail: UITextField!
    @IBOutlet weak var RegisterUsername: UITextField!
    @IBOutlet weak var RegisterPassword: UITextField!
    @IBOutlet weak var RegisterConfirmPassword: UITextField!
    @IBOutlet weak var Signupbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Signupbutton.layer.masksToBounds = true
        Signupbutton.layer.cornerRadius = 7
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
