//
//  LookingtoplayViewController.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/26/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit
import Firebase

enum LookingCellType: String {
    case CleatTableViewCell, BudgetTableViewCell, WhattimeTableViewCell, HowmanyplayersTableViewCell, ProfileTableViewCell
}



class LookingtoplayViewController: UIViewController {
    
    //Outlet varibles
    @IBOutlet weak var lblTitlepage: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnLetgo: UIButton!
    
    var sectionInfos = [[String:Any]]()
    
    //Othervaribles
    var imagedata:Data!

    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitlepage.text = "Looking for player"
        
        // Configure height for cell
        tableView.estimatedRowHeight = 112
        tableView.rowHeight = UITableView.automaticDimension
        
        // Register cell for tableview
        Utils.registerNibWithTableView(nibName: ProfileTableViewCell.className, tableView: tableView)
        Utils.registerNibWithTableView(nibName: CleatTableViewCell.className, tableView: tableView)
        Utils.registerNibWithTableView(nibName: BudgetTableViewCell.className, tableView: tableView)
        Utils.registerNibWithTableView(nibName: WhattimeTableViewCell.className, tableView: tableView)
        Utils.registerNibWithTableView(nibName: HowmanyplayersTableViewCell.className, tableView: tableView)
        // Do any additional setup after loading the view.
        
        
        // init data sectionInfos
        var items = [[String:Any]]()
        
        var item0 : [String:Any] = [:]
        item0["CellType"] = LookingCellType.ProfileTableViewCell
        
        var data0 = [String:Any]()
        data0["image"] = "travelr_book_date"
        data0["name"] = Auth.auth().currentUser?.displayName
        
        item0["Object"] = data0
        //
        
        var item1 : [String:Any] = [:]
        item1["CellType"] = LookingCellType.HowmanyplayersTableViewCell
        
        var data1 = [String:Any]()
        data1["title"] = "how many players?"
        data1["detail"] = "Harry, Ron, Peter, malfoy, tony, Natasha, steve, bucky"
        data1["missing"] = Int(6)
        
        item1["Object"] = data1
        
        //
        var item2 : [String:Any] = [:]
        item2["CellType"] = LookingCellType.WhattimeTableViewCell
        
        var data2 = [String:Any]()
        
        data2["title"] = "what time and where?"
        data2["detail"] = "this frame has to be filled if you already reseved a field, if you have not and you are looking for players, please do"
        item2["Object"] = data2
        //
        var item3 : [String:Any] = [:]
        item3["CellType"] = LookingCellType.BudgetTableViewCell
        
        var data3 = [String:Any]()
        
        data3["title"] = "Budget"
        data3["detail"] = "How much you want each separe player to pay example is the field is 100 the hour, you are missing two and want them to pay equally it will be $10"
        item3["Object"] = data3
        
        
        //
        var item4 : [String:Any] = [:]
        item4["CellType"] = LookingCellType.CleatTableViewCell
        
        var data4 = [String:Any]()
        
        data4["title"] = "cleats or no cleats."
        data4["detail"] = "Not every field lets you you play with cleats, did you ask?"
        data4["cleat"] = false
        item4["Object"] = data2
        
        items.append(item0)
        items.append(item1)
        items.append(item2)
        items.append(item3)
        items.append(item4)
        
        //update
        if items.isEmpty == false {
            self.sectionInfos = items
            tableView.reloadData()
        }
        
    }
    
    @IBAction func btn_Back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension LookingtoplayViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionInfos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let item = sectionInfos[indexPath.row] as? [String:Any] {
            if let type = item["CellType"] as? LookingCellType {
                if type == LookingCellType.ProfileTableViewCell {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.className, for: indexPath) as? ProfileTableViewCell {
                        cell.cellInfo = item
                        cell.delegate = self as? ProfileTableViewCelldelegate
                        return cell
                    }
                }
                if type == LookingCellType.HowmanyplayersTableViewCell {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: HowmanyplayersTableViewCell.className, for: indexPath) as? HowmanyplayersTableViewCell {
                        cell.cellInfo = item
                        cell.delegate = self
                        return cell
                    }
                }
                if type == LookingCellType.WhattimeTableViewCell {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: WhattimeTableViewCell.className, for: indexPath) as? WhattimeTableViewCell {
                        cell.cellInfo = item
                        cell.delegate = self
                        return cell
                    }
                }
                if type == LookingCellType.BudgetTableViewCell {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: BudgetTableViewCell.className, for: indexPath) as? BudgetTableViewCell {
                        cell.cellInfo = item
                        cell.delegate = self
                        return cell
                    }
                }
                if type == LookingCellType.CleatTableViewCell {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: CleatTableViewCell.className, for: indexPath) as? CleatTableViewCell {
                        cell.cellInfo = item
                        cell.delegate = self
                        return cell
                    }
                }
                
            }
        }
        return UITableViewCell()
    }
    
}

