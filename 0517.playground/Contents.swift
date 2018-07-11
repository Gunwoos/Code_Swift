//: Playground - noun: a place where people can play

import UIKit

// Value Types ( Collection)
//   Array (배열) - 정렬됨
//  Set ( 세트 ) - 정렬되지 않음
//  Dictionary - 정렬 되지 않고 키 값으로 참조 함


// Copy on Write Optimization - 사용 시 복사하여 값을 변경


import Foundation

// Array
// - 정렬됨
// - Zero-based Integer Index ( 0 부터 시작 )


//let strArray1: Array<String> = ["A", "B", "C"]
//let strArray2: [String] = ["A", "B", "C"]
//let strArray3 = ["a", "b", "c" ]
//let strArray4 = Array<String>(repeating: "apple", count: 7)

// let strArray5: [Any]=["Dean", 24, 173.5] // Any 사용하면 알아서 타입 추론 하여 배열 저장


// 변수명.count -> 배열 내부 인덱스 개수


// standIndex  = 0
// endIndex = 총 인덱스 + 1

//let alphabet = ["A", "B", "C", "D","E"]
//if alphabet.contains("A"){
//    print("contains A")
//}
//if alphabet.contains(where: { str -> Bool in
//
//    return str == "A"}){
//    print("contains A")
//}


// .index(of : 값 )  값의 인덱스를 찾는 메소드


// 배열끼리 더하기 가능
/*
var a = [ "q" , "a" ]
var b = ["d" , "w" ]
 var c: [String] = []
c=a+b
 */


// .append  - 배열 맨 뒤에 넣음

// .insert("dd", at: 넣고 싶은 위치)

var alpha=["A","B","C","D","E","F"]

//let removed = alpha.remove(at: 0)
//
//alpha.removeAll()
//alpha.removeAll(keepingCapacity : true)


//func findAndRemove(_ str:String){
//    alpha.remove(at: alpha.index(of: str)!)
//}


//findAndRemove("C")


// sort

//var sortedArray = alpha.sorted()
//sortedArray
//alpha
//
//alpha.sort()
//alpha


//var a = ["1":1,"2":2]
//
//a.updateValue(5, forkey : "1")


    
//var set =Set([1, 2, 3, 4 ,6])
//var set2 = Set([7])
//
//set2.elementsEqual(set)




























