//
//  SigninViewController.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/9/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    //Varibles
    
    //Outlet varibles
    @IBOutlet weak var txtFullname: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
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
    
    @IBAction func btn_CreateAccount(_ sender: Any) {
        if txtEmail.text?.isEmpty == true || txtPassword.text?.isEmpty == true || txtFullname.text?.isEmpty == true{
            print("erro")
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
