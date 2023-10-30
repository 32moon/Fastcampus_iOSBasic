import UIKit


protocol ClassPresident {
    var name: String { get }
    var className: String { get }
    
    func sayHello()
    func checkClassMember()
}

struct UnivPressidentStudent: ClassPresident {
    var name: String
    var className: String
    
    func sayHello() {
        print("대학생: 교수님 안녕하십니까")
    }
    
    func checkClassMember() {
        print("대학생: 출석 체크~~~")
    }
}

let jason = UnivPressidentStudent(name: "jason", className: "공대")
jason.sayHello()
jason.checkClassMember()


// protocol 재사용
protocol Purchaseable {
    var name: String { get set }
}

func buy(_ item: Purchaseable) {
    print("I'm buying \(item.name)")
}

struct Book: Purchaseable {
    var name: String
    var author : String
}

struct Movie: Purchaseable {
    var name: String
    var actors: [String]
}

struct Car: Purchaseable {
    var name: String
    var manufacturer: String
}

struct Coffee: Purchaseable {
    var name: String
    var strength: Int
}

let harryPotter = Book(name: "harryPotter", author: "J.K Rowling")
let topgun = Movie(name: "TopGun", actors: ["Tom cruise"])
let modelX = Car(name: "modelX", manufacturer: "Tesla")
let americano = Coffee(name: "ahah", strength: 5)

buy(harryPotter)
buy(topgun)
buy(modelX)
buy(americano)



// protocol 상속
protocol Payable {
    func calculateWages() -> Int
}

extension Payable {
    func calculateWages() -> Int {
        return 10_000_000
    }
}

protocol Trainable {
    func train()
}

extension Trainable {
    func train() {
        print("Study hard")
    }
}

protocol HasVavation {
    func takeVacation(days: Int)
}

extension HasVavation {
    func takeVacation(days: Int) {
        print("take \(days) day off")
    }
}

protocol Employee: Payable, Trainable, HasVavation { }

struct DeveloperEmployee: Employee {
    var name: String
    
//    func calculateWages() -> Int {
//        return 10_000_000
//    }
//
//    func train() {
//        print("Study hard")
//    }
//
//    func takeVacation(days: Int) {
//        print("take \(days) day off")
//    }
}


struct DesigherEmployee: Employee {
    var name: String
    
    func train() {
        print("Study Design Hard")
    }
}

let jane = DesigherEmployee(name: "jane")
jane.train()

let choi = DeveloperEmployee(name: "choi")

choi.calculateWages()
choi.takeVacation(days: 3)
choi.train()


// extension
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    
    func squqred() -> Int {
        return self * self
    }
    
}

let number = 8
number.squqred()
number.isEven


// protocol extension
extension Collection {
    func summerize() {
        print("There are \(count) members")
    }
}

let stringArray = ["aa", "bb", "cc"]
let numSet = Set([1,2,3,4,5])

stringArray.summerize()
numSet.summerize()
