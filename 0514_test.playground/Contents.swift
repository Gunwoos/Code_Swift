//: Playground - noun: a place where people can play

import UIKit

/* 1,2,3
func getName(_ name:String)->String{
    return name
}
getName("gw")

func getAge(_ age:Int)->Int{
    return age
}
getAge(24)

func introduce(_ name:String,_ age:Int){
    print("이름 : " + getName(name) + " 나이 : ",getAge(age))
}

introduce("gw", 24)
*/

//4.
//func getNum(_ num:Int){
//    var check:Int;
//    check=num%2
//    check == 1 ? print("홀수") : print("짝수")
//}
//getNum(8)

//
////5  변수 값을 명시한 경우
//func getMul(_ num1:Int=10,newNum2 num2:Int){
//    print(num1*num2)
//}
//getMul(newNum2:10)


/* 5_2 변수를 명시하지 않은 경우
func getMul(_ num1:Int,_ num2:Int=10){
    print(num1*num2)
}
getMul(10)
*/



//6. 4개의 시험점수를 받아 평균 값

func averageTest(_ num:Double...)->Double{
    var sum:Double=0.0
    
    for i in num{
        sum += i
    }
    
    return sum/Double(num.count)
}
averageTest(90.5, 93.1, 56.9, 100)





















