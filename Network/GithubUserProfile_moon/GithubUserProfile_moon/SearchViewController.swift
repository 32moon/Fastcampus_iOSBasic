//
//  SearchViewController.swift
//  GithubUserProfile_moon
//
//  Created by 이문정 on 2023/12/13.
//

import UIKit
import Combine
import Kingfisher

class SearchViewController: UIViewController {
    
    // private(set) var에 대하여: https://velog.io/@minji0801/iOS-Swift-private-set
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
        guard let user = user else {
            self.nameLabel.text = "n/a"
            self.loginLabel.text = "n/a"
            self.followerLabel.text = ""
            self.followingLabel.text = ""
            self.thubnailImageView.image = nil
            return
        }
        
        self.nameLabel.text = user.name
        self.loginLabel.text = user.login
        self.followerLabel.text = "follower: \(user.followers)"
        self.followingLabel.text = "follower: \(user.following)"
        self.thubnailImageView.kf.setImage(with: user.avatarUrl)
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
        
        guard let keyword = searchBar.text, !keyword.isEmpty else { return }
        "http://api.github.com/users/\(keyword)"
        
        let base = "http://api.github.com/"
        let path = "users/\(keyword)"
        let params: [String: String] = [:]
        let header: [String: String] = ["Content-Type":"application/jason"]
        
        var urlcomponents = URLComponents(string: base + path)!
        let queryItem = params.map { (key: String, value: String) in
            URLQueryItem(name: key, value: value)
        }
        
        urlcomponents.queryItems = queryItem
        
        var request = URLRequest(url: urlcomponents.url!)
        header.forEach { (key: String, value: String) in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Data in
                guard let response = result.response as? HTTPURLResponse,
                      (200..<300).contains(response.statusCode) else {
                    let response = result.response as? HTTPURLResponse
                    let statusCode = response?.statusCode ?? -1
                    throw NetworkError.responseError(statusCode: statusCode)
                }
                return result.data
            }
            .decode(type: UserProfile.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { completion in
                print("completion: \(completion)")
                switch completion {
                case .failure(let error):
                    self.user = nil
                case .finished: break
                }
            } receiveValue: { user in
                self.user = user
            }.store(in: &subscriptions)
    }
}
