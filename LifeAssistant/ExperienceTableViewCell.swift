//
//  ExperienceTableViewCell.swift
//  LifeAssistant
//
//  Created by Daniel Kim on 2/1/17.
//  Copyright © 2017 Daniel Kim. All rights reserved.
//

import UIKit

class ExperienceTableViewCell: UITableViewCell {

    @IBOutlet weak var masteryLabel: UILabel!
    
    @IBOutlet weak var experienceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
