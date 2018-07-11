//: Playground - noun: a place where people can play

import UIKit

//if문 양식
//
// if 조건변수 비교연산자 비교변수 {
//    코드
// }
// else if 조건변수 비교연산자 비교변수 {
//    코드
// }
// else{
//    코드
// }

//if-if문과 else-if문의 차이점

//var i = 70;
//
//if i <= 32{
//    print("true")
//}
// if i >= 86{
//    print("true")
//}
// else if i > 32 && i < 86{
//    print("true")
//}
//else{
//    print("10과 동일")
//}

//switch문 양식
//같은 타입의 변수만 비교 가능
//break는 default 빼고는 생략 가능
//범위도 가능
//var i = 1
//
//switch 변수 {
//case 변수1:
//    코드
//case 변수2:
//    코드
//default:
//    코드 or break
//}

//var i = 1
//
//switch i {
//case 0...50:
//    print("1")
//case 51...100:
//    print("2")
//default:
//    print("something else")
//    break
//}

//let name = "임건우"
//
//switch name {
//case "임서준":
//    print("동생")
//case "임혜진":
//    print("누나")
//case "나연경":
//    print("엄마")
//case "임채현":
//    print("아빠")
//default:
//    print("내이름")
//}

//var someChar : Character = "a"
//
//if someChar=="a"||someChar=="e"||someChar=="i"||someChar=="o"||someChar=="u"{
//    print("\(someChar) is a vowel")
//}
//else{
//    print("\(someChar) is a consonant")
//}


//Value binding
//let sAP=(9,0)
//
//switch sAP {
//case (let distance , 0),(0 , let distance):
//    print("On an axis, \(distance)  from the origin")
//default:
//    print("Not on an axis")
//}


//let stillPoint = ( 9, 0)
//
//switch stillPoint {
//case (0...,0):
//    print("On an axis, \(stillPoint)  from the origin")
//case (0,0...):
//    print("On an axis, \(stillPoint)  from the origin")
//default:
//    print("Not on an axis")
//}

//no default case - case 가 true or false, 즉 bool 인 경우

//let isTrue = true
//switch isTrue {
//case true:
//    print("t")
//    //fallthrough
//case false:
//    print("f")
//}

//fallthrough break 기능을 취소하는 명령어
//swift 에서는 switch문에서 break 기능이 기본

//var j:Int=0
//var i:Int=0
//
//for j in i...10{
//    print(j)
//}


//guard문

//func update(age:Int){
//
//    guard 0...100 ~= age,
//    age==100
//
//    else{
//        print("else")
//        return
//    }
//    print("pass")
//}
//
//update(age:1)
//update(age:100)

///*
// ```## Question
// - 두 개의 정수를 입력받아 두 수를 하나로 합친 결과를 출력하는 함수 (1, 5 입력 시 15 반환)
// - 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
// - 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)
// - 여러 등급을 입력받아 그 학점의 평균을 반환해주는 함수
// - 윤년 구하기 (2월 29일이 있는 해.  매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
// - 세 수를 입력받아 세 수의 곱이 양수이면 true , 음수이면 false 반환하는 함수
// - 특정한 달을 숫자로 입력 받아 문자로 반환해주는 함수 (1 = "Jan" , 2 = "Feb")```
//*/
//
//1.
//
//func addNum(_ num1 :Int,_ num2 :Int){
//    print(String(num1) + String(num2))
//}
//addNum(1,2)
//
//2.
//
//func checkStr(_ Str1:String,_ Str2:String){
//    if Str1==Str2{
//        print("true")
//    }
//    else{
//        print("false")
//    }
//}
//checkStr("apple", "e")
//
//3. and 4.
//
//func getGrade(_ score:Double...)->Double{
//    var total=0.0
//
//    for newScore in score{
//        total += newScore
//
//        if newScore>=4.5{
//            print("A+")
//        }
//        else if newScore>=4.0 && newScore<4.5{
//            print("A")
//        }
//        else if newScore>=3.5 && newScore<4.0{
//            print("B+")
//        }
//        else if newScore>=3.0 && newScore<3.5{
//            print("B")
//        }
//        else if newScore>=2.5 && newScore<3.0{
//            print("C+")
//        }
//        else{
//            print("재수강")
//        }
//    }
//    print("평균 학점 : ",total/Double(score.count))
//    return total/Double(score.count)
//}
//getGrade(2.5, 1.0, 4.5, 4.0, 3.0, 3.7, 4.3)
//
//5.
//
//func checkYear(_ year:Int){
//    if year%4==0{
//        if year%100==0{
//            if year%400==0{
//                print("윤년")
//            }
//            else{
//                print("평년")
//            }
//        }
//        else{
//            print("윤년")
//        }
//    }
//    else{
//        print("평년")
//    }
//}
//
//checkYear(196)
//checkYear(200)
//checkYear(400)
//
//6.
//
//func checkNegative(_ num1:Int,_ num2:Int,_ num3:Int)->Bool{
//    var isTrue = true
//
//    if (num1*num2*num3)>=0{
//        isTrue=true
//    }
//    else{
//        isTrue=false
//    }
//    return isTrue
//}
//
//checkNegative(15, -15, -15)
//
//7. 숫자를 달로 리턴해주는 함수
//
//func getNum(_ num:Int)->String{
//    if num==1{
//        
//    }
//    else if num==2{
//        
//    }
//    else if num==3{
//        
//    }
//    else if num==4{
//        
//    }
//    else if num==5{
//        
//    }
//    
//    return "No"
//}







































