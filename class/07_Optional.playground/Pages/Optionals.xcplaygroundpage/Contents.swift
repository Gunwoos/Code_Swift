//: [Previous](@previous)
/*:
 # Optionals
 */
/*:
 ---
 ### Question
 - 값이 0인 것과 없는 것의 차이는?  (Empty vs Valueless)
 ---
 */





















/*:
 ![optional](0vsNULL.jpg)
 */

/*:
 ---
 ## Optional
 * Optional 은 값이 없을 수 있는(absent) 상황에 사용
 * Objective-C 에는 없는 개념
 * 옵셔널 타입은 2가지 가능성을 지님
   - 값을 전혀 가지고 있지 않음
   - 값이 있으며, 그 값에 접근하기 위해 옵셔널을 벗겨(unwrap)낼 수 있음
 ---
 */


let possibleNumber = "123"
var convertedNumber = Int(possibleNumber)
type(of: convertedNumber)

//type(of: Int(possibleNumber))
//
//let possibleString = 123
//var convertedString = String(possibleString)
//type(of: convertedString)




/*:
 ## Optional Type
 
 ![OptionalType](optional-type.png)
 */

// Type Declaration

var optionalType1: String?
var optionalType2: Optional<Int>

type(of: optionalType1)
type(of:optionalType2)


// Valueless state - nil

var optionalInt: Int? = 0
optionalInt = nil


// Init

var optionalIntInit = Optional<Int>(0)
type(of: optionalIntInit)


// Optional <-> NonOptional

//var nonOptional1 = nil   // optional 타입 명시 x
//var nonOptional2: Int = nil   // optional 타입 명시 x
//var nonOptionalType: Int = optionalInt    // optional 타입 명시 x

var integer = 1
optionalInt = integer
print(optionalInt)




/***************************************************
 Question
 - Optional 헤더 살펴보기
 - 아래 내용을 읽고 Objective-C 의 nil 과 Swift 의 nil 이 어떻게 다른지 말해보기
 
 Swift’s nil isn’t the same as nil in Objective-C.
 In Objective-C, nil is a pointer to a nonexistent object.
 In Swift, nil isn’t a pointer—it’s the absence of a value of a certain type.
 Optionals of any type can be set to nil, not just object types.
 ***************************************************/




/*:
 ---
 ## If Statements and Forced Unwrapping
 ---
 */

if convertedNumber != nil {
  print("convertedNumber contains some integer value.")
  print("convertedNumber has an integer value of \(convertedNumber).")
}


// ! = Forced Unwrapping

if convertedNumber != nil {
  print("convertedNumber has an integer value of \(convertedNumber!).")
}


print(convertedNumber)
print(convertedNumber!)



//convertedNumber = nil
//convertedNumber!



/*:
 ---
 ## Optional Binding

 ![if](optional-binding-if.png)
 
 ![while](optional-binding-while.png)
 
 ![guard](optional-binding-guard.png)
 ---
 */


if let actualNumber = Int(possibleNumber) {
  print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
  print("\"\(possibleNumber)\" could not be converted to an integer")
}



var optionalStr: String? = "Hello, Optional"

// let

if let optionalStr = optionalStr {
  optionalStr
} else {
  "valueless string"
}

// var

if var str = optionalStr {
  str += "😍"
  str
}




// Out of scope

func doSomething(str: String?) {
  guard let str = str else {
//    print(str)
    return
  }

  print(str)
}

doSomething(str: nil)







// Many optional bindings and Boolean conditions in a single if statement

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
  print("\(firstNumber) < \(secondNumber) < 100")
}

// ==

if let firstNumber = Int("4") {
  if let secondNumber = Int("42") {
    if firstNumber < secondNumber && secondNumber < 100 {
      print("\(firstNumber) < \(secondNumber) < 100")
    }
  }
}


/*:
 ## IUO (Implicitly Unwrapped Optionals)
 */


