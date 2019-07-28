//
//  HomepageViewController.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/14/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit

class HomepageViewController: UIViewController {
    //Outlet varibles
    @IBOutlet weak var homepagetableview: UITableView!
    
    //other varibles
    let arrtitle = ["We are working hard on providing new ways and content, just wait!","looking to play","few surprises","Adjustments"]
    let arrbtntitle = ["looking for players","looking to play","few surprises","Adjustments"]
    override func viewDidLoad() {
        super.viewDidLoad()
        homepagetableview.delegate = self
        homepagetableview.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }b
    */

}
extension HomepageViewController:UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrtitle.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = homepagetableview.frame.size.height / CGFloat(arrtitle.count)
        return height
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            if let vc = Utils.viewController(storyboardId: LookingtoplayViewController.className, storyboardName: LookingtoplayViewController.className){
                navigationController?.pushViewController(vc, animated: true)
            }
        default:
            print("Erro")
        }
    }
}

extension HomepageViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrtitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:HomepagecellTableViewCell = homepagetableview.dequeueReusableCell(withIdentifier: HomepagecellTableViewCell.className) as! HomepagecellTableViewCell
        cell.lblTitle.text = arrtitle[indexPath.row]
        cell.btntitle.setTitle(arrbtntitle[indexPath.row], for: .normal)
        if indexPath.row == 2{
             cell.btnlock.isHidden = false
        }else{
            cell.btnlock.isHidden = true
        }
        return cell
    }
    
    
}
