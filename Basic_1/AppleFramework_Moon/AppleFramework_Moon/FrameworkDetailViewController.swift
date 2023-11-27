//
//  FrameworkDetailViewController.swift
//  AppleFramework_Moon
//
//  Created by 이문정 on 2023/11/27.
//

import UIKit
import SafariServices

class FrameworkDetailViewController: UIViewController {
    
    var framework: AppleFramework = AppleFramework(name: "Unkown", imageName: "", urlString: "", description: "")
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func learnmoreButtonTapped(_ sender: Any) {
        guard let url = URL(string: framework.urlString) else { return }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true)
    }
    
    
    func updateUI() {
        imageView.image = UIImage(named: framework.imageName)
        titleLabel.text = framework.name
        descriptionLabel.text = framework.description
    }
}
