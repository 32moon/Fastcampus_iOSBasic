//
//  FocusViewController.swift
//  HandSpaceFocus_Moon
//
//  Created by 이문정 on 2023/11/14.
//

import UIKit

class FocusViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var refreshButton: UIButton!
    
    var items: [Focus] = Focus.list
    var curated: Bool = false
    
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
    typealias Item = Focus
    
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FocusCell", for: indexPath) as? FocusCell else {
                return UICollectionViewCell()
            }
            cell.configure(item)
            return cell
        })
        
        updateData()
        
        collectionView.collectionViewLayout = layout()
        
        updatButtonTitle()
        refreshButton.layer.cornerRadius = 10
    }
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        // false -> ture , ture -> false 로 바꿔주는 메서드 toffle
        curated.toggle()
        self.items = curated ? Focus.recommendations : Focus.list
        updateData()
        updatButtonTitle()
    }
    
    private func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        datasource.apply(snapshot)
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemsSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemsSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        section.interGroupSpacing = 10
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    private func updatButtonTitle() {
        let title = curated ? "See All" : "See Recommendation"
        refreshButton.setTitle(title, for: .normal)
    }
}
