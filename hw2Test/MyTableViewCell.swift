//
//  MyTableViewCell.swift
//  hw2Test
//
//  Created by Spada Kao on 2016/5/5.
//  Copyright © 2016年 Spada Kao. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var linesStackView: UIStackView!
    @IBOutlet weak var lineNumLabel: UILabel!
    @IBOutlet weak var lineNumLabel2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
