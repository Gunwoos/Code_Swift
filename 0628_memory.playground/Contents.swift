//: Playground - noun: a place where people can play

import UIKit

class Point{
    var refCount = 0
    var x = 0.0
    var y = 0.0
    
}

var point1 = Point()
var point2 = point1

point2.x = 5.0

print(point1.x)
