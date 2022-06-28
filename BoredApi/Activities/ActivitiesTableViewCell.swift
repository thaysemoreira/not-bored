//
//  ActivitiesTableViewCell.swift
//  BoredApi
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 22/06/22.
//

import UIKit

protocol TableViewNew {
    func onClickCell(index: Int)
}

class ActivitiesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
