import UIKit

//var greeting = "Hello, playground"

// Tuple
var phone = (os: "iOS", model:"iPhone14")
phone.0
phone.1

var rawPhone = ("iOS", "iPhone14")
rawPhone.0


// Enum
enum WeekDay {
    case mon
    case tue
    case wed
    case thu
    case fri
}

var today: WeekDay = .fri

//enum MediaType {
//    case audio
//    case video
//}
//
//var mediaType: MediaType = .audio


// associated value

enum MediaType {
    case audio(String)
    case video(String)
}

var mp3: MediaType = .audio("mp3")
var h264: MediaType = .video("h264")


enum MasterLevel: Int {
    case beginner
    case intermediate
    case professional
}

var pro = MasterLevel(rawValue: 2)
let otherLevel = MasterLevel(rawValue: 5) // -> 해당 조건에 맞는 값이 없다.

enum Direction: String {
    case up
    case down = "ddd"
    case leftRight = "left_rigth"
}

var dir: Direction = .down
dir.rawValue

let up = Direction(rawValue: "up") // enum의 case 값에 string 타입의 데이터를 할당함
