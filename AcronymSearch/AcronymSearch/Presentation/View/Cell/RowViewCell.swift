//
//  RowViewCell.swift
//  AcronymSearch
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import UIKit

class RowViewCell: UITableViewCell {

    @IBOutlet weak var txtMeaning: UILabel!
    
    @IBOutlet weak var txtYear: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
