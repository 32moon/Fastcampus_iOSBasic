//: [Previous](@previous)

import Foundation
import Combine


// Basic CombineLatest -> 두 타입의 퍼블리셔를 함께 처리 / 가장 최신의 데이터를 무조건 함께 출력
let stringPublisher = PassthroughSubject<String, Never>()
let numPublisher = PassthroughSubject<Int, Never>()

//Publishers.CombineLatest(stringPublisher, numPublisher).sink { <#(String, Int)#> in
//    <#code#>
//}

stringPublisher.combineLatest(numPublisher).sink { (str, num) in
    print("Receive: \(str), \(num)")
}

stringPublisher.send("a")
stringPublisher.send("b")
stringPublisher.send("c")
numPublisher.send(1)
numPublisher.send(2)
numPublisher.send(3)



// Advanced CombineLatest
let userNamePublisher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

let validatedCrendetialsSubscription = userNamePublisher.combineLatest(passwordPublisher)
    .map { (userName, password) -> Bool in
        return !userName.isEmpty && !password.isEmpty && password.count > 12
    }
    .sink { vaild in
        print("Credantial valid? : \(vaild)")
    }

userNamePublisher.send("문정")
passwordPublisher.send("asdfvgffffffffff")



// Merge : 퍼블리셔의 아웃풋 타입이 같아야 머지가 가능하다
let publisher1 = [1, 2, 3, 4, 5].publisher
let publisher2 = [300, 400, 500].publisher

let mergePublisherSubscription = publisher1.merge(with: publisher2)
    .sink { value in
        print("Merge: Subscription rececied value: \(value)")
    }


//: [Next](@next)
