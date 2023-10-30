import UIKit


// 산술 연산자
let first = 10
let second = 3

let sum = first + second
let diff = first - second

let multiple = first * second
let divided = first / second

let remainder = first % second



// 오퍼레이터 오버로딩
let str1 = "aaa"
let str2 = "bbb"

let str = str1 + str2

let names1 = ["April", "Bob"]
let names2 = ["Chuck"]

let names = names1 + names2



// 연산자 줄이기, 컴파운드 오퍼레이터
var price1 = 10
price1 += 1

var price2 = 20
price2 -= 5

var price3 = 30
price3 *= 3

var price4 = 40
price4 /= 2

var quote = "Hello, swift"
quote += " Playgrounds"



// 비교 연산자
let score1 = 6
let score2 = 4

score1 == score2
score1 != score2
score1 > score2
score1 >= score2
score1 < score2



// 조건문
let num1 = 3
let num2 = 5

let newSum = num1 + num2

if newSum > 10 {
    print("over 10")
} else {
    print("not over 10")
}

let age1 = 15
let age2 = 25

if age1 > 19 && age2 > 19 {
    print("19세 이상 영화를 같이 시청 가능")
} else {
    print("19세 미만 시청 불가")
}

if age1 > 20 || age2 > 20 {
    print("20세 이상 보호자가 있으면 입장가능")
}


// 삼항연산자
let age3 = 30
let age4 = 40

let text = age3 == age4 ? "same" : "not same"


// Switch

enum Direction {
    case up
    case down
    case left
    case right
}

let direction = Direction.down

switch direction {
case .up:
    print("위")
case .down:
    print("아래")
case .left:
    print("좌")
case .right:
    print("우")
}










