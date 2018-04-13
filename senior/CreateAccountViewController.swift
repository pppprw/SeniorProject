//
//  CreateAccountViewController.swift
//  senior
//
//  Created by \ \ ' on 24/2/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class CreateAccountViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var RegisterName: UITextField!
    @IBOutlet weak var RegisterEmail: UITextField!
    @IBOutlet weak var RegisterUsername: UITextField!
    @IBOutlet weak var RegisterPassword: UITextField!
    @IBOutlet weak var RegisterConfirmPassword: UITextField!
    
    @IBOutlet weak var SignupButton: UIButton!
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SignupButton.layer.masksToBounds = true
        SignupButton.layer.cornerRadius = 7
        // Do any additional setup after loading the view.
        
        // set reference to database
        ref = Database.database().reference()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //        RegisterName.resignFirstResponder()
    //        RegisterEmail.resignFirstResponder()
    //        RegisterUsername.resignFirstResponder()
    //        RegisterPassword.resignFirstResponder()
    //
    //        return(true)
    //    }
    
    // Alert method
    func callAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    // Sign Up method
    @IBAction func signUp (sender:UIButton){
        //let uid = "user" + String(arc4random_uniform(1000000))
        let name: String = RegisterName.text!
        let email: String = RegisterEmail.text!
        let username: String = RegisterUsername.text!
        let password: String = RegisterPassword.text!
        let conpassword: String = RegisterConfirmPassword.text!
        
        if name.isEmpty||email.isEmpty||username.isEmpty||password.isEmpty||conpassword.isEmpty{
            callAlert(title: "Error", message: "Please fill in all of the information.")
        }else if password.count < 6{
            callAlert(title: "Error", message: "Password must be longer than 6 characters.")
        }else if password != conpassword{
            callAlert(title: "Error", message: "Your password is not correct.")
        }else if isValidEmail(testStr: email) == false{
            callAlert(title: "Error", message: "Invalid email address.")
        }else{
            //TODO: check for duplicated username
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                let uid = user?.uid as! String
                if let u = user{
                    self.ref.child("Users").child(uid).child("Information").setValue(["Username": username,"FullName": name,"Email": email])
                    self.dismiss(animated: true, completion: nil)
                    print("user created :\(uid)")
                }else {
                    print(error?.localizedDescription)
                }
            }
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
