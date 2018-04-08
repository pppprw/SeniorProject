//
//  ViewController.swift
//  senior
//
//  Created by \ \ ' on 13/2/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

// im fat and gay

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var SignInUsername: UITextField!
    @IBOutlet weak var SignInPassword: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
        let username:String = SignInUsername.text!
        let password:String = SignInPassword.text!
        
        
        if username.isEmpty == false && password.isEmpty == false{
            self.ref.child("Users/\(username)").observeSingleEvent(of: .value) { (snapshot) in
                if snapshot.exists(){
                    let check = snapshot.childSnapshot(forPath: "Password").value as! String
                    if password == check{
                        print ("User logged in")
                        self.performSegue(withIdentifier: "tabBar", sender: self)
                    }else{
                        print ("User unsuccessfully log in")
                    }
                    print (check)
                    print (snapshot)
                    
                }else{
                    self.callAlert(title: "Sorry", message: "Username doesn't exist.")
                }
                
            }
        }
    }
    
}



