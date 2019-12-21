
//
//  DetailTableViewCell.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/29/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit

protocol DetailTableViewCelldelegate {
    func btn_Press(_ cell: DetailTableViewCell)
}

class DetailTableViewCell: UITableViewCell {
    
    var cellType: Budgetcelltype?
    var delegate : DetailTableViewCelldelegate?
    @IBOutlet weak var lblText1: UILabel!
    @IBOutlet weak var lblText2: UILabel!
    @IBOutlet weak var lblText3: UILabel!
    
    var cellInfo: [String:Any]? {
        didSet {
            if let item = self.cellInfo as? [String:Any] {
                if let type = item["CellType"] as? Budgetcelltype {
                    self.cellType = type
                }
                if let data = item["Object"] as? [String:Any] {
                    
                    if let text1 = data["text1"] as? String{
                        lblText1.text = text1
                    }
                    if let text2 = data["text2"] as? String{
                        lblText2.text = text2
                    }
                    if let text3 = data["text3"] as? String{
                        lblText3.text = text3
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
    
}
