//
//  SuggestionTableViewCell.swift
//  BoredApi
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 26/06/22.
//

import UIKit

class SuggestionTableViewCell: UITableViewCell {

    @IBOutlet weak var participantsLabel: UILabel?
    @IBOutlet weak var priceLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
