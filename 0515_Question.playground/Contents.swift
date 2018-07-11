//: Playground - noun: a place where people can play

import UIKit


// 1 - 두 개의 정수를 입력받아 두 수를 하나로 합친 결과를 출력하는 함수 (1, 5 입력 시 15 반환)

func addNum(num1:Int,num2:Int)->String{
    return "\(num1)"+"\(num2)"
}

//print(addNum(num1: 1, num2: 5))

// 2 - 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수

func checkString(str1:String,str2:String)->Bool{
    var isBool = true
    if str1==str2{
        isBool=true
        return isBool
    }
    else{
        isBool=false
        return isBool
    }
}

// 3 - 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)

func getScore(_ score:Double...)->String{
    
    for index in score{
        guard 0...4.5 ~= index else{return ""}
        switch index {
        case 4.5:
            print ("A+")
        case 4.0..<4.5:
            print ("A")
        case 3.5..<4.0:
            print ("B+")
        case 3.0..<3.5:
            print ("B")
        case 2.5..<3.0:
            print ("C+")
        default:
            print("재수강")
        }
    }
    
  return ""
}

//getScore(4.5, 4.0, 3.5, 4.1, 3.9)

// 4 - 여러 등급을 입력받아 그 학점의 평균을 반환해주는 함수

func getGrade(_ grade:String...)->Double{
    var sum=0.0
    for index in grade{
        switch index {
        case "A+":
            sum += 4.5
        case "A":
            sum += 4.0
        case "B+":
            sum += 3.5
        case "B":
            sum += 3.0
        case "C+":
            sum += 2.5
        case "C":
            sum += 2.0
        case "D+":
            sum += 1.5
        case "D":
            sum += 1.0
        case "F+":
            sum += 0.5
        case "F":
            sum += 0.0
        default:
            break
        }
    }
    return sum/Double(grade.count)
}

//getGrade("A+","A","A+")


// 5 - 윤년 구하기 (2월 29일이 있는 해.  매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)

func checkYear(_ year : Int)->String{
    if year%400==0{
        if year%100==0{
            if year%4==0{
                return "윤년"
            }
        }
    }
    return "평년"
}

//checkYear(3)
//checkYear(200)
//checkYear(100)
//checkYear(800)


// 6 - 세 수를 입력받아 세 수의 곱이 양수이면 true , 음수이면 false 반환하는 함수

func checkNegative(_ num1:Int,_ num2:Int,_ num3:Int)->Bool{
    var isTrue = true
    if num1*num2*num3 > 0 {
        isTrue=true
    }
    else{
        isTrue=false
    }
    
    return isTrue
}

//checkNegative(10, -10, 10)



// 7 - 특정한 달을 숫자로 입력 받아 문자로 반환해주는 함수 (1 = "Jan" , 2 = "Feb")```

func checkMon(_ num:Int)->String{
    
    guard 1...12 ~= num else{ return ""}
    
    return ""
}


//
// 1 - 1 ~ 9 사이의 숫자를 입력받아 해당 숫자에 해당하는 구구단의 내용을 출력하는 함수
// 2 - 정수 하나를 입력받아 그 수의 Factorial 을 구하는 함수
// 3 - 정수 두개를 입력받아 첫 번째 수를 두 번째 수의 횟수만큼 곱한 값을 반환하는 함수
// 4 - 정수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
// 5 - 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
// 6 - 정수 하나를 입력받아 그 정수의 약수를 모두 출력하는 함수
// 7 - 2 이상의 정수를 입력받아, 소수인지 아닌지를 판별하는 함수
// 8 - 정수를 입력받아 입력받은 수에 해당하는 자리의 피보나치 숫자를 반환하는 함수```
