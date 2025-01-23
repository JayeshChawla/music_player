//
//  TrendingTableViewCell.swift
//  Music_Player
//
//  Created by Jayesh on 23/01/25.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {

    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.layer.cornerRadius = 20
        self.setUpTableView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension TrendingTableViewCell {
    private func setUpTableView() {
        tableView.register(UINib(nibName: "FocousTableViewCell", bundle: nil), forCellReuseIdentifier: "FocousTableViewCell")
        tableView.register(UINib(nibName: "SeeAllTableViewCell", bundle: nil), forCellReuseIdentifier: "SeeAllTableViewCell")
        tableView.register(UINib(nibName: "ButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "ButtonTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension TrendingTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FocousTableViewCell", for: indexPath) as? FocousTableViewCell else { return UITableViewCell() }
            return cell
        case 4:
            guard let cell
                    = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell", for: indexPath) as? ButtonTableViewCell else { return UITableViewCell() }
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SeeAllTableViewCell", for: indexPath) as? SeeAllTableViewCell else { return UITableViewCell()}
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 180
        case 4:
            return 60
        default:
            return 80
        }
    }
}
