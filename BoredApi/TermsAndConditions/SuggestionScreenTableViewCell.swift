//
//  SuggestionScreenTableViewCell.swift
//  BoredApi
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 24/06/22.
//

import UIKit

class SuggestionScreenTableViewCell: UITableViewCell {

    @IBOutlet weak var tableView: UIView!
    @IBOutlet weak var testLabl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
