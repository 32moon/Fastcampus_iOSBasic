//
//  FrameworkListViewController.swift
//  AppleFramework_Moon
//
//  Created by 이문정 on 2023/10/30.
//

import UIKit

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [AppleFramework] = AppleFramework.list
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    typealias Item = AppleFramework
    enum Section {
        case main
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 타이틀 바꾸기
        navigationController?.navigationBar.topItem?.title = "🥳 Apple Frameworks"
        
        
        // presentation, data, layout
        // diffable datasoure -> presentation
        dataSource = UICollectionViewDiffableDataSource<Section,Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCollectionViewCell", for: indexPath) as? FrameworkCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(item)
            return cell
        })
        
        // snap shot -> data
        var snapShot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapShot.appendSections([.main])
        snapShot.appendItems(list, toSection: .main)
        dataSource.apply(snapShot)
        
        // compositional layout -> layout
        collectionView.collectionViewLayout = layout()

    }
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(
            // fractionalWidth -> 스크린에 할당된 구역에서 가로로 그 만큼 나눈다는 뜻
            widthDimension: .fractionalWidth(0.33),
            // fractionalHeight -> 그룹의 크기에 대해 아이템의 크기가 그 만큼 정해진다는 뜻
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(
            layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            // fractionalWidth -> 섹션의 크기에 대해 아이템의 크기가 그만큼 정해진다는 뜻
            widthDimension:.fractionalWidth(1),
            // fractionalWidth -> 섹션의 크기에 대해 아이템의 크기가 그만큼 정해진다는 뜻
            heightDimension: .fractionalWidth(0.45))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(
            group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        let layout = UICollectionViewCompositionalLayout(
            section: section)
        return layout
    }
}

extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = list[indexPath.item]
        print(">>>> selected: \(framework.name)")
    }
}
