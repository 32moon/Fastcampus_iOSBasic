//
//  FrameworkDetailViewController.swift
//  AppleFramework_Moon
//
//  Created by 이문정 on 2023/11/27.
//

import UIKit
import Combine
import SafariServices

class FrameworkDetailViewController: UIViewController {
    
    var subscriptions = Set<AnyCancellable>()
    let buttonTapped = PassthroughSubject<AppleFramework, Never>()
    var framework = CurrentValueSubject<AppleFramework, Never>(AppleFramework(name: "Unkown", imageName: "", urlString: "", description: ""))
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        buttonTapped
            .receive(on: RunLoop.main)
            .compactMap { URL(string: $0.urlString) }
            .sink { [unowned self] url in
                let safariViewController = SFSafariViewController(url: url)
                self.present(safariViewController, animated: true)
        }.store(in: &subscriptions)
        
        framework
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
            self.imageView.image = UIImage(named: framework.imageName)
            self.titleLabel.text = framework.name
            self.descriptionLabel.text = framework.description
            }.store(in: &subscriptions)
    }
    
    @IBAction func learnmoreButtonTapped(_ sender: Any) {
        buttonTapped.send(framework.value)
    }
    
}
