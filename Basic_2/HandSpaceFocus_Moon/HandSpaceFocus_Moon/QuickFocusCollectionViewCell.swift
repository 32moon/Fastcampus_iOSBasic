//
//  QuickFocusCollectionViewCell.swift
//  HandSpaceFocus_Moon
//
//  Created by 이문정 on 2023/11/27.
//

import UIKit

class QuickFocusCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configre(_ quickFocus: QuickFocus) {
        imageView.image = UIImage(named: quickFocus.imageName)
        titleLabel.text = quickFocus.title
        descriptionLabel.text = quickFocus.description
    }
}
