//: Playground - noun: a place where people can play

import UIKit

var a = [5,1,7,3,86,123,776,443,3,2]

a.map({ (num:Int) -> Int in
    return num + 1
})


a.filter({(num:Int) -> Bool in
    return num%2==0
})

a.reduce(0, { (first : Int, second : Int) -> Int in
    return first + second
})


var b = [1,2,3,4,5,6,7,8,9]

b.forEach({(num:Int) in
    print("3 * \(num) = \(3*num)")
})


var test : Array<[Int?]> = [[1,2,3], [nil, 4] , [nil] ,[5, nil]]


