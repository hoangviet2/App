//
//  SigninViewController.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/11/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit

class SigninViewController: UIViewController {
    //varibles
    
    
    //Outlet varibles
    @IBOutlet weak var txtEmailLogin: UITextField!
    @IBOutlet weak var txtPasswordLogin: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblSignin: UILabel!
    @IBOutlet weak var btnForgotpass: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Action Varibles
    @IBAction func btn_Signin(_ sender: Any) {
        if txtEmailLogin.text!.isEmpty == true || txtPasswordLogin.text!.isEmpty == true{
            print("erro")
        }
    }
    
}
extension SigninViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == txtEmailLogin {
            print("text login")
        }
        if textField == txtPasswordLogin {
            print("text pass")
        }
        return true
    }
}
