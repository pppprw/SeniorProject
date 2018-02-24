//
//  ViewController.swift
//  senior
//
//  Created by \ \ ' on 13/2/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var FacebookButton: UIButton!
    @IBOutlet weak var skipRegisterButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        registerButton.layer.cornerRadius = 7
        FacebookButton.layer.cornerRadius = 7
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



