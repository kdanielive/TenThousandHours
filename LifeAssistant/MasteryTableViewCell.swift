//
//  MasteryTableViewCell.swift
//  LifeAssistant
//
//  Created by Daniel Kim on 1/31/17.
//  Copyright © 2017 Daniel Kim. All rights reserved.
//

import UIKit

class MasteryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var masteryLabel: UILabel!
    @IBOutlet weak var startTime: UIButton!
    @IBOutlet weak var endTime: UIButton!
    @IBOutlet weak var deleteMastery: UIButton!

    
    @IBOutlet weak var addMasteryNameTextField: UITextField!
    @IBOutlet weak var addMastery: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
/*
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
*/
}
