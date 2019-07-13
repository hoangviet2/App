//
//  ViewController.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/8/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit

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
    }
    @IBAction func btn_Signin(_ sender: Any) {
        print("press Signin")
    }
    

}

