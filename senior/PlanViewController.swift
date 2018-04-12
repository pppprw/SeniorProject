//
//  PlanViewController.swift
//  senior
//
//  Created by \ \ ' on 11/3/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit

var myIndex = 0
var elements = ["P7254977","P3117408"]
var elementsName = ["Vancouver", "Seoul"]

class PlanViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var createNewPlanView: UIView!

    @IBAction func createNewPlan(_ sender: Any) {
        createNewPlanView.isHidden = false
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let plancell = tableView.dequeueReusableCell(withIdentifier: "customCell") as!  CustomTableViewCell
        
        plancell.placeLabel.text = elementsName[indexPath.row]
        plancell.placeImage.image = UIImage(named: elements[indexPath.row])
        
        return plancell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }

}
