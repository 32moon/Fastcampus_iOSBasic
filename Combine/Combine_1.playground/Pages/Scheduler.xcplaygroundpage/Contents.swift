//: [Previous](@previous)

import Foundation
import Combine

// 어떤 스레드에서 작업을 할 건지, 작업 처리 우선 순위를 정하여 지정해 줄 수 있다.
let arrayPublisher = [1, 2, 3].publisher

let queue = DispatchQueue(label: "custom")

let subscription = arrayPublisher
    .subscribe(on: queue)
    .map { value -> Int in
        print("transform: \(value), thread: \(Thread.current)")
        return value
    }
    .receive(on: DispatchQueue.main)
    .sink { value in
    print("Receive Value: \(value), thread: \(Thread.current)")
}


//: [Next](@next)
