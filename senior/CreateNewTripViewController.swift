//
//  CreateNewTripViewController.swift
//  senior
//
//  Created by \ \ ' on 12/4/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit
import FSCalendar

class CreateNewTripViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate  {

    @IBOutlet weak var TripNameTxtfield: UITextField!
    @IBOutlet weak var WhereTxtfield: UITextField!
    @IBOutlet weak var submitStyle: UIButton!
    
    fileprivate weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        submitStyle.layer.masksToBounds = true
        submitStyle.layer.cornerRadius = 7
    }

    func getDateAsStringInUTC(date: NSDate) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd yyyy"
        let UTCTimeAsString = dateFormatter.string(from: date as Date)
        return UTCTimeAsString
    }
    var clickedArray = [String]()
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date) {
        let clickedDate = getDateAsStringInUTC(date: date as NSDate)
        print(clickedDate)
       // let selectedcolor = UIColor(red:0.63, green:0.84, blue:0.89, alpha:1.0)
        clickedArray.append(clickedDate)
        print(clickedArray)
    }
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        clickedArray.remove(at: clickedArray.count-1)
        
    }
    
    ///////// SUBMIT ACTION /////////
    @IBAction func submitAction(_ sender: UIButton) {
        let tripName = self.TripNameTxtfield.text as! String
        let whereJa = self.WhereTxtfield.text as! String
        print(tripName)
        print(whereJa)
        print("\(clickedArray[0]) - \(clickedArray[clickedArray.count-1])")
        //performSegue(withIdentifier: "gotoPlanPage", sender: self)
    }

}
