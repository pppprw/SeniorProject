//
//  EditProfileViewController.swift
//  senior
//
//  Created by \ \ ' on 17/4/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var newUsername: UITextField!
    @IBOutlet weak var submit: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        userImage.layer.masksToBounds = true
        userImage.layer.cornerRadius = 75
        submit.layer.masksToBounds = true
        submit.layer.cornerRadius = 7
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseProf(tapGestureRecognizer:)))
        userImage.isUserInteractionEnabled = true
        userImage.addGestureRecognizer(tapGestureRecognizer)
    }

    func chooseProf(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        print("Select Pic jaa")
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true){
            // after it is completed
        }
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
        userImage.image = selectedImage
        self.dismiss(animated: true, completion:  nil)
        
    }
}
