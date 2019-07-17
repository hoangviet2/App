//
//  ViewController.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/8/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnSignin: UIButton!
    @IBOutlet weak var lblSignup: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            // User is signed in.
//            if let vc = Utils.viewController(storyboardId: HomepageViewController.className, storyboardName: HomepageViewController.className) as? HomepageViewController{
//                navigationController?.pushViewController(vc, animated: true)
//            }
            // ...
        } else {
            // No user is signed in.
            
            // ...
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_Signup(_ sender: Any) {
        print("press Signup")
        if let vc = Utils.viewController(storyboardId: SignupViewController.className, storyboardName: SignupViewController.className) as? SignupViewController{
            print("\(SignupViewController.className)")
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    @IBAction func btn_Signin(_ sender: Any) {
        print("press Signin")
        if let vc = Utils.viewController(storyboardId: SigninViewController.className, storyboardName: SigninViewController.className) as? SigninViewController{
            print("\(SigninViewController.className)")
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    

}

