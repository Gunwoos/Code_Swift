//: Playground - noun: a place where people can play

import UIKit

//for문

// for index in 1...4 {
//    print("\(index) times 5 is \(index*5)")
// }
//

//for문의 index 가 필요 없을 시 언더바로 생략 가능
//for _ in 1...4{
//    print("U r great")
//}

// 문자열로도 for문 반복 가능
//for char in "String"{
//    print(char)
//}


//3의 n승 구하기
//var sum:Int=1
//
//for _ in 1...10{
//    sum=3*sum
//}
//print(sum)

//내림차순
//for index in (1...10).reversed(){
//    print(index, terminator: " ")
//}
//print()


//내림차순의 다른 방법
//for index in stride(from: <#T##Strideable#>, to: <#T##Strideable#>, by: <#T##Comparable & SignedNumeric#>){
//
//}


//while문

//while 조건{
//    코드
//}


//var num=0
//var sum=0
//
//while num<=100{
//    sum+=num
//    num+=1
//}
//print(sum)



// repeat-while문

//repeat{
//    코드
//}while 조건


//구구단
//func mul(_ num1:Int,_ num2:Int){
//    for index in 1...num2{
//        print("\(num1) * \(index) = \(num1*index)")
//    }
//}
//mul(2,9)
//
//
//Factorial
//
//func factorial(_ num1:Int){
//    var sum=1
//    for index in (1...num1).reversed(){
//        sum*=index
//    }
//    print(sum)
//}
//
//factorial(3)

//Unnamed Tuple
//tuple을 정의 후 타입 변경이나 추가가 불가하다



//let number: Int=10
//
//let threeNum: (Int, Int, Int)=(1,2,5)
//type(of: threeNum)
//
//threeNum.0
//threeNum.1
//
//var twoNum:(Int, Double)=(12,1.5)
//type(of: twoNum)
//
//twoNum.1=3.14


// Named Tuple

//var student=(age:20 ,name:"Dean")
//
//var studen:(age:Int, name:String)=(age:20, name:"Dean")
//
//student.age

/*
### Question
for , while , repeat - while 등을 활용하여 아래 문제들을 구현해보세요.
- 1 ~ 9 사이의 숫자를 입력받아 해당 숫자에 해당하는 구구단의 내용을 출력하는 함수
- 정수 하나를 입력받아 그 수의 Factorial 을 구하는 함수
- 정수 두개를 입력받아 첫 번째 수를 두 번째 수의 횟수만큼 곱한 값을 반환하는 함수
- 정수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
- 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
- 정수 하나를 입력받아 그 정수의 약수를 모두 출력하는 함수
- 2 이상의 정수를 입력받아, 소수인지 아닌지를 판별하는 함수
- 정수를 입력받아 입력받은 수에 해당하는 자리의 피보나치 숫자를 반환하는 함수
*/

//8.
//
//func checkFibonacci(_ num:Int)->Int{
//    var sum:Int=0
//    var firstNum=0
//    var secondNum=1
//
//    if num<=0{
//        print("0 이하의 수 입니다")
//        return 0
//    }
//    else if num==1{
//        sum=0
//    }
//    else if num==2{
//        sum=1
//    }
//    else{
//        for _ in 1...(num-2){
//            sum=firstNum+secondNum
//            firstNum=secondNum
//            secondNum=sum
//        }
//    }
//    return sum
//}
//
//checkFibonacci(0)
//checkFibonacci(1)
//checkFibonacci(2)
//checkFibonacci(5)
//checkFibonacci(7)
//
//
//7.
//
//func checkNum(_ num:Int){
//    var check:Int=0
//
//    if num<2{
//        print("입력 받은 수가 2보다 작습니다.")
//    }
//    else{
//        for index in 2...(num-1){
//            if num%index==0{
//                check+=1
//            }
//        }
//        if check==0{
//            print(" \(num) : 소수 입니다")
//        }
//        else{
//            print(" \(num) : 소수가 아닙니다")
//        }
//    }
//}
//
//checkNum(17)
//checkNum(100)
//
//6.
//func getNum(_ num:Int){
//
//    for index in 1...num{
//        if num%index==0{
//            print(index)
//        }
//    }
//}
//
//getNum(15)
//
//
//
//
//5.
//func getNum(_ num1:Int,_ num2:Int,_ min:Int,_ max:Int){
//    var minNum:Int; minNum=min
//    var maxNum:Int; maxNum=max
//    var checkNum:Int=0
//
//    for index in minNum...maxNum{
//        if index%num2==0{
//            if index%num1==0{
//                checkNum+=1
//                print(index)
//            }
//        }
//    }
//    if checkNum==0{
//        print("해당 범위 내에 최소 공배수 없음")
//    }
//    else{
//        print("해당 범위 내에 최소 공배수 갯수 : ",checkNum)
//        print()
//    }
//}
//
//getNum(3,5,1,100)
//getNum(15,17,1,50)
//
//
//
//4.
//func addNum(_ num : Int)-> Int{
//    var count = 1
//    var sum = 0
//    var newNum = 0
//    var firstNum:Int
//    firstNum=num
//
//    while num > count{
//        count *= 10
//    }
//
//    while count >= 1{
//        newNum = firstNum/count
//        sum += newNum
//        firstNum = firstNum - (newNum * count)
//        count /= 10
//    }
//
//    return sum
//}
//
//addNum(123)
//addNum(1)
//addNum(6463)


