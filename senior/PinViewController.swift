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

typealias Dimension2 = (captionHeight2:CGFloat, attachmentHeight2:CGFloat)
class PinViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, MHPinterestLayoutDelegate {
    
    var pins = pin.createList()

    @IBOutlet weak var PinCollectionView: UICollectionView!
    
     var layout2 = MHPinterestLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout2.delegate = self
        layout2.headerHeight = 10
        layout2.footerHeight = 10
        self.PinCollectionView.collectionViewLayout = layout2
    

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
        
        let caption2 = pins[indexPath.row].title
        let postedby2 = pins[indexPath.row].name
        let itemWidth2:CGFloat = layout2.cellContentWidth
        
        let captionHeight2 = caption2?
            .computedHeight(atWidth: itemWidth2, font: UIFont.systemFont(ofSize: 15))
        let postedbyHeight2 = postedby2?.computedHeight(atWidth: itemWidth2, font: UIFont.systemFont(ofSize: 12))
        
        let imageHeight2 = pins[indexPath.row].img
            .computedHeight(atWidth: itemWidth2) ?? 0
        
        let yPaddings2:CGFloat = 10
        
        
        return captionHeight2! + postedbyHeight2! + imageHeight2 + yPaddings2
    }
    
    

}
