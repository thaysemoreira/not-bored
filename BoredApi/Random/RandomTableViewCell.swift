//
//  RandomTableViewCell.swift
//  BoredApi
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 28/06/22.
//

import UIKit

class RandomTableViewCell: UITableViewCell {

    @IBOutlet weak var participantsRandomLabel: UILabel!
    @IBOutlet weak var priceRandomLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
