//
//  PlanDetailCollectionViewCell.swift
//  senior
//
//  Created by \ \ ' on 13/4/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit

class PlanDetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var planDetailImage: UIImageView!
    @IBOutlet weak var planDetailUsername: UILabel!
    @IBOutlet weak var planDetailDest: UILabel!
    @IBOutlet weak var planDetailLocation: UILabel!
    @IBOutlet weak var planDetailTxtView: UITextView!
    @IBOutlet weak var planDetailOpenDate: UILabel!
    @IBOutlet weak var planDetailEndDate: UILabel!
    @IBOutlet weak var planDetailFee: UILabel!
    var imageimage = UIImage()
    
    //////// DEAW MA CHANGE DUAY !!!!!!!!
    var mypin: pin!{
        didSet{
            updateData2()
        }
    }
    
    func updateData2(){
        planDetailDest.text = mypin.title
        planDetailUsername.text = mypin.name
        planDetailImage.image = mypin.img
    }
    override func awakeFromNib() {
        super.awakeFromNib()

        self.contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
        //self.backgroundColor = UIColor.yellow
        self.layer.borderColor = UIColor.white.cgColor
        
        planDetailImage.contentMode = .center
        planDetailImage.image = resizeImage(imageimage, newWidth: planDetailImage.frame.width)
    }

    func resizeImage(_ image: UIImage?, newWidth: CGFloat) -> UIImage? {

        let scale = newWidth / (planDetailImage.image?.size.width)!
        let newHeight = (planDetailImage.image?.size.height)! * scale

        let newSize = CGSize(width: newWidth, height: newHeight)

        UIGraphicsBeginImageContext(newSize)
        planDetailImage.draw(CGRect(origin: .zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
    
}
