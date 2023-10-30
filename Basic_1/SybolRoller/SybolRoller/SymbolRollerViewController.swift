//
//  SymbolRollerViewController.swift
//  SybolRoller
//
//  Created by 이문정 on 2023/10/28.
//

import UIKit

class SymbolRollerViewController: UIViewController {
    
    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    // viewDidLoad = 뷰를 그리기 위한 컴포넌트들이 메모리에 로드가 된 시점
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        
       // - 초기값 세팅
        button.tintColor = UIColor.systemPink
        reload()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    func reload() {
        // - 심볼에서 하나를 임의로 추출해서 이미지와 텍스트 값 설정
        let symbol: String = symbols.randomElement() ?? ""
        imageView.image = UIImage(systemName: symbol)
        label.text = symbol
        
    }
    
    @IBAction func touchedButton(_ sender: Any) {
        print("버튼 눌림")
        reload()
    }
}
