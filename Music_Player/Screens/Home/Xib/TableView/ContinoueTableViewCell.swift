//
//  ContinoueTableViewCell.swift
//  Music_Player
//
//  Created by Jayesh on 22/01/25.
//

import UIKit

class ContinoueTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var tapAction: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "ContinouePlayingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ContinouePlayingCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.scrollDirection = .horizontal
        collectionFlowLayout.minimumInteritemSpacing = 10
        collectionView.collectionViewLayout = collectionFlowLayout
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ContinoueTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContinouePlayingCollectionViewCell", for: indexPath) as? ContinouePlayingCollectionViewCell else { return UICollectionViewCell() }
        cell.tapCompletion = {
            self.tapAction?()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 20) / 2
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
}
