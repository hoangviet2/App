
//
//  NoticeTableViewCell.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/29/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit

protocol NoticeTableViewCelldelegate {
    func btn_Press(_ cell: NoticeTableViewCell)
}

class NoticeTableViewCell: UITableViewCell {
    
    var cellType: Budgetcelltype?
    var delegate : NoticeTableViewCelldelegate?
    @IBOutlet weak var lblNotice: UILabel!
    
    var cellInfo: [String:Any]? {
        didSet {
            if let item = self.cellInfo as? [String:Any] {
                if let type = item["CellType"] as? Budgetcelltype {
                    self.cellType = type
                }
                if let data = item["Object"] as? [String:Any] {
                    
                    if let text = data["detail"] as? String{
                        lblNotice.text = text
                    }
                }
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
