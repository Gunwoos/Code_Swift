//: [Previous](@previous)
/*:
 # Type Casting
 ---
 1) as  : 타입 변환이 확실하게 가능한 경우(업캐스팅, 자기 자신 등) 에만 사용 가능. 그 외에는 컴파일 에러
 2) as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
 3) as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생
 ---
 */

import UIKit

class Shape {
  var color = UIColor.black
  
  func draw() {
    print("draw shape")
  }
}

class Rectangle: Shape {
  var cornerRadius = 0.0
  
  override func draw() {
    print("draw rect")
  }
}

class Triangle: Shape {
  override func draw() {
    print("draw triangle")
  }
}

class Circle: Shape {
  var radius = 50.0
  
  override func draw() {
    print("draw circle")
  }
}
class newRectangle : Rectangle {
    
}

let shape = Shape()
let rectangle = Rectangle()
let triangle = Triangle()
let circle = Circle()


/*:
 ---
 ## Upcasting
 ---
 */
let shape1: Shape = Shape()
let rectangle1: Shape = Rectangle()
let triangle1: Shape = Triangle()
let circle1: Shape = Circle()


let rect = Rectangle()
//rect.color
//rect.cornerRadius

let upcastedRect: Shape = Rectangle()
//upcastedRect.color
//upcastedRect.cornerRadius

//shape1 as? Rectangle


/*:
 ---
 ## Downcasting
 ---
 */

//let downcastedRect: Rectangle = upcastedRect

// 위와 아래 코드의 차이는?

//let downcastedRect: Rectangle = upcastedRect as! Rectangle
let downcastedRect: Rectangle? = upcastedRect as? Rectangle
//let downcastedRect: Rectangle = (upcastedRect as? Rectangle)!
//downcastedRect.color
//downcastedRect.cornerRadius


// 옵셔널 바인딩
//if let downcastedRect = upcastedRect as? Rectangle {
//
//}




let val = 1
//print(val as Float)   // Compile Error 발생
//print(val as? Float)  // nil
//print(val as! Float)  // Runtime Error 발생



/*:
 ### Type Check Operator
 */


let list = [shape, rectangle, triangle, circle]

for elem in list {
  if elem is Shape {         // always true
    print("shape instance")
  } else if elem is Rectangle {
    print("rect instance")
  } else if elem is Triangle {
    print("triangle instance")
  } else if elem is Circle {
    print("circle instance")
  }
}

print("\n---------- [ = ] ----------\n")

for elem in list {
  elem.draw()
}





/***************************************************
 정리
 
 업 캐스팅
 - 상속 관계에서 수퍼 클래스로의 변환 및 자기 자신의 타입으로 변환하는 것은 반드시 수행 가능
 - 이것을 업캐스팅이라 하며 as 키워드 사용 가능
 e.g.
 let someone: Student = Student()
 let human: Human = someone as Human
 
 다운 캐스팅
 - 형제 클래스나 다른 서브 클래스 등 수퍼 클래스에서 파생된 각종 서브 클래스로의 타입 변환 의미
 - 반드시 성공한다는 보장이 없으므로 as? 또는 as! 를 사용
 e.g.
 let someone = Student()
 let student1 = someone as? Student   // Optional(Student)
 let student2 = someone as! Student   // Student
 let baby1 = someone as? Baby         // nil
 let baby2 = someone as! Baby         // Runtime Error
 ***************************************************/






//: [Next](@next)
