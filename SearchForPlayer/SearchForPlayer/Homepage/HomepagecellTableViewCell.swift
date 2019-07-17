//
//  HomepagecellTableViewCell.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/14/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit

class HomepagecellTableViewCell: UITableViewCell {
   //Outlet varibles
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btntitle: UIButton!
    @IBOutlet weak var btnlock: UIButton!
    
   //Other varibles
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
