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
//                    if let vc = Utils.viewController(storyboardId: HomepageViewController.className, storyboardName: HomepageViewController.className) as? HomepageViewController{
//                        self?.navigationController?.pushViewController(vc, animated: true)
//                    }
                    NotificationCenter.default.post(name: NSNotification.Name("Login_Success"), object: nil)
                   self?.navigationController?.popToRootViewController(animated: true)
                }else{
                    if let alert:UIAlertController = UIAlertController(title: "Warning", message: "Wrong account", preferredStyle: .alert){
                        let alertact = UIAlertAction(title: "back", style: .cancel, handler: nil)
                        alert.addAction(alertact)
                        self!.present(alert,animated: true,completion: nil)
                    }
                }
            }
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
