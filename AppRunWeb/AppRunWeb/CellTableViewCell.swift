//
//  CellTableViewCell.swift
//  AppRunWeb
//
//  Created by Hoang Viet on 6/6/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    @IBOutlet weak var lblchoose: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
