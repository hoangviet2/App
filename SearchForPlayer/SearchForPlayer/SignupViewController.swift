//
//  SigninViewController.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/9/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {
    
    //Outlet varibles
    @IBOutlet weak var txtFullname: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnSeepass: UIButton!
    
    //varibles

   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Action varibles
    @IBAction func btn_SwitchSignin(_ sender: Any) {
        if let vc = Utils.viewController(storyboardId: SigninViewController.className, storyboardName: SigninViewController.className) as? SigninViewController{
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func btn_Terms(_ sender: Any) {
    
    }
    
    @IBAction func btn_Seepass(_ sender: Any) {
        if btnSeepass.isSelected == false {
            btnSeepass.isSelected == true
        }else{
            btnSeepass.isSelected == false
        }
    }
    
    @IBAction func btn_CreateAccount(_ sender: Any) {
        if txtEmail.text?.isEmpty == true || txtPassword.text?.isEmpty == true || txtFullname.text?.isEmpty == true{
            print("erro")
        }else{
            Auth.auth().createUser(withEmail: txtEmail.text!, password: txtPassword.text!) { authResult, error in
                if authResult != nil {
                    if Auth.auth().currentUser?.isEmailVerified == false {
                        Auth.auth().currentUser?.sendEmailVerification { (error) in
                        }
                    }
                    AppDelegate.share().setupHomeTabBar()
                    
                }else{
                    print("create fail")
                }
            }
        }
    }
    

}
extension SignupViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == txtFullname{
            print(txtFullname.text as! String)
        }
        if textField == txtEmail{
            print(txtEmail.text as! String)
        }
        if textField == txtPassword{
            print(txtPassword.text as! String)
        }
        return true
    }
}
