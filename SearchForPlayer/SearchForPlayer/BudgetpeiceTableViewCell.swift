//
//  BudgetpeiceTableViewCell.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/29/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit

protocol BudgetpeiceTableViewCelldelegate {
    func btn_Press(_ cell: NoticeTableViewCell)
}

class BudgetpeiceTableViewCell: UITableViewCell {
    
    var cellType: Budgetcelltype?
    var delegate : BudgetpeiceTableViewCelldelegate?
    @IBOutlet weak var lbltext1: UILabel!
    @IBOutlet weak var lblText2: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var lblDolar: UILabel!
    
    
    var cellInfo: [String:Any]? {
        didSet {
            if let item = self.cellInfo as? [String:Any] {
                if let type = item["CellType"] as? Budgetcelltype {
                    self.cellType = type
                }
                if let data = item["Object"] as? [String:Any] {
                    
                    if let text = data["text1"] as? String{
                        lbltext1.text = text
                    }
                    if let text = data["text2"] as? String{
                        lblText2.text = text
                    }
                    if let text = data["max"] as? Float{
                        slider.maximumValue = text
                    }
                    if let text = data["curentThumb"] as? Float{
                        slider.setValue(text, animated: true)
                    }
                    if let text = data["min"] as? Float{
                        slider.minimumValue = text
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

    @IBAction func sld_PressDolar(_ sender: Any) {
        print(slider.value)
        let dolar = Int(slider.value)
        lblDolar.text = "\(dolar) $"
    }
    //    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
