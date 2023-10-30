import UIKit

class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func bark() {
        print("bow wow")
    }
}

// class 상속
class Collie: Dog {
    init(name: String) {
        super.init(name: name, breed: "Collie")
    }
    // 부모 클래스의 메서드를 오버라이드 해서 사용
    override func bark() {
        print("wal wal")
    }
}

let milk = Dog(name: "milk", breed: "Collie")
let milky = Collie(name: "milky")

milk.name
milk.breed
milk.bark()
milky.bark()



// class, struct 차이
class StudentClass {
    var name: String
    
    init(name:String) {
        self.name = name
    }
}

struct StudentStruct {
    var name: String
    
    init(name:String) {
        self.name = name
    }
}

var studentClass1 = StudentClass(name: "문정")
var studentClass2 = studentClass1

studentClass2.name = "정준"
studentClass1.name

var studentStruct1 = StudentStruct(name: "문짱")
var studentStruct2 = studentStruct1

studentStruct1.name
studentStruct2.name = "준짱"
studentStruct2.name
studentStruct1.name


// Deinitiailzer
// class는 mutating 키워드가 필요 없다.
class Human {
    var name: String
    
    init(name: String) {
        self.name = name
        print("initialize instance")
    }
    
    deinit {
        print("deninitialize instance \(name)")
    }
    
    func printName() {
        print("my name is \(self.name)")
    }
    
    // class는 mutating 키워드가 필요 없다.
    func updateName(to name: String) {
        self.name = name
    }
}

func createJhon() {
    let john = Human(name: "john")
    john.printName()
}

createJhon()

let sean = Human(name: "Sean")
sean.name
sean.updateName(to: "Son")
sean.name