let possibleString: String? = "An optional string."
let forcedString: String = possibleString!
type(of: possibleString)
type(of: forcedString)


let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString
type(of: assumedString)
type(of: implicitString)


if assumedString != nil {
  print(assumedString!)
}

if let definiteString = assumedString {
  print(definiteString)
}

/*************************************************** 걍 안쓰는게 좋음
 - 추후 어느 순간에서라도 nil 이 될 수 있는 경우에는 이 것을 사용하지 말아야 함
 - nil value 를 체크해야 할 일이 생길 경우는 일반적인 옵셔널 타입 사용
 ***************************************************/



/*:
 ## Nil-coalescing Operator
 */

optionalStr = nil

let result: String
if optionalStr != nil {
   result = optionalStr!
} else {
   result = "???"
}

// let result1 = optionalStr ?? "???" // optional이 nil이 아니고 자기 자신의 값이 있을 때는 자기 자신을, 값이 없고 nil 값일 때는 뒤에 내용을




let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName


userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName



/***************************************************
 The nil-coalescing operator is shorthand for the code below:
 a != nil ? a! : b
 ***************************************************/

/*:
 ## Optional Chaining
 */

class Person {
  var residence: Residence = Residence()
}

class Residence {
  var numberOfRooms = 1
  var address: String?
}

let john = Person()
let roomCount = john.residence.numberOfRooms



/***************************************************
 Question
 residence 변수의 타입을 옵셔널 타입으로 변경하게 될 경우?
 ***************************************************/












class Person1 {
  var residence: Residence1?
}
class Residence1 {
    var numberOfRooms : Int = 1
    var address: String?
}

let edward = Person1()
edward.residence = Residence1()

let roomCount1 = edward.residence?.numberOfRooms
//let roomCount2 = edward.residence!.numberOfRooms
type(of: roomCount1)
//type(of: roomCount2)


if let roomCount = edward.residence?.numberOfRooms {
  print("John's residence has \(roomCount) room(s).")
} else {
  print("Unable to retrieve the number of rooms.")
}




//john.residence = Residence()





/*:
 ---
 ## Defining Model Classes for Optional Chaining
 ---
 */

/***************************************************
 - 주소지를 나타내는 클래스를 만들 때 옵셔널을 이용한다면?
 - 배열에 옵셔널은 어떤 식으로 사용할까
 ***************************************************/






class Address {
  var buildingName: String?
  var buildingNumber: String?
  var street: String?
  func buildingIdentifier() -> String? {
    if let buildingNumber = buildingNumber, let street = street {
      return "\(buildingNumber) \(street)"
    } else if buildingName != nil {
      return buildingName
    } else {
      return nil
    }
  }
}



// Accessing Properties Through Optional Chaining


//let someAddress = Address()
//someAddress.buildingNumber = "29"
//someAddress.street = "Acacia Road"
//john.residence?.address = someAddress





// 배열 옵셔널

/***************************************************
 아래 두 가지의 차이점이 무엇이고 어떻게 다른지 확인해보기
 ***************************************************/

var arr1: [Int]? = [1,2,3] // 배열 자체에 optional
var arr2: [Int?] = [1,2,3, nil] // 배열 안의 요소에 optional



//if let firstRoomName = edward.residence?[0].name {
//  print("The first room name is \(firstRoomName).")
//} else {
//  print("Unable to retrieve the first room name.")
//}


arr1?.count
arr1?[1]

arr2.count
arr2[1]


/*:
 ---
 ## Optional Function Types
 ---
 */


let function: (() -> Int?)? = nil
function?()
//function!()




/*:
 ---
 ### Question
 - 친구 목록을 출력하는 내용을 구현
   - friendList(배열) 옵셔널 변수 만들기
   - func addFriend(name: String) 만들기
   - printFriendList() 함수 만들기
 - 지금까지 구현해봤던 함수나 클래스 속성을 옵셔널을 이용해 적용할 수 있었는지 확인해보고 수정해보기
 ---
 */

//: [Next](@next)
