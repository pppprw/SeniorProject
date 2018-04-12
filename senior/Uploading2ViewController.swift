//
//  Uploading2ViewController.swift
//  senior
//
//  Created by \ \ ' on 6/4/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit
import Foundation

class Uploading2ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    

    @IBOutlet weak var pickerView1: UIPickerView!
    @IBOutlet weak var pickerView2: UIPickerView!
    @IBOutlet weak var NewtripTextField: UITextField!
    @IBOutlet weak var POSTSTYLE: UIButton!
    
    let hours = ["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"]
    let minutes = ["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59"]
    let hours2 = ["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"]
    let minutes2 = ["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59"]
    
    //day button
    @IBOutlet weak var mon: UIButton!
    @IBOutlet weak var tue: UIButton!
    @IBOutlet weak var wed: UIButton!
    @IBOutlet weak var thurs: UIButton!
    @IBOutlet weak var fri: UIButton!
    @IBOutlet weak var sat: UIButton!
    @IBOutlet weak var sun: UIButton!
    
    @IBOutlet weak var addOpentime: UIButton!

    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var timeField2: UITextField!
    
    
    @IBAction func dateTapped(_ sender: UIButton) {
        if sender.layer.backgroundColor == UIColor.white.cgColor{
            sender.layer.backgroundColor = UIColor.lightGray.cgColor
            sender.setTitleColor(.white, for: .normal)
        }else {
            sender.layer.backgroundColor = UIColor.white.cgColor
            sender.setTitleColor(.lightGray , for: .normal)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView1.dataSource = self
        pickerView1.delegate = self
        pickerView2.dataSource = self
        pickerView2.delegate = self
        
        addOpentime.layer.masksToBounds = true
        addOpentime.layer.cornerRadius = 7
        
        mon.layer.masksToBounds = true
        mon.layer.borderWidth = 1
        mon.layer.borderColor = UIColor.lightGray.cgColor
        mon.layer.cornerRadius = 3
        mon.layer.backgroundColor = UIColor.white.cgColor
        
        tue.layer.masksToBounds = true
        tue.layer.borderWidth = 1
        tue.layer.borderColor = UIColor.lightGray.cgColor
        tue.layer.cornerRadius = 3
        tue.layer.backgroundColor = UIColor.white.cgColor
        
        wed.layer.masksToBounds = true
        wed.layer.borderWidth = 1
        wed.layer.borderColor = UIColor.lightGray.cgColor
        wed.layer.cornerRadius = 3
        wed.layer.backgroundColor = UIColor.white.cgColor
        
        thurs.layer.masksToBounds = true
        thurs.layer.borderWidth = 1
        thurs.layer.borderColor = UIColor.lightGray.cgColor
        thurs.layer.cornerRadius = 3
        thurs.layer.backgroundColor = UIColor.white.cgColor
        
        fri.layer.masksToBounds = true
        fri.layer.borderWidth = 1
        fri.layer.borderColor = UIColor.lightGray.cgColor
        fri.layer.cornerRadius = 3
        fri.layer.backgroundColor = UIColor.white.cgColor
        
        sat.layer.masksToBounds = true
        sat.layer.borderWidth = 1
        sat.layer.borderColor = UIColor.lightGray.cgColor
        sat.layer.cornerRadius = 3
        sat.layer.backgroundColor = UIColor.white.cgColor
        
        sun.layer.masksToBounds = true
        sun.layer.borderWidth = 1
        sun.layer.borderColor = UIColor.lightGray.cgColor
        sun.layer.cornerRadius = 3
        sun.layer.backgroundColor = UIColor.white.cgColor
        
        // label
        timeField.inputView = pickerView1
        timeField.textAlignment = .center
        
        timeField2.inputView = pickerView2
        timeField2.textAlignment = .center
 
        timeTableView.isHidden = true
        
        POSTSTYLE.layer.masksToBounds = true
        POSTSTYLE.layer.cornerRadius = 7
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if (pickerView == pickerView1) {
            return 2
        } else{
            return 2
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == pickerView1){
            if component == 0 {
                return hours[row]
            } else{
                return minutes[row]
            }
        } else {
            if component == 0 {
                return hours2[row]
            } else{
                return minutes2[row]
            }
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == pickerView1){
            if component == 0{
                return hours.count
            } else{
                return minutes.count
            }
        } else{
            if component == 0{
                return hours2.count
            } else{
                return minutes2.count
            }
        }
    }
    

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view as? UILabel { label = v }
        label.font = UIFont (name: "Helvetica Neue", size: 15)
        if pickerView == pickerView1 {
            if component == 0{
                label.text =  hours[row]
            } else{
                label.text =  minutes[row]
            }
        } else {
            if component == 0{
                label.text =  hours2[row]
            } else{
                label.text =  minutes2[row]
            }
        }
        label.textAlignment = .center
        return label
    }
    
    var openTime = ""
    var closeTime = ""
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == pickerView1 {
            var hour = hours[pickerView1.selectedRow(inComponent: 0)]
            var minute = minutes[pickerView1.selectedRow(inComponent: 1)]
            if component == 0{
                hour = hours[row]
            } else{
                minute = minutes[row]
            }
            timeField.text = "\(hour) : \(minute)"
            timeField.resignFirstResponder()
            timeField.isHidden = true
            openTime = timeField.text!
        } else {
            var hour2 = hours2[pickerView2.selectedRow(inComponent: 0)]
            var minute2 = minutes2[pickerView2.selectedRow(inComponent: 1)]
            if component == 0{
                hour2 = hours2[row]
            } else{
                minute2 = minutes2[row]
            }
            timeField2.text = "\(hour2) : \(minute2)"
            timeField2.resignFirstResponder()
            timeField2.isHidden = true
            closeTime = timeField2.text!
        }
        
        
    }
    
    var m = 0
    var t = 0
    var w = 0
    var th = 0
    var f = 0
    var sa = 0
    var su = 0
    
    var openDate = [String]()
    
    @IBOutlet weak var timeTableView: UITableView!
    var list = [String]()
    
    @IBOutlet weak var placeholder: UILabel!
    @IBAction func addAction(_ sender: AnyObject) {
        
        //button//
        if (mon.layer.backgroundColor == UIColor.lightGray.cgColor){
            m = 1
            openDate.append("Mon")
        }
        if (tue.layer.backgroundColor == UIColor.lightGray.cgColor){
            t = 1
            openDate.append("Tue")
        }
        if (wed.layer.backgroundColor == UIColor.lightGray.cgColor){
            w = 1
            openDate.append("Wed")
        }
        if (thurs.layer.backgroundColor == UIColor.lightGray.cgColor){
            th = 1
            openDate.append("Thurs")
        }
        if (fri.layer.backgroundColor == UIColor.lightGray.cgColor){
            f = 1
            openDate.append("Fri")
        }
        if (sat.layer.backgroundColor == UIColor.lightGray.cgColor){
            sa = 1
            openDate.append("Sat")
        }
        if (sun.layer.backgroundColor == UIColor.lightGray.cgColor){
            su = 1
           openDate.append("Sun")
        }
        
        //pickerView//
        print("\(openTime) - \(closeTime)")
        print(openDate)
        print(openDate[0],openDate[openDate.count-1])
        
        
        // action to table view
        if (timeField.text != ""){
            self.list.append("\(openDate[0]) - \(openDate[openDate.count-1])  :  \(openTime) - \(closeTime)")
            timeTableView.reloadData()
        } else {
            print("nothing is selected")
        }
        
        //Table
        if timeTableView.isHidden == true{
            timeTableView.isHidden = !timeTableView.isHidden
            placeholder.isHidden = true
            
        }
        
        mon.layer.backgroundColor = UIColor.white.cgColor
        mon.setTitleColor(.lightGray , for: .normal)
        tue.layer.backgroundColor = UIColor.white.cgColor
        tue.setTitleColor(.lightGray , for: .normal)
        wed.layer.backgroundColor = UIColor.white.cgColor
        wed.setTitleColor(.lightGray , for: .normal)
        thurs.layer.backgroundColor = UIColor.white.cgColor
        thurs.setTitleColor(.lightGray , for: .normal)
        fri.layer.backgroundColor = UIColor.white.cgColor
        fri.setTitleColor(.lightGray , for: .normal)
        sat.layer.backgroundColor = UIColor.white.cgColor
        sat.setTitleColor(.lightGray , for: .normal)
        sun.layer.backgroundColor = UIColor.white.cgColor
        sun.setTitleColor(.lightGray , for: .normal)
        
        openDate = [String]()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let timeCell = UITableViewCell(style: .default, reuseIdentifier: "timecell")
        timeCell.textLabel?.text = list[indexPath.row]
        
        return timeCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            self.list.remove(at: indexPath.row)
            timeTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timeTableView.reloadData()
    }
    
    //////////////////  Collection View  ////////////////////
    
    @IBOutlet weak var TripNameCollectionView: UICollectionView!
    var tripCount = trips.count
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
            return tripCount+1
        
    
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = TripNameCollectionView.dequeueReusableCell(withReuseIdentifier: "namecell", for: indexPath) as! TripNameCollectionViewCell
        let newTrip = NewtripTextField.text
        var trips2 = [String]()
        
        if newTrip != ""{
            trips2.append(newTrip!)
            for i in 0...tripCount-1 {
                trips2.append(trips[i])
            }
            
        }else{
            for i in 0...tripCount-1 {
                trips2.append(trips[i])
            }
            trips2.append("")
        }
        cell.labellabellabel.text = trips2[indexPath.row]
        print(trips2)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let selectedCell:UICollectionViewCell = TripNameCollectionView.cellForItem(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.lightGray
        
        let myCell = TripNameCollectionView.cellForItem(at: indexPath) as! TripNameCollectionViewCell
        myCell.labellabellabel.textColor = UIColor.white
        
    
        // when selected, colour change !!!!
        if indexPath.row == 0{
            print(trips[0])
        }
        if indexPath.row == 1{
            print(trips[1])
        }
        if indexPath.row == 2{
            print(trips[2])
        }
        if indexPath.row == 3{
            print(trips[3])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let deselectedCell:UICollectionViewCell = TripNameCollectionView.cellForItem(at: indexPath)!
        deselectedCell.contentView.backgroundColor = UIColor.white
        
        let demyCell = TripNameCollectionView.cellForItem(at: indexPath) as! TripNameCollectionViewCell
        demyCell.labellabellabel.textColor = UIColor.lightGray
    }
    
    @IBAction func POSTACTION(_ sender: UIButton) {
        self.TripNameCollectionView.reloadData()
       

    }
    
}

