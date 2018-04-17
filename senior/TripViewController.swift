//
//  TripViewController.swift
//  senior
//
//  Created by \ \ ' on 18/4/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit
import MHPinterestLayout
import SwiftCommonUtils

typealias DimensionTrip = (captionHeightTrip:CGFloat, attachmentHeightTrip:CGFloat)

class TripViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, MHPinterestLayoutDelegate {
    
    ///// TOP AREA OF PAGE -->> PROFILE PIC, USERNAME, TRIP'S NAME
    @IBOutlet weak var profilepic: UIImageView!
    @IBOutlet weak var tripname: UILabel!
    @IBOutlet weak var username: UILabel!
    
    ////MIDDLE AREA
    @IBOutlet weak var collectionView: UICollectionView!
    var layout = MHPinterestLayout()
    
    //// INFORMATION THAT IS IMPLEMENTED TO THE TRIP PAGE
    var destinations = destination.createList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// TOP AREA DECORATION
        profilepic.layer.masksToBounds = true
        profilepic.layer.cornerRadius = 30
        
        /// PINTEREST LAYOUT
        layout.delegate = self
        layout.headerHeight = 10
        layout.footerHeight = 10
        self.collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return destinations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! tripCollectionViewCell
        cell.myexploretrip = destinations[indexPath.row]
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "destViewController") as! destViewController
        ////destination image////
        desVC.image = destinations[indexPath.row].img
        self.navigationController?.pushViewController(desVC, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, heightForItemAtIndexPath indexPath: IndexPath) -> CGFloat {
        
        let caption = destinations[indexPath.row].title
        let postedby = destinations[indexPath.row].name
        let itemWidth:CGFloat = layout.cellContentWidth
        
        let captionHeight = caption?
            .computedHeight(atWidth: itemWidth, font: UIFont.systemFont(ofSize: 15))
        let postedbyHeight = postedby?.computedHeight(atWidth: itemWidth, font: UIFont.systemFont(ofSize: 12))
        
        let imageHeight = destinations[indexPath.row].img
            .computedHeight(atWidth: itemWidth)
        
        let yPaddings:CGFloat = 10
        
        
        return captionHeight! + postedbyHeight! + imageHeight + yPaddings
    }
    

}
