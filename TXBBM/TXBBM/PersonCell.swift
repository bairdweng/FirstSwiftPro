//
//  PersonCell.swift
//  TXBBM
//
//  Created by Baird-weng on 15/7/14.
//  Copyright (c) 2015年 Baird-weng. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {
    @IBOutlet weak var usename: UILabel!
    @IBOutlet weak var account: UILabel!
    @IBOutlet weak var accountmanage: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
