//
//  SettingViewController.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/16/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit
import Firebase

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btn_Logout(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            NotificationCenter.default.post(name: NSNotification.Name("Logout_Success"), object: nil)
            self.tabBarController?.selectedIndex = 0
            self.navigationController?.popToRootViewController(animated: true)
        }
        catch {
            
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
