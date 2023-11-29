import Foundation
import Combine

// PassthroughSubject
let relay = PassthroughSubject<String,Never>()
let subscription1 = relay.sink { value in
    print("subscription1 recived value: \(value)")
}
relay.send("Hello")
relay.send("World")
    


// CurrentValueSubject : output에 대한 초기값을 주어야 한다.
let variable = CurrentValueSubject<String, Never>("")

// subscription 하기 전에 초기 값을 줄 수 있다.
variable.send("Initial text")

let subscription2 = variable.sink { value in
    print("subscription2 recived value: \(value)")
}

variable.send("More text")

// value로 출력된 데이터를 확인할 수 있다.
variable.value




let publicher = ["Here", "we", "go"].publisher
publicher.subscribe(relay)
publicher.subscribe(variable)
