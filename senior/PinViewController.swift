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
class PinViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, MHPinterestLayoutDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pins = pin.createList()

    @IBOutlet weak var PinCollectionView: UICollectionView!
    
    var layout2 = MHPinterestLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout2.delegate = self
        layout2.headerHeight = 10
        layout2.footerHeight = 10
        self.PinCollectionView.collectionViewLayout = layout2
        
        choosePlanpickerView.delegate = self
        choosePlanpickerView.dataSource = self
    }
        
        
        // when create new plan is clicked -> perform segue createPlanfromPin
//   let clicktoplan = UITapGestureRecognizer(target: self, action: #selector(PinViewController.plantapfunction))
//        choosePlanpickerView.isUserInteractionEnabled = true
//        choosePlanpickerView.addGestureRecognizer(clicktoplan)
//
//    }
//    @objc func plantapfunction(sender:UITapGestureRecognizer) {
//        print("0 working")
//        performSegue(withIdentifier: "createPlanfromPin", sender: self)
//    }
    
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
            .computedHeight(atWidth: itemWidth2) 
        let yPaddings2:CGFloat = 10
        
        
        return captionHeight2! + postedbyHeight2! + imageHeight2 + yPaddings2
    }

    ////////////// ADD TO PLAN ////////////////
    @IBOutlet weak var pickerViewBg: UIView!
    @IBOutlet weak var choosePlanpickerView: UIPickerView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var addtoTripTxtfield: UITextField!
    @IBOutlet weak var addToUrPlan: UILabel!
    @IBAction func addtoplanAction(_ sender: UIButton) {
        if choosePlanpickerView.isHidden == true && pickerViewBg.isHidden == true && doneButton.isHidden == true && addToUrPlan.isHidden == true{
            choosePlanpickerView.isHidden = false
            pickerViewBg.isHidden = false
            doneButton.isHidden = false
            addToUrPlan.isHidden = false
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return elementsName.count+1
    }
    
    var planChoices = ["Create New Plan"]
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        planChoices.append(contentsOf: elementsName)
        return planChoices[row]
    }
    
    var selectRow: Int = 0
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //pickerView.isHidden = true
        planChoices.append(contentsOf: elementsName)
        print(planChoices[row])
        print(row)
        selectRow = row
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()

        planChoices.append(contentsOf: elementsName)
        
        if let v = view as? UILabel { label = v }
        label.font = UIFont (name: "Helvetica Neue", size: 17)
        label.text =  planChoices[row]
        label.textAlignment = .center
        return label
    }
    
    @IBAction func doneAction(_ sender: Any) {
        choosePlanpickerView.isHidden = true
        pickerViewBg.isHidden = true
        doneButton.isHidden = true
        addToUrPlan.isHidden = true
        
        if selectRow == 0{
            performSegue(withIdentifier: "createPlanfromPin", sender: self)
        }
        //planChoices.append(contentsOf: elementsName)
        print("\(planChoices[selectRow]) is selected na jaaaaaaaaa")
        
    }
    
}
