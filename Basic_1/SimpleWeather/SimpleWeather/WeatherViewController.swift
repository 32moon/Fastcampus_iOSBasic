//
//  WeatherViewController.swift
//  SimpleWeather
//
//  Created by 이문정 on 2023/10/28.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let cities: [String] = ["Seoul", "Tokyo", "LA", "Seattle"]
    let weathers: [String] = ["cloud.fill", "sun.max.fill", "wind", "cloud.sun.rain.fill"]

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reload()

    }
    
    func reload() {
        let city: String = cities.randomElement() ?? ""
        let weather: String = weathers.randomElement() ?? ""
        let randomTap = Int.random(in: 10..<30)
        
        cityLabel.text = city
        weatherImageView.image = UIImage(systemName: weather)?.withRenderingMode(.alwaysOriginal)
        temperatureLabel.text = "\(randomTap)°"
        
    }
    
    @IBAction func changeButtonTapped(_ sender: Any) {
        // 도시, 온도, 날씨 이미지 변경
        reload()
    }
    
}
