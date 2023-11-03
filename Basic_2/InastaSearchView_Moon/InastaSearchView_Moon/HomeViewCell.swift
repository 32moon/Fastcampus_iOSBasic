//
//  HomeViewCell.swift
//  InastaSearchView_Moon
//
//  Created by 이문정 on 2023/11/03.
//

import UIKit

class HomeViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
    }
    
    func configure(_ imageName: String) {
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
