//
//  ComicTableViewCell.swift
//  TopComics
//
//  Created by Jessica Lewinter on 17/10/18.
//  Copyright © 2018 Jessica Lewinter. All rights reserved.
//

import UIKit

class ComicTableViewCell: UITableViewCell {
    @IBOutlet weak var labelTableView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
