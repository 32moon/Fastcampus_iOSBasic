//: [Previous](@previous)

import Foundation
import UIKit
import Combine

final class SomeViewModel {
    @Published var name: String = "Jack"
    var age: Int = 20
}

final class Label {
    var text: String = ""
}

let label = Label()
let viewModel = SomeViewModel()
print("--> text: \(label.text)")

viewModel.$name.assign(to: \.text, on: label)
print("--> assign text: \(label.text)")

viewModel.name = "Jason"
print("--> update text: \(label.text)")



//: [Next](@next)
