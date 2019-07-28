//
//  ForgotpassViewController.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/24/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit
import Firebase

class ForgotpassViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnCheck: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func btn_SendResetEmail(_ sender: Any) {
        if txtEmail.text?.isEmpty == true{
            let name = Auth.auth().currentUser?.displayName
            print(name)
            Auth.auth().sendPasswordReset(withEmail: txtEmail.text!) { error in
                // ...
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ForgotpassViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
