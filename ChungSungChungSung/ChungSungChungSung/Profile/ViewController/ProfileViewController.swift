//
//  ProfileViewController.swift
//  ChungSungChungSung
//
//  Created by Eunbee Kang on 2022/08/12.
//

import UIKit

class ProfileViewController: UIViewController {
    private let profileViewTitle = "프로필"
    
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var profileTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configNavigationTitle()
        self.view.backgroundColor = CustomColor.bgGray
        profileTableView.backgroundColor = CustomColor.bgGray
        profileTableView.contentInset.top = 35
        
        let backBarButtonItem = UIBarButtonItem(title: profileViewTitle, style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
        
        let armyInfoTableViewCellNib = UINib(nibName: "ArmyInfoTableViewCell", bundle: nil)
        let bodyInfoTableViewCellNib = UINib(nibName: "BodyInfoTableViewCell", bundle: nil)
        let goalsTableViewCellNib = UINib(nibName: "GoalsTableViewCell", bundle: nil)
        let badgeTableViewCellNib = UINib(nibName: "BadgeTableViewCell", bundle: nil)
        
        profileTableView.register(armyInfoTableViewCellNib, forCellReuseIdentifier: "armyInfoTableViewCell")
        profileTableView.register(bodyInfoTableViewCellNib, forCellReuseIdentifier: "bodyInfoTableViewCell")
        profileTableView.register(goalsTableViewCellNib, forCellReuseIdentifier: "goalsTableViewCell")
        profileTableView.register(badgeTableViewCellNib, forCellReuseIdentifier: "badgeTableViewCell")
    }
    
    private func configNavigationTitle() {
        let viewWidth = self.view.bounds.width - 80
        let profileViewTitleLabel = UILabel(frame: CGRect(x: 25, y: 0, width: viewWidth, height: 20))
        profileViewTitleLabel.textAlignment = .left
        profileViewTitleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        profileViewTitleLabel.text = profileViewTitle
        
        self.navigationItem.titleView = profileViewTitleLabel
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "armyInfoTableViewCell", for: indexPath) as? ArmyInfoTableViewCell else { return UITableViewCell() }
            return cell
        } else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "bodyInfoTableViewCell", for: indexPath) as? BodyInfoTableViewCell else { return UITableViewCell() }
            
            return cell
        } else if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalsTableViewCell", for: indexPath) as? GoalsTableViewCell else { return UITableViewCell() }
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "badgeTableViewCell", for: indexPath) as? BadgeTableViewCell else { return UITableViewCell() }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 152
        } else if indexPath.row == 1 {
            return 152
        } else if indexPath.row == 2 {
            return 174
        } else {
            return 300
//            return UITableView.automaticDimension
            // TODO: 뱃지 많아지면 자동으로 CollectionView 높이만큼 이 TableViewCell 높이도 길어졌으면 좋겠음.
        }
    }
}
