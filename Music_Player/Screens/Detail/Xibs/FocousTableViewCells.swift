//
//  FocousTableViewCell.swift
//  Music_Player
//
//  Created by Jayesh on 25/01/25.
//

import UIKit

class FocousTableViewCells: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var contentMainView: UIView!
    @IBOutlet weak var heartButton: UIButton!
    
    var heartToggle: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentMainView.layer.cornerRadius = 20
        contentMainView.layer.borderColor = UIColor(named: "border")?.cgColor
        contentMainView.layer.borderWidth = 1.0
        img.layer.cornerRadius = 20
        img.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
    }

    @IBAction func hearButton(_ sender: Any) {
        heartToggle.toggle()
        if heartToggle {
            heartButton.setImage(UIImage(named: "favoriteSelected"), for: .normal)
        } else {
            heartButton.setImage(UIImage(named: "favorite"), for: .normal)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
