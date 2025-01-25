//
//  ViewController.swift
//  Music_Player
//
//  Created by Jayesh on 22/01/25.
//

import UIKit

class ViewController: UIViewController {

//MARK: Views
    @IBOutlet weak var forFocousView: UIView!
    @IBOutlet weak var forWorkView: UIView!
    @IBOutlet weak var forStudyView: UIView!
    @IBOutlet weak var freeView: UIView!
    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var downloadView: UIView!
    @IBOutlet weak var heartView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.configuringTableView()
    }


}

//MARK: Setup UI
extension ViewController {
    private func setUpUI() {
        [forWorkView, forFocousView, searchView, freeView, forStudyView].forEach { view in
            view?.layer.cornerRadius = 20
        }
        
        [heartView, downloadView].forEach { view in
            if let view = view {
                view.layer.cornerRadius = 15
                view.layer.borderWidth = 1
                view.layer.borderColor = UIColor.white.cgColor
            }
        }

    }
}

//MARK: Configuring Table View
extension ViewController {
    private func configuringTableView() {
        tableView.register(UINib(nibName: "ContinoueTableViewCell", bundle: nil), forCellReuseIdentifier: "ContinoueTableViewCell")
        tableView.register(YourCustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "headerView")
        tableView.register(UINib(nibName: "RecomendedTableViewCell", bundle: nil), forCellReuseIdentifier: "RecomendedTableViewCell")
        tableView.register(UINib(nibName: "MusicPlaylistTableViewCell", bundle: nil), forCellReuseIdentifier: "MusicPlaylistTableViewCell")
        tableView.register(UINib(nibName: "TrendingTableViewCell", bundle: nil), forCellReuseIdentifier: "TrendingTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 1
        default: return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContinoueTableViewCell", for: indexPath) as? ContinoueTableViewCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecomendedTableViewCell", for: indexPath) as? RecomendedTableViewCell else { return UITableViewCell() }
            cell.navigation = {
                if let vc = UIStoryboard(name: "Player", bundle: nil).instantiateViewController(withIdentifier: "player") as? PlayerViewController {
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MusicPlaylistTableViewCell", for: indexPath) as? MusicPlaylistTableViewCell else { return UITableViewCell() }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingTableViewCell", for: indexPath) as? TrendingTableViewCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 305
        case 1: return 230
        case 2: return 250
        case 3: return 470
        default: return 200
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView") as! YourCustomHeaderView
            headerView.titleLabel.text = "Continoue Playing"
            return headerView
        case 1:
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView") as! YourCustomHeaderView
            headerView.titleLabel.text = "Recommended For You"
            return headerView
        default:
            return nil
        }
    }
}
