//: [Previous](@previous)

import Foundation
import Combine

// Transform - Map
let numPublisher = PassthroughSubject<Int, Never>()
let subscruption1 = numPublisher
    .map { $0 * 2 }
    .sink { value in
        print("Transfored Value: \(value)")
    }

numPublisher.send(10)
numPublisher.send(20)
numPublisher.send(30)
subscruption1.cancel()


// Filter
let stringPublisher = PassthroughSubject<String, Never>()
let subscription2 = stringPublisher
    .filter { $0.contains("a") }
    .sink { value in
        print("Filter Value: \(value)")
    }

stringPublisher.send("abc")
stringPublisher.send("jack")
stringPublisher.send("joon")
subscription2.cancel()


//: [Next](@next)
