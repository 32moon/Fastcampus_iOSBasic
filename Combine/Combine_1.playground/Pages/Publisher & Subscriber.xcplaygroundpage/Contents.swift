//: [Previous](@previous)

import Foundation
import Combine

// Publisher & Subscriber

// 1. just 퍼블리셔 : 단일 데이터를 한번 전송하고 끝인 퍼블리셔
let just = Just(1000)
let subscribtion1 = just.sink { value in
    print("Recived Value: \(value)")
}

// 2. 순차적으로 들어오는 데이터를 하나씩 전송
let arrayPublisher = [1, 3, 5, 7, 9].publisher
let subscribtion2 = arrayPublisher.sink { value in
    print("Recived Value: \(value)")
}


// 3. assing : 데이터를 배출 하여 세팅
class MyClass {
    var property: Int = 0 {
        didSet {
            print("Did set property to \(property)")
        }
    }
}

let object = MyClass()
let subscription3 = arrayPublisher.assign(to: \.property, on: object)
print("Final Value: \(object.property)")



//: [Next](@next)


