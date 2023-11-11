//
//  OnboaardingCell.swift
//  NRCOnboarding_moon
//
//  Created by 이문정 on 2023/11/11.
//

import UIKit

class OnboaardingCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(_ message: OnboardingMessage) {
        thumbnailImageView.image = UIImage(named: message.imageName)
        titleLabel.text = message.title
        descriptionLabel.text = message.description
    }
}

