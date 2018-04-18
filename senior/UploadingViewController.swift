//
//  UploadingViewController.swift
//  senior
//
//  Created by \ \ ' on 26/3/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//



import UIKit
import Foundation
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth

/////////////////////////////////////

public enum UIButtonBorderSide {
    case top, bottom, left, right
}



extension UIView {
    public func addBorder(side: UIButtonBorderSide, color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        switch side {
            
        case .top: border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: width)
        case .bottom: border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        case .left: border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        case .right: border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
            
        }
        self.layer.addSublayer(border)
        
    }
    
}

/////////////////////////// START HERE ////////////////////////////////


extension UploadingViewController: MapViewControllerDelegate {
    
    func getDestination(_ destinationk: String) {
        print("\(destinationk) is already SELECTED !!!!!!!!!!!")
        self.label.text = destinationk
        let new = self.label.text as! String
        print("\(new) ma leaw jaaaaa")
        
    }

}

class UploadingViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextViewDelegate{
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ImportImageButton: UIButton!
    @IBOutlet weak var addLocationButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    /////////// POST ID KONG JUUBBYYYY ///////////////
    @IBOutlet weak var postID: UITextField!
    @IBAction func ImportImage(_ sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true){
            // after it is completed
        }
    }
    var ref: DatabaseReference!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "uploadCont" {
            if let contDestination = segue.destination as? Uploading2ViewController{
                contDestination.postID2 = postID.text!
            }
        }
        if segue.identifier == "map" {
            let mapController = segue.destination as! MapViewController
            mapController.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImportImageButton.layer.masksToBounds = true
        ImportImageButton.layer.cornerRadius = 30

        addLocationButton.addBorder(side: .bottom, color: UIColor.lightGray, width: 0.5)
        
        nextButton.layer.masksToBounds = true
        nextButton.layer.cornerRadius = 7
        
        ref = Database.database().reference()
        //self.getDestination("")
        
        descriptionTextView.delegate = self
        descriptionTextView.layer.masksToBounds = true
        descriptionTextView.layer.cornerRadius = 7
        descriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextView.layer.borderWidth = 0.5
        descriptionTextView.text = "Write a description"
        descriptionTextView.textColor = UIColor.lightGray
        descriptionTextView.selectedTextRange = descriptionTextView.textRange(from: descriptionTextView.beginningOfDocument, to: descriptionTextView.beginningOfDocument)
    }
    
    // Alert method
    func callAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if descriptionTextView.textColor == UIColor.lightGray {
            descriptionTextView.text = nil
            descriptionTextView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if descriptionTextView.text.isEmpty {
            descriptionTextView.text = "Write a description"
            descriptionTextView.textColor = UIColor.lightGray
        }
    }
  
    //Put keyboard out
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func uploadPost1(){
        let name:String = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child("Dummy").child("\(name).png")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        if let uploadData = UIImagePNGRepresentation(imageView.image!){
            storageRef.putData(uploadData, metadata: metadata ) { (metadata, error) in
                if error != nil{
                    print(error?.localizedDescription)
                    return
                }else{
                    let pID = "Post" + String(arc4random_uniform(1000000))
                    self.postID.text = pID
                    let url = metadata?.downloadURL()?.absoluteString
                    let user = Auth.auth().currentUser?.uid as! String
                    let location = self.label.text
                    let description = self.descriptionTextView.text
                    if location == "Location"{
                        self.callAlert(title: "Alert!", message: "Please choose a location.")
                        return
                    }
                    if description == "Write a description"{
                        self.ref.child("Posts").child(pID).setValue(["uid": user, "urlPost": url, "location": location])
                    }else{
                        self.ref.child("Posts").child(pID).setValue(["uid": user, "urlPost": url, "location": location, "caption": description ])
                    }
                    self.performSegue(withIdentifier: "uploadCont", sender: self)
                    print(pID)
                    print(user)
                    print(location)
                    print(description)
                    print(url)
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextView) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImage: UIImage!
        
        if let selected = info[UIImagePickerControllerEditedImage] as? UIImage{
            selectedImage = selected
        } else if let selected = info[UIImagePickerControllerOriginalImage] as? UIImage {
            selectedImage = selected
        }
        imageView.image = selectedImage
        self.dismiss(animated: true, completion:  nil)
        
    }
}



