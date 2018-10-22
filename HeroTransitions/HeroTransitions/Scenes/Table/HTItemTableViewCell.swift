//
//  HTItemTableViewCell.swift
//  HeroTransitions
//
//  Created by Rafaela Lourenço de Paula on 22/10/2018.
//  Copyright © 2018 Rafaela Lourenço de Paula. All rights reserved.
//

import UIKit

class HTItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(_ name: String) {
        titleLabel.text = name
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
