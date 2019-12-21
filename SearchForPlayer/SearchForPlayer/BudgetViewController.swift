//
//  BudgetViewController.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/28/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit
import Firebase

enum Budgetcelltype: String {
    case BudgetpeiceTableViewCell, DetailTableViewCell, NoticeTableViewCell
}
protocol BudgetViewControllerdelegate {
    func btn_Press(_ cell: BudgetViewController)
}

class BudgetViewController: UIViewController {
    
    var cellType: LookingCellType?
    var delegate : BudgetViewControllerdelegate?

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblTitlepage: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    var sectionInfos = [[String:Any]]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitlepage.text = "Budget"
        // Do any additional setup after loading the view.
        // Configure height for cell
        tableview.estimatedRowHeight = 250
        tableview.rowHeight = UITableView.automaticDimension
        
        // Register cell for tableview
        Utils.registerNibWithTableView(nibName: BudgetpeiceTableViewCell.className, tableView: tableview)
        Utils.registerNibWithTableView(nibName: DetailTableViewCell.className, tableView: tableview)
        Utils.registerNibWithTableView(nibName: BudgetTableViewCell.className, tableView: tableview)
        Utils.registerNibWithTableView(nibName: NoticeTableViewCell.className, tableView: tableview)
        
        var items = [[String:Any]]()
        
        var item0 : [String:Any] = [:]
        item0["CellType"] = Budgetcelltype.BudgetpeiceTableViewCell
        
        var data0 = [String:Any]()
        data0["text1"] = "Budget per person: "
        data0["text2"] = "how much you want every extra player to pay:"
        data0["max"] = Float(100)
        data0["curentThumb"] = Float(0)
        data0["min"] = Float(0)
        
        item0["Object"] = data0
        //
        
        var item1 : [String:Any] = [:]
        item1["CellType"] = Budgetcelltype.DetailTableViewCell
        
        var data1 = [String:Any]()
        data1["text1"] = "cost of the field:"
        data1["text2"] = "total quantity of players: "
        data1["text3"] = "allows us to calculate an accurate price per person."
        
        item1["Object"] = data1
        
        //
        var item2 : [String:Any] = [:]
        item2["CellType"] = Budgetcelltype.NoticeTableViewCell
        
        var data2 = [String:Any]()
        
        data2["detail"] = "Note: you can play with the ammount of money that certain player has to pay, whoever once he has accept your offer, there is an agreement between you and the player. disclaimer: we are not responsable for any debt or monetary compensation left by a player, we recomend paying before playing to assure"
        item2["Object"] = data2
        
        items.append(item0)
        items.append(item1)
        items.append(item2)
        
        //update
        if items.isEmpty == false {
            self.sectionInfos = items
            tableview.reloadData()
        }
    }
    
    @IBAction func btn_PressBack(_ sender: Any) {
        btn_PressBack(self)
    }

}
extension BudgetViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionInfos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let item = sectionInfos[indexPath.row] as? [String:Any] {
            if let type = item["CellType"] as? Budgetcelltype {
                if type == Budgetcelltype.BudgetpeiceTableViewCell {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: BudgetpeiceTableViewCell.className, for: indexPath) as? BudgetpeiceTableViewCell {
                        cell.cellInfo = item
                        cell.delegate = self as? BudgetpeiceTableViewCelldelegate
                        return cell
                    }
                }
                if type == Budgetcelltype.DetailTableViewCell {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.className, for: indexPath) as? DetailTableViewCell {
                        cell.cellInfo = item
                        cell.delegate = self as? DetailTableViewCelldelegate
                        return cell
                    }
                }
                if type == Budgetcelltype.NoticeTableViewCell {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: NoticeTableViewCell.className, for: indexPath) as? NoticeTableViewCell {
                        cell.cellInfo = item
                        cell.delegate = self as? NoticeTableViewCelldelegate
                        return cell
                    }
                }
            }
        }
        return UITableViewCell()
    }
    
}
