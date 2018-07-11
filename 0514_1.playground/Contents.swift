//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print("Hello, world")
//주석맨
///print("Hello, world)" 한줄 주석 + Quick Help Mark up

/*
 
 /* 주석 */ 중첩 가능
 
 */

print(3.14)

var num = 1
print(num)

print("숫자",num)

print("숫자 \(num)")

print("숫자 " + String(num))

var numStr = "1"
// " @#@ " String 으로 타입 추론함

print("숫자" ,numStr)

// ; 한 라인에 다중 명령 사용하고 싶을 경우 세미콜론 필수
print("명령1"); print("명령2")


let maxStudent = 30
//maxStudent=20 (x) 상수 변경이 불가

var manStudent = 10; print(manStudent);
manStudent = 5; print(manStudent);
/*
 1. 변수나 상수 이름 정할 시 의미 방식 길이 등을 네이밍 컨벤션에 맞추어 선언
 2. Camel Case 로 !!!
 3. 선언 순서 - 선언 후 사용하라는 의미
 */

//비슷한 타입의 변수 선언시 , 로 가능
var x=0, y=1, z=3
print(x,y,z)

//Swift 에서 사용되는 키워드일 경우 (`) 를 이용해 사용 가능

/*
스코프 <- 같은 영역
 let a = 1
 let a = 2  (x)
 
 let a = 1
 func add(){
    let a = 2
 }           (o)
*/

/*
 Type Annotation 타입 선언을 명확하게 지정하는 것
 let thisYear: Int = 20
 let 변수명: 타입지정 = 변수값
 var 변수명: 타입지정 = 변수값
 
 변수에 타입만 명시 후 값 지정 가능
*/

var signedInteger = 123
(type(of:signedInteger))

MemoryLayout<String>.size
MemoryLayout<Int>.size
MemoryLayout<Double>.size

let isBool : Bool = true
type(of:isBool)

var language : Character = "김"  //Character 타입은 딱 하나의 문자만 지정 가능
type(of: language)
print(language)

language=" "
print(language)

var strHello = "안녕하새우"
type(of: strHello)
print(strHello)

typealias AudioSample = UInt16

var maxAmplitudeFound = AudioSample.min
var maxAmplitudeFound1 = UInt16.min

type(of:maxAmplitudeFound)
type(of:maxAmplitudeFound1)

//let height = Int8(5)
//let width=10
//let area = height*width

let h = UInt8(25)
let i = 10*h

//타입 변환  변수타입(바꿀타입이름)


let integer = Int(-15)
let magnitude = integer.magnitude
let absNum = abs(integer)

// 절대값 변경시 abs 를 선호
// magnitude 는 UInt 타입으로 변경, abs 는 Int 타입

/*
 Unary Operator 단항 연산자
 -a   항 하나만으로 연산 가능한 것

 전위 표기법
 -a 변수 앞에 표기하는 법

 Postfix 후위 표기법
 c! 변수 뒤에 표기하는 법

 Binary Operator 이항 연산자
 a + b  항이 두개있어야 연산 가능한 것

 Infix 중위 표기법
 a + b

 Ternary Operator 삼항 연산자
 a > 0 ? "positive" : "negative"
 a 가 0 보다 크면 positive 작으면 negative
 
 value++, value-- 지원 안함
 
 
 
*/


let e = 123.4
let f = 5.678
type(of: e)
type(of: f)

e/f

e.truncatingRemainder(dividingBy: f)

e.remainder(dividingBy: f)

"a"<"A"
"B"<="b"
"A"<"한" // 유니코드 값

Unicode.ASCII.encode("a")
Unicode.ASCII.encode("A")
Unicode.ASCII.encode("b")
Unicode.ASCII.encode("B")

var a = 1

a>0 ? print("positive") : print("negative")


0>>100  // 0부터 100까지
0..<100 // 0부터 99까지

let studentName = [ "tom", "jerry","tim","james"]

100>>0

(1...100).reversed() // 100 -> 1 순으로 감
/*
 var testNum:Int;
for testNum in (1...10).reversed(){
    print(testNum)
}
*/

func greet(person: String)->String{
    let greeting = " Hello, " + person + "!"
    return greeting
}
greet(person: "Anna")
greet(person: "Brian")

func greetAgain(person: String) -> String{
    return " Hello again, " + person + "!"
}
greetAgain(person: "Anna")






















































