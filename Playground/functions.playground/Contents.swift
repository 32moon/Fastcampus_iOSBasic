import UIKit


// 함수 생성
func printHello() {
    print("Hello swift world")
}
// 함수 실행
printHello()



// input 파라메터를 받는 함수 생성
func printName(name: String) {
    print("name is \(name)")
}

// input 파라메터를 받아서 함수 실행
printName(name: "문정")



// output
func makeDouble(num: Int) -> Int {
    return num * 2
}

// 함수 makeDouble의 아웃풋(반환값)으로 할당된 상수 result
let result = makeDouble(num: 3)
print(result)


// input 파라메터 가독성 높이기: of
func printName1(of name: String) {
    print("name is \(name)")
}

printName1(of: "문짱")

// input 파라메터 가독성 높이기: _
func printName2(_ name: String) {
    print("name is \(name)")
}

printName2("문준짱")


// default parameter : 파라메터 기본값 설정
func discount(price: Double, ratio: Double = 0.2) -> Double {
    return price * (1 - ratio)
}

let defaultRatioApplied = discount(price: 2000)
print(defaultRatioApplied)

let customRatioApplied = discount(price: 2000, ratio: 0.5)
print(customRatioApplied)



// Variadic function
func printNames(_ names: Any...) {
    for name in names {
        print("name is \(name)")
    }
}

printNames("가", 5, "나", "다")




// Throwing function : 함수 예외 케이스 받기
enum DivideError: Error {
    case cannotZero
}

// 에러를 반환하는 함수 생성
func divide(dividedend: Int, divisor: Int) throws -> Int {
    if divisor == 0 {
        throw DivideError.cannotZero
    }
    return Int(dividedend/divisor)
}

// 함수 실행 할 때 throw 값을 반환하도록 do-catch 를 이용해 실행
do {
//    let result = try divide(dividedend: 80, divisor: 0)
    let result = try divide(dividedend: 80, divisor: 6)
    print(result)
} catch {
    print(error.localizedDescription)
}



// In-out parameter
func makeTriple(num: inout Int) {
    num *= 3
}

var num = 8
makeTriple(num: &num)

print(num)


