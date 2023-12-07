//
//  FrameworkListViewController.swift
//  AppleFramework_Moon
//
//  Created by 이문정 on 2023/10/30.
//

import UIKit
import Combine

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    typealias Item = AppleFramework
    enum Section {
        case main
    }
    
//    let list: [AppleFramework] = AppleFramework.list
    
    // Combine
    var subscriptions = Set<AnyCancellable>()
    let didSelect = PassthroughSubject<AppleFramework, Never>()
    let items = CurrentValueSubject<[AppleFramework], Never>(AppleFramework.list)
//    @Published var list: [AppleFramework] = AppleFramework.list
 
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        bind()
        
        // 네비게이션 타이틀 바꾸기
        navigationController?.navigationBar.topItem?.title = "🥳 Apple Frameworks"
    }
    
    // 해당 뷰에서의 핵심 로직을 한 곳에 모아둠
    private func bind() {
        // input: 사용자 인풋을 받아서 처리해야 할 것
        // - item 선택 되었을 때 처리
        didSelect
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
            let storyboard = UIStoryboard(name: "Detail", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "FrameworkDetailViewController") as! FrameworkDetailViewController
                viewController.framework.send(framework)
            self.present(viewController, animated: true)
        }.store(in: &subscriptions)
        
        // output: data, state 변경에 따라서 UI업데이트
        // - items 가 세팅이 되었을 때 컬렉션뷰를 업데이트
        items
            .receive(on: RunLoop.main)
            .sink { [unowned self] list in
            self.applySectionItems(list)
        }.store(in: &subscriptions)
        
    }
    
    private func  applySectionItems(_ items: [Item], to section: Section = .main) {
         // snap shot -> data
         var snapShot = NSDiffableDataSourceSnapshot<Section, Item>()
         snapShot.appendSections([section])
         snapShot.appendItems(items, toSection: section)
         dataSource.apply(snapShot)
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        // presentation, data, layout
        // diffable datasoure -> presentation
        dataSource = UICollectionViewDiffableDataSource<Section,Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCollectionViewCell", for: indexPath) as? FrameworkCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(item)
            return cell
        })
        
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
//        let framework = list[indexPath.item]
        let framework = items.value[indexPath.item]
        print(">>>> selected: \(framework.name)")
        didSelect.send(framework)
    }
}
