//
//  tripCollectionViewCell.swift
//  senior
//
//  Created by \ \ ' on 18/4/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit

class tripCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var destination: UILabel!
    @IBOutlet weak var username: UILabel!

    
    var myexploretrip: destination!{
        didSet{
            updateData()
        }
    }
    
    func updateData(){
        destination.text = myexploretrip.title
        username.text = myexploretrip.name
        image.image = myexploretrip.img
        
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
