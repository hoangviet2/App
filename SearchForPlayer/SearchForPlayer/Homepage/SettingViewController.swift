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

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblProfile: UILabel!
    @IBOutlet weak var settingtableview: UITableView!

    
    override func viewDidAppear(_ animated: Bool) {
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width / 2
        if let vc = Utils.viewController(storyboardId: SignupViewController.className, storyboardName: SignupViewController.className) as? SignupViewController{
            let name = Auth.auth().currentUser?.displayName
            lblProfile.text = name
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingtableview.delegate = self
        settingtableview.dataSource = self
//        settingtableview.dataSource = self
        // Do any additional setup after loading the view.
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
extension SettingViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            do {
                try Auth.auth().signOut()
                AppDelegate.share().setWelcome()
                
            }
            catch {
                
            }
        }
    }
}
extension SettingViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SettingTableViewCell = settingtableview.dequeueReusableCell(withIdentifier: SettingTableViewCell.className) as! SettingTableViewCell
            cell.lblTitle.text = "Logout"
            return cell
        
    }


}
