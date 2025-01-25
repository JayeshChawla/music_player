//
//  SeeAllTableViewCell.swift
//  Music_Player
//
//  Created by Jayesh on 23/01/25.
//

import UIKit

class SeeAllTableViewCell: UITableViewCell {

    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var seeallBtn: UIButton!
    @IBOutlet weak var img: UIImageView!
    
    var isHeartPressed: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func heartButton(_ sender: Any) {
        isHeartPressed.toggle()
        if isHeartPressed {
            heartButton.setImage(UIImage(named: "favoriteSelected"), for: .normal)
        } else {
            heartButton.setImage(UIImage(named: "favorite"), for: .normal)
        }
    }
    
}
