//
//  EditProfileViewController.swift
//  senior
//
//  Created by \ \ ' on 17/4/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var submit: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        userImage.layer.masksToBounds = true
        userImage.layer.cornerRadius = 75
        submit.layer.masksToBounds = true
        submit.layer.cornerRadius = 7
    }

}
