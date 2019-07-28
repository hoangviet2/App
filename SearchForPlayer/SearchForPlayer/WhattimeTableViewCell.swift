//
//  WhattimeTableViewCell.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/27/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit

protocol WhattimeTableViewCelldelegate {
    func btn_Press(_ cell: WhattimeTableViewCell)
}

class WhattimeTableViewCell: UITableViewCell {
    
    var cellType: LookingCellType?
    var delegate : WhattimeTableViewCelldelegate?
    
    @IBOutlet weak var lblDecription: UILabel!
    @IBOutlet weak var btnTitle: UIButton!
    
    var cellInfo: [String:Any]? {
        didSet {
            if let item = self.cellInfo as? [String:Any] {
                if let type = item["CellType"] as? LookingCellType {
                    self.cellType = type
                }
                if let data = item["Object"] as? [String : Any] {
                    if let title = data["title"] as? String?{
                        btnTitle.setTitle(title, for: .normal)
                    }
                    if let text = data["detail"] as? String?{
                        lblDecription.text = text
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
    
    @IBAction func btn_PressTime(_ sender: Any) {
        self.delegate?.btn_Press(self)
    }
    
}
