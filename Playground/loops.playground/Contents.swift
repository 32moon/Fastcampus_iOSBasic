import UIKit


// for loop_ Range
let numRange = 1...10

// numRange 범위 동안 반복하는데, 해당 범위의 숫자를 계속해서 출력한다.
for num in numRange {
    print("num is \(num)")
}


// for loop_ Array
let names = ["john", "Kevin", "Jason"]

for name in names {
    print("name is \(name)")
}

// while
var num1 = 1

while num1 <= 20 {
    print(num1)
    num1 += 1
}
print("더이상 조건을 만족하지 않아서 탈출")
print(num1)


// repeat
var num2 = 1

repeat {
    print(num2)
    num2 += 1
} while num2 <= 20
print("더이상 조건을 만족하지 않아서 탈출")



// 루프 탈출
for i in 0...10 {
    if i == 4 {
        break
    }
    print(i)
}

print("---> 루프 탈출")

var countDown1 = 4

while countDown1 > 0 {
    countDown1 -= 1
    if countDown1 == 0 {
        break
    }
    print(countDown1)
}
        
print("---> 스킵")

for i in 0...10 {
    if i == 4 {
        continue // i 가 4인 경우 스킵하고 계속해서 루프 수행
    }
    print(i)
}
print("--->스킵 카운트 다운")

var countDown2 = 10
while countDown2 > 0 {
    countDown2 -= 1
    if countDown2 == 3 {
        continue
    }
    print(countDown2)
}
