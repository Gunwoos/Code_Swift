//: Playground - noun: a place where people can play

import UIKit

let aArray = Array(1...40)

//1.
let aArray1 = aArray.enumerated().map{return $0*$1}
//aArray.enumerated().map{return *}
print(aArray1)
print("")

func returnIndex(_ index : Int,_ element : Int)->Int{
    return index * element
}

for index in aArray.startIndex..<aArray.endIndex{
    type(of: index)
    print(returnIndex(index,aArray[index]))
}


//2.
let aArray2 = aArray.filter{ $0%2 == 0 }
print(aArray2)
print("")

func evenNum(_ index:Int)->Bool{
    return index%2==0
}
for index in aArray{
   print(evenNum(index))
}


//3.
let aArray3 = aArray.reduce(0){ (sum, next) in sum + next}
//aArray.reduce(0){$0+$1}
//aArray.reduce(0, + )
print(aArray3)
print("")

func addNum(_ sum: Int,_ next: Int)->Int{
    return sum + next
}
var sumNum = 0

for index in aArray{
    sumNum = addNum(sumNum, index)
}



////4.
//let aArray4 = aArray.enumerated().map{ return $0 * $1 }.filter{ $0%2==0 }.reduce(0){ (sum, next) in sum + next}
//print(aArray4)
//print("")



//let bArray : [[Int?]] = [[1,2,3],[nil,5],[6,nil],[nil,nil]]
//



//
//
//print(1)
//print(bArray.compactMap({$0}))
//print("")
//
//print(2)
//print(bArray.map(({$0.compactMap({$0})})))
//print("")
//
//print(3)
//print(bArray.flatMap{ $0 })
//print("")
//
//print(4)
//print(bArray.flatMap{ $0 }.compactMap{ $0 })
//print("")


/*
### Question
for , while , repeat - while 등을 활용하여 아래 문제들을 구현해보세요.
1 - 1 ~ 9 사이의 숫자를 입력받아 해당 숫자에 해당하는 구구단의 내용을 출력하는 함수
2 - 정수 하나를 입력받아 그 수의 Factorial 을 구하는 함수
3 - 정수 두개를 입력받아 첫 번째 수를 두 번째 수의 횟수만큼 곱한 값을 반환하는 함수
4 - 정수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
5 - 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
6 - 정수 하나를 입력받아 그 정수의 약수를 모두 출력하는 함수
7 - 2 이상의 정수를 입력받아, 소수인지 아닌지를 판별하는 함수
8 - 정수를 입력받아 입력받은 수에 해당하는 자리의 피보나치 숫자를 반환하는 함수
*/

// forEach, map , filter, reduce, flatMap, compactMap 를 활용해서 구현해보기

//1.

func mulFunc(_ index : Int){
    var num = 0
    let mulFuncArray = Array(1..<10)
    mulFuncArray.forEach{_ in
        num += 1
        print("\(index) * \(num) = \(index*num) ")
    }
}
mulFunc(9)

//2.
func factorial(_ index : Int){
    let count = Array(1...index)
    var sum = 1
    var check = index
    count.forEach{_ in
        sum = sum * check
        check = check - 1
    }
    print(sum)
}
factorial(3)

//3.


func check(){
let numbers = [1,2,3,4,5]

for i in numbers{
    guard i != 3 else{break}
    guard i%2==0 else{continue}
    print(i)
}

numbers.forEach{num in
    guard num != 3 else{return}
    guard num%2==0 else{ return}
    print(num)
}
}
check()


//let num = [1, nil, 2, 3]
//let newNum = num.compactMap{$0} // [1,2,3]
//newNum




let num = [[1,2,3],[nil,4],[5,nil],[nil,nil]]
let newNum = num.flatMap{$0} // [1,2,3,nil,4,5,nil,nil,nil]
newNum














