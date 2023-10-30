import UIKit

var age: Int? = nil
print(age)

age = 12
print(age)

// 옵셔널 언래핑
if let unwrapped = age {
    print("age: \(unwrapped)")
} else {
    print("age is missing")
}

func printAge(age: Int?) {
    guard let unwrapped = age else {
        print ("age is missing")
        return
    }
    print("age: \(unwrapped)")
}

printAge(age: age)


// Force unwrapping
let force = age!



// Nill Coalescing
age = nil
let currentAge = age ?? 20

struct Developer {
    var name: String
}

var jason: Developer? = Developer(name: "jason")
print(jason?.name)

jason = nil
print(jason?.name)



// typecasting
class Animal {
    
}

class Cat: Animal {
    
}

class Dog: Animal {
    func bark() {
        print("wal wal")
    }
}

let pets: [Animal] = [Cat(), Dog(), Cat(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.bark()
    }
}
