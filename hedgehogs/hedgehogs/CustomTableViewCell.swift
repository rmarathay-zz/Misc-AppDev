//
//  CustomTableViewCell.swift
//  hedgehogs
//
//  Created by Ranjit Marathay on 5/22/16.
//  Copyright © 2016 ranjit. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var valuationField: UILabel!
    @IBOutlet weak var recommendationField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
