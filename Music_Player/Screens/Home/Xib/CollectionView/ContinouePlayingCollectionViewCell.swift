//
//  ContinouePlayingCollectionViewCell.swift
//  Music_Player
//
//  Created by Jayesh on 22/01/25.
//

import UIKit

class ContinouePlayingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageScaled: UIImageView!
    @IBOutlet weak var imageView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageScaled.layer.cornerRadius = 20
    }

}
