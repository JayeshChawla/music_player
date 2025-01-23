//
//  HeaderView.swift
//  Music_Player
//
//  Created by Quick tech  on 23/01/25.
//

import Foundation
import UIKit

class YourCustomHeaderView: UITableViewHeaderFooterView {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "", size: 100)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // Add and configure your label
        addSubview(titleLabel)
        
        // Add constraints for the label
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
