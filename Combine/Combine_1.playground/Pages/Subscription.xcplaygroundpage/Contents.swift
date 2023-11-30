//: [Previous](@previous)

import Foundation
import Combine


let subject = PassthroughSubject<String, Never>()


// The print() operator prints you all lifecycle events
let subscription = subject
    .print("[--> 디버그]") // 디버그 가능
    .sink { value in
    print("subscriber recieved value: \(value)")
}

subject.send("Hello")
subject.send("Hello again")
subject.send("Hello for the last time!")

// 데이터 전달 종료
subject.send(completion: .finished)
// 구독 관계 취소
subscription.cancel()

subject.send("Hello ??")

//: [Next](@next)
