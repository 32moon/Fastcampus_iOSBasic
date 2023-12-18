//
//  SearchViewController.swift
//  GithubUSerSearch_moon
//
//  Created by 이문정 on 2023/12/18.
//

import UIKit
import Combine

class SearchViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let network = NetworkService(configuration: .default)
    
    typealias Item = SearchResult
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    enum Section {
        case main
    }
    
    @Published private(set) var users: [SearchResult] = []
    var subscriptions = Set<AnyCancellable>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embedSearchControll()
        configureCollectionView()
        bind()
    }
    
    private func embedSearchControll() {
        self.navigationItem.title = "Search"
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "32moon"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
    
    private func configureCollectionView() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as? ResultCell else {
                return nil
            }
            cell.userNameLabel.text = item.login
            return cell
        })
        
        collectionView.collectionViewLayout = layout()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func bind() {
        $users
            .receive(on: RunLoop.main)
            .sink { users in
                var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
                snapshot.appendSections([.main])
                snapshot.appendItems(users, toSection: .main)
                self.dataSource.apply(snapshot)
            }.store(in: &subscriptions)
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let keyword = searchController.searchBar.text
        print("search: \(keyword)")
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("button Clicked: \(searchBar.text)")
        
        guard let keyword = searchBar.text, !keyword.isEmpty else { return }
        
        let resource = Resource<SearchUserResponse>(base: "https://api.github.com/", path: "search/users", params: ["q": keyword],header: ["Content-Type": "application/json"] )
        
        network.load(resource)
            .map { $0.items }
            .receive(on: RunLoop.main)
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.users, on: self)
            .store(in: &subscriptions)
    }
}
