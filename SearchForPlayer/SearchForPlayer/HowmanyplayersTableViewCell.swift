//
//  HowmanyplayersTableViewCell.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/27/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit

protocol HowmanyplayersTableViewCelldelegate {
    func btn_Press(_ cell: HowmanyplayersTableViewCell)
}

class HowmanyplayersTableViewCell: UITableViewCell {
    
    var cellType: LookingCellType?
    var delegate : HowmanyplayersTableViewCelldelegate?
    
    @IBOutlet weak var lblDecription: UILabel!
    @IBOutlet weak var lblMissing: UILabel!
    
    @IBOutlet weak var btnTitle: UIButton!
    
    var cellInfo: [String:Any]? {//item
        didSet {
            if let item = self.cellInfo {
                if let type = item["CellType"] as? LookingCellType {
                    self.cellType = type
                }
                if let data = item["Object"] as? [String:Any] {
                    if let title = data["title"] as? String {
                        self.btnTitle.setTitle(title, for: .normal)
                    }
                    if let text = data["detail"] as? String {
                        self.lblDecription.text = text
                    }
                    if let number = data["missing"] as? Int {
                        self.lblMissing.text = "Missing \(number)"
                    }
                }
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    @IBAction func btn_PressPlayers(_ sender: Any) {
        self.delegate?.btn_Press(self)
    }
    
}
