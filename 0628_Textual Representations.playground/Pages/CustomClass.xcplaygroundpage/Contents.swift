//: [Previous](@previous)
/*:
 ---
 # Custom Class
 ---
 */

final class Dog {
  let name = "Tori"
  let age = 1
}

let dog = Dog()
print(dog)
print(String(describing: dog))
debugPrint(dog)
dump(dog)


extension Dog : CustomStringConvertible, CustomDebugStringConvertible{
    var description: String{
        return "\(self.name) \(self.age)"
    }
    var debugDescription: String{
        return "myDebugDescription"
    }
}

print(dog.description)
print(dog.debugDescription)
//: [Next](@next)
