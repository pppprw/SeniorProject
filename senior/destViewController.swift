//
//  destViewController.swift
//  senior
//
//  Created by \ \ ' on 16/3/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit


var destinations = destination.createList()

class destViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var comment = ["Thank you so much for your useful information!", "This looks nice"]
    let username = ["jubbyjubbs", "prw"]
    let images = ["IMG_6264", "prw"]
    

    @IBOutlet weak var destImage: UIImageView!
    @IBOutlet weak var exploreButton: UIButton!
    @IBOutlet weak var myTableView: UITableView!
    
    
    //for comment
    @IBOutlet weak var input: UITextField!
   
    @IBAction func addComment(_ sender: AnyObject) {
            comment.append(input.text!)
    }
   
    
    var image = UIImage()
    
    // TRONE NEEEE CLICKABLE LABEL AT DESTVIEWCONTROLLER NA JA ( USERNAME, NAMEOFDEST, LOCATION )
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var NameOfDestination: UILabel!
    @IBOutlet weak var usernameLabelelelel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        destImage.layer.masksToBounds = true
        destImage.layer.cornerRadius = 10
        destImage.image = image
        destImage.contentMode = .top
        destImage.image = resizeImage(image, newWidth: destImage.frame.width)
        
        exploreButton.layer.masksToBounds = true
        exploreButton.layer.cornerRadius = 7
        
        let locationtap = UITapGestureRecognizer(target: self, action: #selector(destViewController.locationtapFunction))
        locationName.isUserInteractionEnabled = true
        locationName.addGestureRecognizer(locationtap)
        
        let destinationtap = UITapGestureRecognizer(target: self, action: #selector(destViewController.desttapFunction))
        NameOfDestination.isUserInteractionEnabled = true
        NameOfDestination.addGestureRecognizer(destinationtap)
        
        let usertap = UITapGestureRecognizer(target: self, action: #selector(destViewController.usertapFunction))
        usernameLabelelelel.isUserInteractionEnabled = true
        usernameLabelelelel.addGestureRecognizer(usertap)
        
    }
    
    ////////////////// FUNCTION BAB TAPGESTURE
    @objc func locationtapFunction(sender:UITapGestureRecognizer) {
        print("location working")
        performSegue(withIdentifier: "location", sender: UILabel.self)
    }
    @objc func desttapFunction(sender:UITapGestureRecognizer) {
        print("dest working")
    
    }
    @objc func usertapFunction(sender:UITapGestureRecognizer) {
        print("user working")
        performSegue(withIdentifier: "userprofilesegue", sender: UILabel.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "location" {
            if let locationDestination = segue.destination as? SecondViewController{
                locationDestination.name2 = locationName.text
            }
        }
        if segue.identifier == "userprofilesegue" {
            if let profileDestination = segue.destination as? ProfileViewController{
                profileDestination.name3 = usernameLabelelelel.text
            }
        }
        
    }
    
    /////// ADDITIONALLLLL FOR RESIZE IMAGE
    
    func resizeImage(_ image: UIImage?, newWidth: CGFloat) -> UIImage? {
        guard let image = image else {
            return nil
        }
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        
        let newSize = CGSize(width: newWidth, height: newHeight)
        
        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(origin: .zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }

    
    
    @IBAction func ExplorethistripAction(_ sender: UIButton) {
        performSegue(withIdentifier: "explorethistrip", sender: UIButton.self)
    }
    
    ////////// TABLE VIEW KUE PUAK COMMMENTTTT NA DERRRRRR
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell") as! CommentTableViewCell
        
        cell.userprofile.image = UIImage(named: images[indexPath.row])
        cell.username.text = username[indexPath.row]
        cell.comment.text = comment[indexPath.row]
        
        return cell
    }
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
