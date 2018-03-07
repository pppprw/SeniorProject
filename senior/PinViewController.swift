//
//  PinViewController.swift
//  senior
//
//  Created by \ \ ' on 6/3/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit
import MHPinterestLayout
import SwiftCommonUtils

typealias Dimension2 = (captionHeight:CGFloat, attachmentHeight:CGFloat)
class PinViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, MHPinterestLayoutDelegate {
    
    var pins = pin.createList()

    @IBOutlet weak var PinCollectionView: UICollectionView!
    
     var layout = MHPinterestLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.delegate = self
        layout.headerHeight = 10
        layout.footerHeight = 10
    

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pins.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pincell = collectionView.dequeueReusableCell(withReuseIdentifier: "pincell", for: indexPath) as! PinCollectionViewCell
        
        pincell.mypin = pins[indexPath.row]

        return pincell
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForItemAtIndexPath indexPath: IndexPath) -> CGFloat {
        
        let caption = pins[indexPath.row].title
        let postedby = pins[indexPath.row].name
        let itemWidth:CGFloat = layout.cellContentWidth
        
        let captionHeight = caption?
            .computedHeight(atWidth: itemWidth, font: UIFont.systemFont(ofSize: 15))
        let postedbyHeight = postedby?.computedHeight(atWidth: itemWidth, font: UIFont.systemFont(ofSize: 12))
        
        let imageHeight = pins[indexPath.row].img
            .computedHeight(atWidth: itemWidth) ?? 0
        
        let yPaddings:CGFloat = 10
        
        
        return captionHeight! + postedbyHeight! + imageHeight + yPaddings
    }
    
    

}