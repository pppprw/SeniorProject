//
//  UploadingViewController.swift
//  senior
//
//  Created by \ \ ' on 26/3/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//



import UIKit
import Foundation


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

class UploadingViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func ImportImage(_ sender: AnyObject) {
        
        let controller = UIImagePickerController()
        
        controller.delegate = self
        
        controller.sourceType = .photoLibrary
        self.present(controller, animated: true){
            // after it is completed
  
        }
        
    }
    
    @IBOutlet weak var ImportImageButton: UIButton!
    
    @IBOutlet weak var addLocationButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        ImportImageButton.layer.masksToBounds = true
        ImportImageButton.layer.cornerRadius = 30

        addLocationButton.addBorder(side: .bottom, color: UIColor.lightGray, width: 0.5)
        
        nextButton.layer.masksToBounds = true
        nextButton.layer.cornerRadius = 7
        
        //self.getDestination("")
        
    }
  
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = selectedImage
        self.dismiss(animated: true, completion:  nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "map" {
            let mapController = segue.destination as! MapViewController
            mapController.delegate = self
        }
    }
}



