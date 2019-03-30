//
//  SoundTableViewCell.swift
//  HoltSoundboard
//
//  Created by Pranav Karnani on 30/03/19.
//  Copyright © 2019 Pranav Karnani. All rights reserved.
//

import UIKit

class SoundTableViewCell: UITableViewCell {

    @IBOutlet weak var soundNumber: UILabel!
    @IBOutlet weak var soundName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
