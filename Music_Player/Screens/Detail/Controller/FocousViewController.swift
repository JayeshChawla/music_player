//
//  FocousViewController.swift
//  Music_Player
//
//  Created by Jayesh on 25/01/25.
//

import UIKit

class FocousViewController: UIViewController {

    @IBOutlet weak var focousView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var downloadView: UIView!
    @IBOutlet weak var heartView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    private var lastContentOffset: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.setUpTableView()
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension FocousViewController {
    private func setUpUI() {
        [heartView, downloadView].forEach { view in
            view?.layer.cornerRadius = 15
        }
        focousView.backgroundColor = .clear
        self.navigationController?.isNavigationBarHidden = true
        scrollView.delegate = self
    }
    
    private func setUpTableView() {
        tableView.register(UINib(nibName: "FocousTableViewCells", bundle: nil), forCellReuseIdentifier: "FocousTableViewCells")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension FocousViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FocousTableViewCells", for: indexPath) as? FocousTableViewCells else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = UIStoryboard(name: "Player", bundle: nil).instantiateViewController(withIdentifier: "player") as? PlayerViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
}

extension FocousViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        
        if contentOffsetY > lastContentOffset {
            focousView.backgroundColor = UIColor.black.withAlphaComponent(1.0)
        } else if contentOffsetY <= 0 {
            focousView.backgroundColor = .clear
        }
        
        lastContentOffset = contentOffsetY
    }
}
