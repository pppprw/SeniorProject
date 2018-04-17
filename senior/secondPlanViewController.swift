//
//  secondPlanViewController.swift
//  senior
//
//  Created by \ \ ' on 15/3/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//
import UIKit

////////////Normallllll////////////
//import MHPinterestLayout
//import SwiftCommonUtils
//import IGListKit

//typealias Dimension5 = (captionHeight3:CGFloat, attachmentHeight3:CGFloat)

class secondPlanViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    /////DEAW MA CHANGEEE
    var pins = pin.createList()

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var planDetailCollectionView: UICollectionView!
    @IBOutlet weak var desLabel: UILabel!
    //    var layout5 = MHPinterestLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TRIP'S NAME
        titleLabel.text = elementsName[myIndex]
        desLabel.text = elementsName[myIndex]
        planDetailCollectionView.delegate = self
        planDetailCollectionView.dataSource = self
//
//        layout5.delegate = self
//        layout5.headerHeight = 10
//        layout5.footerHeight = 10
//        self.planDetailCollectionView.collectionViewLayout = layout5
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pins.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanDetailCollectionViewCell", for: indexPath) as! PlanDetailCollectionViewCell
        //cell.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        cell.mypin = pins[indexPath.row]
        
        return cell
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, heightForItemAtIndexPath indexPath: IndexPath) -> CGFloat {
//        return 700
//
////        let caption3 = pins[indexPath.row].title
////        let postedby3 = pins[indexPath.row].name
////       // let itemWidth3:CGFloat = layout5.cellContentWidth
////
////        let captionHeight3 = caption3?
////            .computedHeight(atWidth: itemWidth3, font: UIFont.systemFont(ofSize: 15))
////        let postedbyHeight3 = postedby3?.computedHeight(atWidth: itemWidth3, font: UIFont.systemFont(ofSize: 12))
////
////        let imageHeight3 = pins[indexPath.row].img
////            .computedHeight(atWidth: itemWidth3)
////        let yPaddings3:CGFloat = 10
////
////
////        return captionHeight3! + postedbyHeight3! + imageHeight3 + yPaddings3
//    }
    
}
