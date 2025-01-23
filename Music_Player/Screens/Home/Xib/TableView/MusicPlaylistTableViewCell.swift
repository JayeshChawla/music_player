//
//  MusicPlaylistTableViewCell.swift
//  Music_Player
//
//  Created by Jayesh on 23/01/25.
//

import UIKit

class MusicPlaylistTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "ContinouePlayingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ContinouePlayingCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.minimumInteritemSpacing = 10
        collectionFlowLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = collectionFlowLayout
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension MusicPlaylistTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContinouePlayingCollectionViewCell", for: indexPath) as? ContinouePlayingCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.contentView.layer.cornerRadius = 20
//        cell.descriptionView.backgroundColor = UIColor(named: "description")
        cell.musicLbl.isHidden = true
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2.7
        let height = collectionView.frame.height - 10
        return CGSize(width: width, height: height)
    }
}
