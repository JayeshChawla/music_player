//
//  RecomendedTableViewCell.swift
//  Music_Player
//
//  Created by Quick tech  on 23/01/25.
//

import UIKit

class RecomendedTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        collectionView.layer.cornerRadius = 20
        collectionView.register(UINib(nibName: "RecomendedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RecomendedCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.minimumInteritemSpacing = 10
        self.collectionView.collectionViewLayout = collectionViewFlowLayout
    }
}

extension RecomendedTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecomendedCollectionViewCell", for: indexPath) as? RecomendedCollectionViewCell else { return UICollectionViewCell() }
        cell.resetViewColors()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex = Int(collectionView.contentOffset.x / collectionView.frame.width)
        
        let visibleCells = collectionView.visibleCells
        for cell in visibleCells {
            if let indexPath = collectionView.indexPath(for: cell),
               let recomendedCell = cell as? RecomendedCollectionViewCell {
                recomendedCell.resetViewColors()

                if indexPath.item == currentIndex {
                    recomendedCell.updateViewColor(for: indexPath.item)
                    recomendedCell.animateImageView()
                }
            }
        }
    }

}
