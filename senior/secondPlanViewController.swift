//
//  secondPlanViewController.swift
//  senior
//
//  Created by \ \ ' on 15/3/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//
import UIKit

class secondPlanViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    /////DEAW MA CHANGEEE
    var pins = pin.createList()

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var planDetailCollectionView: UICollectionView!
    
    @IBOutlet weak var desLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TRIP'S NAME
        titleLabel.text = elementsName[myIndex]
        desLabel.text = elementsName[myIndex]

        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pins.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "plandetailcell", for: indexPath) as! PlanDetailCollectionViewCell
        
        cell.mypin = pins[indexPath.row]
        
        return cell
    }
}
