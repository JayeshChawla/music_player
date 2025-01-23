//
//  RecomendedCollectionViewCell.swift
//  Music_Player
//
//  Created by Quick tech  on 23/01/25.
//

import UIKit

class RecomendedCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var secondVIew: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        [imageView, stackView].forEach { view in
            view?.layer.cornerRadius = 20
        }
        [firstView, secondVIew, thirdView].forEach { view in
            view.layer.cornerRadius = 4
        }
        
        resetViewColors()
    }
    
    func animateImageView() {
        imageView.layer.transform = CATransform3DIdentity
        imageView.alpha = 1.0
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseInOut]) {
            var transform = CATransform3DIdentity
            transform.m34 = -1.0 / 500
            transform = CATransform3DRotate(transform, CGFloat.pi / 2, 0, 1, 0)
            self.imageView.layer.transform = transform
            self.imageView.alpha = 0.0
        } completion: { _ in
            self.imageView.layer.transform = CATransform3DIdentity
            UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseInOut]) {
                self.imageView.alpha = 1.0
            }
        }
    }
    
    func resetViewColors() {
        firstView.backgroundColor = .lightGray
        secondVIew.backgroundColor = .lightGray
        thirdView.backgroundColor = .lightGray
    }
    func updateViewColor(for index: Int) {
         switch index {
         case 0:
             firstView.backgroundColor = .white
         case 1:
             secondVIew.backgroundColor = .white
         case 2:
             thirdView.backgroundColor = .white
         default:
             break
         }
     }
}
