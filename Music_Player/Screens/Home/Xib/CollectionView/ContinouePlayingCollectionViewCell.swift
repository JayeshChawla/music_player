//
//  ContinouePlayingCollectionViewCell.swift
//  Music_Player
//
//  Created by Jayesh on 22/01/25.
//

import UIKit

class ContinouePlayingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var descriptionView: UIView!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var musicLbl: UILabel!
    @IBOutlet weak var imageScaled: UIImageView!
    @IBOutlet weak var imageView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 20
        imageView.layer.cornerRadius = 20
        imageScaled.layer.cornerRadius = 20
    }

}
