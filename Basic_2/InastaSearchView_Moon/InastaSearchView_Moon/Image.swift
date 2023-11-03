//
//  Image.swift
//  InastaSearchView_Moon
//
//  Created by 이문정 on 2023/11/02.
//

import Foundation

struct Image {
    static var animalImageNames: [String] = {
        var names: [String] = []
        for num in 1...24 {
            let imageName = "animal" + "\(num)"
            names.append(imageName)
        }
        return names
    }()
}

