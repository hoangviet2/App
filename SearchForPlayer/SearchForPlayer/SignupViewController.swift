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
            btnSeepass.isSelected = true
            txtPassword.isSecureTextEntry = false
        }else{
            txtPassword.isSecureTextEntry = true
            btnSeepass.isSelected = false
        }
    }
    
    @IBAction func btn_CreateAccount(_ sender: Any) {
        if let email = self.txtEmail.text, email.count > 0, let password = txtPassword.text, password.count > 0, let fullname = self.txtFullname.text, fullname.count > 0{
            AppDelegate.share().createEmailUserByFirebase(email: email, password: password) { (status, auth, error) in
                if status {
                    
                }
                else if let error = error?.localizedDescription{
                    let alert = UIAlertController(title: "", message: error, preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Got It", style: UIAlertAction.Style.destructive, handler: { (abc) in
                        //
                    })
                    alert.addAction(ok)
                    self.present(alert, animated: true, completion: {
                        //
                    })
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
