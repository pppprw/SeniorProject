//
//  CollectionViewCell.swift
//  senior
//
//  Created by \ \ ' on 19/2/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var mydestination: destination!{
        didSet{
            updateData()
        }
    }
    
    func updateData(){
        myLabel.text = mydestination.title
        imageView.image = mydestination.img
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}
