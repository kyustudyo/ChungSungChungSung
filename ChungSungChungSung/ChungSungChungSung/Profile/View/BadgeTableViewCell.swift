//
//  BadgeTableViewCell.swift
//  ChungSungChungSung
//
//  Created by Eunbee Kang on 2022/08/13.
//

import UIKit

class BadgeTableViewCell: UITableViewCell {
    var badgeDetailViewDelegate: BadgeDetailViewDelegate?
    var earnedBadges: [BadgeModel] = []
    
    private var badgeList = BadgeData().list
    
    private var badgeImageList = ["badge100Percent", "medal1Achiver", "medal30Days", "trophy", "medal1Achiver", "badge100Percent", ]
    private var badgeNameList = ["일주일 연속 운동", "체력검정 1급", "한 달 연속 운동", "특급전사", "운동의 시작", "목표 달성"]
    
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var badgeCollectionView: UICollectionView!

    @IBAction func didTapBadgeMoreAction(_ sender: UIButton) {
        badgeDetailViewDelegate?.didTapBadgeMoreButton()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setNumberOfBadgeEarned()
        self.backgroundColor = CustomColor.bgGray
        moreButton.tintColor = CustomColor.editGray
        badgeCollectionView.backgroundColor = CustomColor.bgGray
        
        let badgeCollectionViewCellNib = UINib(nibName: "BadgeCollectionViewCell", bundle: nil)
        badgeCollectionView.register(badgeCollectionViewCellNib, forCellWithReuseIdentifier: "badgeCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setNumberOfBadgeEarned() {
        earnedBadges = badgeList.filter {
            if $0.date?.isEmpty == false {
                return true
            } else {
                return false
            }
        }
    }
}

extension BadgeTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flow = collectionViewLayout as? UICollectionViewFlowLayout else {
            return CGSize()
        }
        let viewWidth = contentView.bounds.width
        let spacing = (8 / 390) * viewWidth
        let inset = (16 / 390) * viewWidth
        
        let width = (viewWidth - (inset * 2) - (spacing * 2)) / 3
        let height = width
        
        flow.minimumInteritemSpacing = spacing
        flow.minimumLineSpacing = spacing
        
        return CGSize(width: width, height: height)
    }
}

extension BadgeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return earnedBadges.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "badgeCollectionViewCell", for: indexPath) as? BadgeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.badgeImageView.image = UIImage(named: earnedBadges[indexPath.row].image)
        cell.badgeNameLabel.text = earnedBadges[indexPath.row].title
        
        return cell
    }
}
