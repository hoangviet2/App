//
//  ViewController.swift
//  AppRunWeb
//
//  Created by Hoang Viet on 6/6/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let arrWeb = [[" vnexpress"],[" CNN"]]
    let arrHead = ["viet nam","nuoc ngoai"]
    
    @IBOutlet weak var tblChoose: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblChoose.dataSource = self
        tblChoose.delegate = self
        
    }
}
extension ViewController:UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrWeb.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrWeb[section].count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrHead[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTableViewCell") as! CellTableViewCell
        cell.lblchoose.text = arrWeb[indexPath.section][indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let choosestorybroad = UIStoryboard(name: "ViewControllerChoose", bundle: nil)
        let chooseviewcontroll = choosestorybroad.instantiateViewController(withIdentifier: "ViewControllerChoose") as! ViewControllerChoose
        navigationController?.pushViewController(chooseviewcontroll, animated: true)
    
    }
    
}
