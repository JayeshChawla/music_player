//
//  SeeAllTableViewCell.swift
//  Music_Player
//
//  Created by Jayesh on 23/01/25.
//

import UIKit

class SeeAllTableViewCell: UITableViewCell {

    @IBOutlet weak var seeallBtn: UIButton!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
