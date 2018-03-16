//
//  secondPlanViewController.swift
//  senior
//
//  Created by \ \ ' on 15/3/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//
import UIKit

class secondPlanViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var desLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = elementsName[myIndex]
        desLabel.text = elementsName[myIndex]
        myImageView.image = UIImage(named: elements[myIndex])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
