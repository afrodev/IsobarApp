//
//  BandTableViewCell.swift
//  IsobarApp
//
//  Created by Humberto Vieira on 23/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import UIKit


class BandTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    //MARK:  Método que configura a célula através de um objeto band
    func configure(band : Band) {
        self.labelName.text = band.name
    }
    
}
