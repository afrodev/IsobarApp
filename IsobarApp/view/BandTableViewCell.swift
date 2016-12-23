//
//  BandTableViewCell.swift
//  IsobarApp
//
//  Created by Humberto Vieira on 23/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import UIKit


class BandTableViewCell: UITableViewCell {

    @IBOutlet weak var labelID: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(band : Band) {
        self.labelID.text = band.id
        self.labelName.text = band.name
    }
    
}