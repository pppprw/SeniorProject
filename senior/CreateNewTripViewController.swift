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
    
    fileprivate weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //let dateFormatter = 
    func calendar(_ calendar: FSCalendar, didSelect date: Date) {
        print("\(date) is clicked")
    }
    


}
