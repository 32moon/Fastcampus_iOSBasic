//
//  FrameworkCollectionViewCell.swift
//  AppleFramework_Moon
//
//  Created by 이문정 on 2023/10/30.
//

import UIKit

class FrameworkCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
         super.awakeFromNib()
        nameLabel.numberOfLines = 1
        // 셀이 작아지면 글자 크기도 그에 맞게 작아짐
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configure(_ frameWork: AppleFramework) {
        thumbnailImageView.image = UIImage(named: frameWork.imageName)
        nameLabel.text = frameWork.name
    }
}
