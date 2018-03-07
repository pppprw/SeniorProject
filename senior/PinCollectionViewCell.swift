//
//  PinCollectionViewCell.swift
//  senior
//
//  Created by \ \ ' on 6/3/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit

class PinCollectionViewCell: CollectionViewCell {
    
    @IBOutlet weak var PinDestination: UIImageView!
    @IBOutlet weak var PinDestinationName: UILabel!
    @IBOutlet weak var PinUsername: UILabel!
    
    var mypin: pin!{
        didSet{
            updateData2()
        }
    }
    
    func updateData2(){
        PinDestinationName.text = mypin.title
        PinUsername.text = mypin.name
        PinDestination.image = mypin.img
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
        //self.backgroundColor = UIColor.yellow
        self.layer.borderColor = UIColor.white.cgColor
    }
    
    
}
