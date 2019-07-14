//
//  ViewController.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/8/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnSignin: UIButton!
    @IBOutlet weak var lblSignup: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_Signup(_ sender: Any) {
        print("press Signup")
        if let vc = Utils.viewController(storyboardId: SignupViewController.className, storyboardName: SignupViewController.className) as? SignupViewController{
            print("\(SignupViewController.className)")
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    @IBAction func btn_Signin(_ sender: Any) {
        print("press Signin")
        if let vc = Utils.viewController(storyboardId: SigninViewController.className, storyboardName: SigninViewController.className) as? SigninViewController{
            print("\(SigninViewController.className)")
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    

}

