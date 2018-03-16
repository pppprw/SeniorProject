//
//  destViewController.swift
//  senior
//
//  Created by \ \ ' on 16/3/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit

var destinations = destination.createList()

class destViewController: UIViewController {


    @IBOutlet weak var destImage: UIImageView!
    
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        destImage.image = image

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
