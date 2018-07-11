//: Playground - noun: a place where people can play

import UIKit

//Variadic Parameters 함수에 같은 타입의 변수를 하나만 선언하여 하나 이상 받기 위함

func arithmeticMean(_ numbers:Double...)->Double{
    var total=0.0
    for number in numbers{
        total += number
    }
    return total/Double(numbers.count)
}

print(arithmeticMean(1,2,3,4,5))

arithmeticMean(0.5, 1.0, 1.5)


/*
func addName(_ name: String...){
    var name = name;
    type(of: name);
   // name = name + "hello";
    print(name)
}
addName("t","j")
*/


func say(word: String)->Void{
    print(word)
}



