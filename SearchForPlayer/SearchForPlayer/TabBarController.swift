//
//  TabBarController.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/16/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit
import Firebase

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let home = Utils.viewController(storyboardId: HomepageViewController.className, storyboardName: HomepageViewController.className) as! HomepageViewController
        home.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage.init(named: "travelr_tabbar_home_icon"), selectedImage: UIImage.init(named: "travelr_tabbar_home_selected_icon"))
        
        let setting = Utils.viewController(storyboardId: SettingViewController.className, storyboardName: SettingViewController.className) as! SettingViewController
        setting.tabBarItem = UITabBarItem.init(title: "Setting", image: UIImage.init(named: "travelr_profile_settings_icon"), selectedImage: UIImage.init(named: "travelr_tabbar_profile_selected_icon"))
        self.viewControllers = [home, setting]
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name?(NSNotification.Name(rawValue: "Login_Success")), object: nil, queue: nil) { (login) in
            self.dismiss(animated: false)
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name?(NSNotification.Name(rawValue: "Logout_Success")), object: nil, queue: nil) { (logout) in
            self.welcome()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
//        if AppDelegate.instanceMethod(for: Selector!).checkuser(AppDelegate){
//
//        }
//        else {
//            self.welcome()
//        }
//        let delegate = UIApplication.shared.delegate as! AppDelegate
//        if delegate.checkuser(){
//
//        }else{
//            self.welcome()
//        }
    }
    func welcome() {
        if let vc = Utils.viewController(storyboardId: WelcomeViewController.className, storyboardName: "Main") as? WelcomeViewController{
            print("Welcome")
            let nav: UINavigationController = UINavigationController(rootViewController: vc)
            self.present(nav, animated: false, completion: {
                print("go on welcome")
            })
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
