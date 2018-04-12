//
//  TripNameCollectionViewCell.swift
//  senior
//
//  Created by \ \ ' on 10/4/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit

class TripNameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labellabellabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
        //self.backgroundColor = UIColor.yellow
        self.layer.borderColor = UIColor.lightGray.cgColor
    }

}
