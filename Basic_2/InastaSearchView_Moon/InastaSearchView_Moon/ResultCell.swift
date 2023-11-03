//
//  ResultCell.swift
//  InastaSearchView_Moon
//
//  Created by 이문정 on 2023/11/02.
//

import UIKit

class ResultCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func prepareForReuse() {
            super.prepareForReuse()
        // 셀이 재사용 될 때 기존의 데이터를 지운다.
            thumbnailImageView.image = nil
        }
    
    func configure(_ imageName: String) {
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
