import UIKit

struct Movie1 {
    var name: String
}

// 여기서 var movie는 "객체의 인스턴스" 라고 불린다.
var movie1 = Movie1(name: "탑건")
// 객체 인스턴스를 이용해서 객체의 속성(name)에 접근 할 수 있다.
print(movie1.name)

movie1.name = "탑건:매버릭"
print(movie1.name)


// 저장 프로퍼티, 계산 프로퍼티
struct Movie2 {
    // stored property
    var name: String
    var director: String
    
    // computed property
    var description: String {
        return "\(name) is \(director)'s best movie ever"
    }
}

var movie2 = Movie2(name: "인셉션", director: "놀란")
print(movie2.description)



// Property observers

struct Task {
    var name: String
    var progress: Int {
        didSet {
            var str = ""
            for i in 1...10 {
                if progress >= i * 10 {
                    str += "*"
                } else {
                    str += "--"
                }
            }
            print("current Progress \(str)")
        }
    }
    var isDone: Bool {
        return progress == 100
    }
}

var task = Task(name: "Very Important", progress: 0)
task.progress = 30
task.progress = 50
task.progress = 100
print(task.isDone)


// struct 메서드 구현
struct Student {
    var name: String
    var major: String
    var knowledge: Double
    
    func didFinalTest() -> Int {
        let howMuchIDontKnow = (1 - knowledge) * 100
        let score = 100 - Int(howMuchIDontKnow)
        return score
    }
    
    mutating func didStudy() {
        if knowledge >= 1 {
            knowledge = 1
        } else {
            knowledge += 0.1
        }
    }
}

var student = Student(name: "문정", major: "cs", knowledge: 0.3)
let score = student.didFinalTest()

student.didStudy()
let score2 = student.didFinalTest()




// string 구조 알아보기
let str : String = "Hello Swift"

print(str.count) // 글자 수(공백포함)
print(str.sorted()) // 빈 공백 포함 각각의 글자들을 순서대로 나열, 공백 우선 나열
print(str.split(separator: "")) // ~를 기준으로 나눔, 현재는 공백을 기준으로 나눔
print(str.uppercased()) // 해당 문자열을 대문자로 바꿈
print(str.hasPrefix("Hi")) // 문자열이 ~로 시작하는지 확인, bool 값 반환



// initializer
struct iPhone {
    // 초기값을 안줘도 된다.
    var model: String
}

let iPhone13 = iPhone(model: "iPhone13")
print(iPhone13)


struct iPhoneInit {
    var model: String
    
    // 초기값을 주는 경우
    init(model: String = "iPhone13") {
        self.model = model
    }
}

let phoneInit = iPhoneInit()
print(phoneInit)



// lazy 키워드 사용

struct Transactions {
    init(){
        print("Loading self history...")
    }
}

struct SecondHandItem {
    var name: String
    lazy var history: Transactions = Transactions()
    
    init(name: String) {
        self.name = name
    }
}

var usedMacbook = SecondHandItem(name: "M2 MacBookAir")
usedMacbook.history





// static
struct FCLecture {
    // 타입 프로퍼티 생성
    static var academyName: String = "Fast Campus"
    var name: String
}

var iOSLecture = FCLecture(name: "iOS 강의")
var backendLecture = FCLecture(name: "백엔드 강의")

print(iOSLecture.name)
print(backendLecture.name)
print(FCLecture.academyName)



// Access Control
struct UserAccount {
    private var id: String
    private var bill: Int
    var name: String
    
    init(id: String, bill: Int, name: String) {
        self.id = id
        self.bill = bill
        self.name = name
    }
    
    func billDescription() -> String {
        return "\(id)'s billing amount : \(bill)"
    }
}

var user01 = UserAccount(id: "1234", bill: 400, name: "Mike")

let billDescription01 = user01.billDescription()
print(billDescription01)
