//
//  SigninViewController.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/11/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit
import Firebase

class SigninViewController: UIViewController {
    //varibles
    
    
    //Outlet varibles
    @IBOutlet weak var txtEmailLogin: UITextField!
    @IBOutlet weak var txtPasswordLogin: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblSignin: UILabel!
    @IBOutlet weak var btnForgotpass: UIButton!
    @IBOutlet weak var btnSeepass: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("class SigninViewController")
    }
    
    //Action Varibles
    @IBAction func btn_Signin(_ sender: Any) {
        if txtEmailLogin.text!.isEmpty == true || txtPasswordLogin.text!.isEmpty == true{
            print("erro")
        }else{
            Auth.auth().signIn(withEmail: txtEmailLogin.text!, password: txtPasswordLogin.text!) { [weak self] user, error in
                if let user = user{
                    AppDelegate.share().setupHomeTabBar()
                    
                }else{
                    if let alert:UIAlertController = UIAlertController(title: "Account anounment", message: "Wrong account or password", preferredStyle: .alert){
                        let alertact = UIAlertAction(title: "Retry", style: .cancel, handler: nil)
                        alert.addAction(alertact)
                        self!.present(alert,animated: true,completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func btn_Forgotpass(_ sender: Any) {
        if let vc = Utils.viewController(storyboardId: ForgotpassViewController.className, storyboardName: ForgotpassViewController.className) as? ForgotpassViewController{
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func btn_Seepass(_ sender: Any) {
        if btnSeepass.isSelected == false{
            btnSeepass.isSelected = true
            Seepass()
        }else{
            btnSeepass.isSelected = false
            Seepass()
        }
    }
    
    func Seepass() {
        if btnSeepass.isSelected == true{
            txtPasswordLogin.isSecureTextEntry = false
        }else{
            txtPasswordLogin.isSecureTextEntry = true
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
