//: [Previous](@previous)
/*:
 # Type Check
 */

class className {}
var anyArray: [Any?] = [1, "2", 3.0, nil]
var anyObjectArray: [AnyObject] = [className()]

/*:
 ---
 ## 타입 확인 - type(of: )
 ---
 */

func printGenericInfo<T>(_ value: T) {
  let types = type(of: value)
  print("'\(value)' of type '\(types)'")
}
printGenericInfo(2)


type(of: anyArray)
type(of: anyObjectArray)
type(of: 1)


/*:
 ---
 ## 타입 비교 - is
 ---
 */

if anyArray[0] is Int {
  print("Int")
} else {
  print("else")
}


type(of: anyArray[0])



// # type(of:)를 써서 비교할 때는 .Type 까지 명시

//if type(of:anyArray[0]) is Int.Type {
//  print("Equal")
//}

//if type(of:anyArray[0]) is Int {
//  print("Equal")
//}




//if 10 is Int {
//  print("Equal")
//}



/*:
 ---
 ## 상속 관계
 ---
 */
class Human {}
class Student: Human {}
class Baby: Human {}

let someone: Student = Student()
print(someone is Human)
print(someone is Student)
print(someone is Baby)


//: [Next](@next)
