//
//  StockRankCollectionViewCell.swift
//  StockRank_moon
//
//  Created by 이문정 on 2023/10/29.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var companyIconImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyPriceLabel: UILabel!
    @IBOutlet weak var diffLabel: UILabel!
    
    func configure(_ stock: StockModel) {
        rankLabel.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: stock.imageName)
        companyNameLabel.text = stock.name
        companyPriceLabel.text = convertToCurrencyFormet(price: stock.price)
        diffLabel.text = "\(stock.diff)%"
        
        // 굳이 함수를 만들어서 적용하지 않고 바로 작성하여 적용할 수 있어서 코드가 간결해지는 장점이 있지만 협업 할 때 의사소통이 어려울 수 있다.
        diffLabel.textColor = stock.diff < 0 ? UIColor.blue : UIColor.red
    }
    
    func convertToCurrencyFormet(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? "오류"
        return result + "원"
    }
    
    // 디테일한 부분에 대한 모듈화를 통해 협업 시의 의사소통이 원활하게 할 수 있다.
    func diffLabelTintColorChange(diff: Double) -> UIColor {
        return diff < 0 ? UIColor.blue : UIColor.red
    }
}
