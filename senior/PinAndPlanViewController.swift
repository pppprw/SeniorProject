//
//  PinAndPlanViewController.swift
//  senior
//
//  Created by \ \ ' on 28/2/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit

class PinAndPlanViewController: UIViewController {

    @IBOutlet weak var PinView: UIView!
    @IBOutlet weak var PlanView: UIView!
    @IBOutlet weak var secondPlanView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func ShowContainter(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0)
        {
            UIView.animate(withDuration: 0.5, animations:
            {
                    self.PinView.alpha = 0.0
                    self.PlanView.alpha = 1.0
                    self.secondPlanView.alpha = 0.0
            })
        }
        else{
            UIView.animate(withDuration: 0.5, animations: {
                self.PinView.alpha = 1.0
                self.PlanView.alpha = 0.0
                self.secondPlanView.alpha = 0.0
                })
        }
    }

}
