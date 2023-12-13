//
//  SearchViewController.swift
//  GithubUserProfile_moon
//
//  Created by 이문정 on 2023/12/13.
//

import UIKit
import Combine

class SearchViewController: UIViewController {
    
    @Published private(set) var user: UserProfile?
    var subscriptions = Set<AnyCancellable>()

    @IBOutlet weak var thubnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        embedSearchControll()
        bind()
    }
    
    private func setupUI() {
        thubnailImageView.layer.cornerRadius = 80
    }
    
    private func embedSearchControll() {
        self.navigationItem.title = "Search"
        let searchcontroller = UISearchController(searchResultsController: nil)
        searchcontroller
            .hidesNavigationBarDuringPresentation = false
        searchcontroller.searchBar.placeholder = "cafielo"
        searchcontroller.searchResultsUpdater = self // UISearchBarDelegate
        searchcontroller.searchBar.delegate = self // UISearchResultsUpdating
        self.navigationItem.searchController = searchcontroller
    }
    
    private func bind() {
        $user
            .receive(on: RunLoop.main)
            .sink { [unowned self] result in
                self.update(user)
            }.store(in: &subscriptions)
    }
    
    private func update(_ user: UserProfile?) {
        
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
        print("button clicked: \(searchBar.text)")
    }
}
