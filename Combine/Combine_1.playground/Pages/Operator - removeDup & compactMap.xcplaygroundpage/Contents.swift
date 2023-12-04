//: [Previous](@previous)

import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

// removeDuplicates : 중복된 데이터 값을 지울 때
let words = "hey hey there! Mr Mr ?"
    .components(separatedBy: " ")
    .publisher

words
    .removeDuplicates()
    .sink { value in
        print(value)
    }.store(in: &subscriptions)


// compactMap : 데이터를 변경했을 때 nil 인 값을 필터해 줄 때
let strings = ["a", "1.24", "3", "def", "45", "0.23"].publisher

strings
    .compactMap { Float($0) }
    .sink { value in
        print(value)
    }.store(in: &subscriptions)


// ignoreOutput : 구독이 유지되는데, 새로 들어온 데이터를 무시 할 때
let numbers = (1...10_000).publisher
numbers
    .ignoreOutput()
    .sink(receiveCompletion: { print("Completed with:\($0)") },
          receiveValue: { print($0) })
    .store(in: &subscriptions)


// prefix : 여러개의 데이터가 들어올 때 갯수를 정해서 정한 만큼만 받음
let tens = (1...10).publisher

tens
    .prefix(2)
    .sink(receiveCompletion: {print("completed with: \($0)") },
          receiveValue: { print($0) })
    .store(in: &subscriptions)





//: [Next](@next)
