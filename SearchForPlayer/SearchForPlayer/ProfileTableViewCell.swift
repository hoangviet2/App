//
//  ProfileTableViewCell.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/28/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit
protocol ProfileTableViewCelldelegate {
    func btn_Press(_ cell: ProfileTableViewCell)
}

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblUser: UILabel!
    
    var cellType: LookingCellType?
    var delegate : ProfileTableViewCelldelegate?
    
    var cellInfo: [String:Any]? {
        didSet {
            if let item = self.cellInfo as? [String:Any] {
                if let type = item["CellType"] as? LookingCellType {
                    self.cellType = type
                }
                if let data = item["Object"] as? [String:Any] {
                    if let image = data["image"] as? String{
                        imgAvatar.image = UIImage(named: image)
                    }
                    if let name = data["name"] as? String{
                        lblUser.text = name
                    }
                }
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        imgAvatar.layer.cornerRadius = imgAvatar.frame.size.width / 2
        self.selectionStyle = .none
        // Initialization code
    }
    
//    @IBAction func img_PressAvatar(_ sender: Any) {
//        self.delegate?.btn_Press(self)
//    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