//3<3.14
//
//"^"<"a"
//
//var i = 10
//var j = 10.2
//
//i<j

// Tuple macthing




//case let( x, y, z, 0) == case (let x, let y, let z, 0)

//Dictionary Enumeration  - 순서 없이 key 값으로 주소에만 저장이 됨

//let fruits = [ "A":"Apple", "B":"Banana" ]
//
//for (key, value) in fruits{
//    print(key, value)
//}
//for index in fruits{
//    print(index.key, index.value)
//}


// Control Transfer Statement

//continue
//return
//break
//fallthrough
//throw

//func isEven(num:Int)->Bool{
//    if num%2==0{
//        return true
//    }
//    print("odd")
//    return false
//}
//isEven(num: 1)
//isEven(num: 2)


//for num in 0...8{
//    if num%2==0{
//        break
//    }
//    print(num)
//}




/*
 -----------------------------------------------------------------------------------------------
 */
//Enumerations
//연관된 값의 그룹에 대해 공통 타입을 정의한 뒤 type-safe 하게 해당값들을 사용 가능


//enum SomeEnumeration{
//
//}
//
//enum CompassPoint{
//    case north
//    case south
//    case east
//    case west
//}
//enum Planet{
//    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
//}
//
//var directionThHead1 = CompassPoint.east
//
//directionThHead1 = .south
//
//var directionToHead2: CompassPoint = .south


// Matching Enumeration Values


//let directionToHead = CompassPoint.south
//
//switch directionToHead {
//case .north:
//case .south:
//case .east:
//case .west:
//}


//enum Barcode{
//    case upc(Int, Int, Int, Int)
//    case qrCode(String)
//}
//var productBarcode = Barcode.upc(1, 2, 3, 4)
//productBarcode = .qrCode("apple")
//
//type(of: productBarcode)


//Raw value
//-  반드시 고유한 값이어야 함
// - string, character, int or float


//enum PlanetIntRaw: Int{
//    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
//}
//
//PlanetIntRaw(rawValue: 7)
//
//let possiblePlanet = PlanetIntRaw(rawValue: 2)
//
//let positionToFind = 10
//
//
//
//enum remoteControl{
//    case on, off
//    mutating func next(){ // mutating - enum 내부에서 상태 변경을 가능하게 해줌
//        switch self {
//        case .off:
//            self = .on
//        case .on:
//            self = .off
//        }
//    }
//}
//
//var newremoteControl = remoteControl.on
//newremoteControl.next()
//newremoteControl.next()






//재귀함수 - 자기 자신을 재참조하는 함수

//func factorial(_ num:Int)->Int{
//    guard num != 1 else { return 1 }
//    return num * (factorial(num-1))
//}
//
//factorial(5)


// 피보나치 수열
//func fibonacchi(_ num : Int)->Int{
//    if num==1{
//        return 0
//    }
//    else if num==2{
//        return 1
//    }
//    else{
//        return fibonacchi(num-1) + fibonacchi(num-2)
//    }
//}
//fibonacchi(5)

//enum 의 재귀호출 - list 와 비슷




































