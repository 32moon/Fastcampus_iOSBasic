import UIKit

// 클로저 만들기: 파라메터가 없는 클로저
let checking1 = {
    print("cheking🔥")
}

checking1()



// 클로저 만들기: input 클로저
let checking2 = { (id: String) in
    print("cheking2🔥 id:\(id)")
}

checking2("문정")


// 클로저 만들기: output 클로저
// user000 은 차단된 계정이다~ 라는 클로저
let checking3 = { (id: String) -> Bool in
    if id == "user000" {
        return false
    }
    return true
}

let isValid = checking3("user000")



// 클로저 만들기: 함수의 파라미터가 되는 클로저
func validate(id: String, checking: (String) -> Bool) -> Bool {
    // Some Preparation work here...
    print("Validation 준비중...")
    let isValid = checking(id)
    return isValid
}

let validationResult = validate(id: "user002", checking: checking3)



// return 이 없는 클로저의 경우 " -> Void" 를 통해서 반환값이 없음을 표시
let printHello = { () -> Void in
    print("Hello Swift")
}

func doSomeClosure(_ action: () -> Void) {
    action()
}

doSomeClosure(printHello)


// 함수내부에서 클로저를 바로 작성: 인라인으로 넣어준다~ 라고 표현한다.
let validationResult2 = validate(id: "User001", checking: { (id: String) -> Bool in
    if id == "User000" {
        return false
    }
    return true
})

doSomeClosure({
    print("Hello Swift")
})



// 인라인 클로저 줄여보기: 중간 단계
let validationResult3 = validate(id: "User001", checking: { id in
    if id == "User000" {
        return false
    }
    return true
})

// 인라인 클로저 줄여보기: 짧은 단계
let validationResult4 = validate(id: "User001", checking: { id in
    let isValid = id != "User000"
    return isValid
})

// 인라인 클로저 줄여보기: 더 짧은 단계
let validationResult5 = validate(id: "User001", checking: {$0 != "User000"})
// 트레일링 클로져
let validationResult6 = validate(id: "User001") {$0 != "User000"}