extension LookingtoplayViewController:HowmanyplayersTableViewCelldelegate{
    func btn_Press(_ cell: HowmanyplayersTableViewCell) {
        if let type = cell.cellType{
            if type == LookingCellType.HowmanyplayersTableViewCell{
                print("cell HowmanyplayersTableViewCell")
                if let vc = Utils.viewController(storyboardId: HowmanyplayerViewController.className, storyboardName: HowmanyplayerViewController.className) as? HowmanyplayerViewController{
                    navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
}
extension LookingtoplayViewController:ProfileTableViewCelldelegate{
    func btn_Press(_ cell: ProfileTableViewCell) {
        if let Alert:UIAlertController = UIAlertController(title: "Notification", message: "You need to choose camera or Photo to update avatar", preferredStyle: .alert){
            let photoAct = UIAlertAction(title: "Photo", style: .default) { (UIAlertAction) in
                let imagePicker = UIImagePickerController()
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
            let cameraAct = UIAlertAction(title: "Camera", style: .default) { (UIAlertAction) in
                if (UIImagePickerController.isSourceTypeAvailable(.camera)){
                    print("camera")
                    let imagePicker = UIImagePickerController()
                    imagePicker.sourceType = UIImagePickerController.SourceType.camera
                    imagePicker.delegate = self
                    imagePicker.allowsEditing = false
                    self.present(imagePicker, animated: true, completion: nil)
                }
            }
            Alert.addAction(cameraAct)
            Alert.addAction(photoAct)
            present(Alert, animated: true, completion: nil)
        }
    }


}
extension LookingtoplayViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chooseimage = info[.originalImage] as! UIImage
        let imagevalue = max(chooseimage.size.width, chooseimage.size.height)
        if (imagevalue > 3000){
            imagedata = chooseimage.jpegData(compressionQuality: 0.1)
        }
        else if (imagevalue > 2000){
            imagedata = chooseimage.jpegData(compressionQuality: 0.3)
        }
        else{
            imagedata = chooseimage.jpegData(compressionQuality: 1.0)
        }
    }
}

extension LookingtoplayViewController:WhattimeTableViewCelldelegate{
    func btn_Press(_ cell: WhattimeTableViewCell) {
        if let type = cell.cellType{
            if type == LookingCellType.WhattimeTableViewCell{
                print("cell WhattimeTableViewCelldelegate")
                if let vc = Utils.viewController(storyboardId: WhattimeViewController.className, storyboardName: WhattimeViewController.className) as? WhattimeViewController{
                    navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
}

extension LookingtoplayViewController : BudgetTableViewCelldelegate {
    func btn_Press(_ cell: BudgetTableViewCell) {
        if let type = cell.cellType {
            if type == LookingCellType.BudgetTableViewCell {
                print("cell BudgetTableViewCell")
                if let vc = Utils.viewController(storyboardId: BudgetViewController.className, storyboardName: BudgetViewController.className) as? BudgetViewController{
                    navigationController?.pushViewController(vc, animated: true)
                }
            }
            
        }
    }
}

extension LookingtoplayViewController:CleatTableViewCelldelegate{
    func btn_Press(_ cell: CleatTableViewCell) {
        if let type = cell.cellType{
            if type == LookingCellType.CleatTableViewCell{
                print("cell CleatTableViewCelldelegate")
                self.navigationController?.popViewController(animated: true)
                
            }
        }
    }
    
}





