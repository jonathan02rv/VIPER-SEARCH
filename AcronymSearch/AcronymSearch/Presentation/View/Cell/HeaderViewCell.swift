//
//  HeaderViewCell.swift
//  AcronymSearch
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 11/09/21.
//

import UIKit

class HeaderViewCell: UITableViewCell {
    
    static let identifier = "HeaderViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "HeaderViewCell", bundle: nil)
    }

    @IBOutlet weak var txtTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
