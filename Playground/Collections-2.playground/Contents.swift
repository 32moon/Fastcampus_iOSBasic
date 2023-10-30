import UIKit



// array
let yoo = "유재석"
let ji = "지석진"
let ha = "하하"
let so = "전소민"
let song = "송지효"
let kim = "김종국"

let runningMans = [yoo, ji, ha, so, song, kim]

runningMans[0]
runningMans[5]

var emptyArr: [Int] = [] // 배열 초기화
emptyArr = [Int]() // 이렇게도 표현 가능


// dictionary
let languageCode: [String:String] = [
    "한국" : "ko",
    "미국" : "en",
    "일본" : "ja"
]

languageCode["한국"]

var emptyDic: [String: Any] = [:] // 딕셔너리 초기화
emptyDic = [String: Any]()


// set
var primes: Set<Int> = [2,3,5,7]
var evens = Set<Int>([2,4,6,8,2,4]) // 중복데이터를 넣으면 알아서 무시됨

var emptySet: Set<Int> = [] // 초기화
emptySet = Set<Int>()
