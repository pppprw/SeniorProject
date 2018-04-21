//
//  ViewController.swift
//  senior
//
//  Created by \ \ ' on 13/2/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var SignInEmail: UITextField!
    @IBOutlet weak var SignInPassword: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 7
        ref = Database.database().reference()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Alert method
    func callAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func signIn(_ sender: Any) {
        let email:String = SignInEmail.text!
        let password:String = SignInPassword.text!
        if email.isEmpty == false && password.isEmpty == false{
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if error != nil{
                    print(error?.localizedDescription)
                    self.callAlert(title: "Alert!", message: "Invalid email or password.")
                }else{
                    if let u = user{
                        self.performSegue(withIdentifier: "tabBar", sender: self)
                        print("User sign in: \(user?.uid)")
                    }else{
                        print(error?.localizedDescription)
                    }
                }
            }
//            self.ref.child("Users/\(username)").observeSingleEvent(of: .value) { (snapshot) in
//                if snapshot.exists(){
//                    print (snapshot)
//                    let check = snapshot.childSnapshot(forPath: "Password").value as! String
//                    if password == check{
//                        print ("User logged in")
//                        self.performSegue(withIdentifier: "tabBar", sender: self)
//                    }else{
//                        print ("User unsuccessfully log in")
//                        self.callAlert(title: "Sorry", message: "Password is not correct")
//                    }
//                    print (check)
//                }else{
//                    self.callAlert(title: "Sorry", message: "Username doesn't exist.")
//                }
//            }
        }
    }
    
}



