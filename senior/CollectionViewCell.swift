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
    @IBOutlet weak var usernameLabel: UILabel!
    
    var mydestination: destination!{
        didSet{
           updateData()
        }
    }
    
    func updateData(){
        myLabel.text = mydestination.title as! String
        usernameLabel.text = mydestination.name as! String
        imageView.image = mydestination.img
        imageView.layer.cornerRadius = 7
        
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
