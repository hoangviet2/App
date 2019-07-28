//
//  CleatTableViewCell.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/27/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit
protocol CleatTableViewCelldelegate {
    func btn_Press(_ cell: CleatTableViewCell)
}

class CleatTableViewCell: UITableViewCell {
    
    var cellType: LookingCellType?
    var delegate : CleatTableViewCelldelegate?

    @IBOutlet weak var btnTitle: UIButton!
    @IBOutlet weak var lbldecription: UILabel!
    @IBOutlet weak var swCleate: UISwitch!
    
    var cellInfo: [String:Any]? {
        didSet {
            if let item = self.cellInfo as? [String:Any] {
                if let type = item["CellType"] as? LookingCellType {
                    self.cellType = type
                }
                if let data = item["Object"] as? [String:Any] {
                    if let title = data["title"] as? String{
                        btnTitle.setTitle(title, for: .normal)
                    }
                    if let text = data["detail"] as? String{
                        lbldecription.text = text
                    }
                    if let cleat = data["cleat"] as? Bool{
                        swCleate.setOn(cleat, animated: true)
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
    
    @IBAction func btn_PressCleat(_ sender: Any) {
        self.delegate?.btn_Press(self)
    }
}
