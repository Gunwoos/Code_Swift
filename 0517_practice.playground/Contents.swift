//: Playground - noun: a place where people can play

import UIKit



enum School : String {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate = "대학원"
}

let highestEducationLevel : School = School.university

print(highestEducationLevel.rawValue)
print(School.elementary.rawValue)

enum Num : Int {
    case zero
    case one
    case two
    case ten = 10
}

print(Num.zero.rawValue, Num.one.rawValue, Num.two.rawValue, Num.ten.rawValue)

//???????????????????????????
let primary = School(rawValue: "유치원")
let graduate = School(rawValue: "석박사")

let one = Num(rawValue: 1)
let three = Num(rawValue: 3)




























