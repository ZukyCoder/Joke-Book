//
//  AutoSizeCellTableViewCell.swift
//  Joke Book
//
//  Created by Developer on 01/03/2021.
//

import UIKit

class AutoSizeCellTableViewCell: UITableViewCell {

    @IBOutlet weak var resizingLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
