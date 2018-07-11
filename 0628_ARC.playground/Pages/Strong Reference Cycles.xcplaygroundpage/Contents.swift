//: [Previous](@previous)
/*:
 ---
 # Strong Reference Cycles
 ---
 */

class Person {
  var pet: Dog?
  func doSomething() {}
  deinit {
    print("Person is being deinitialized")
  }
}

class Dog {
  var owner: Person?
  func doSomething() {}
  deinit {
    print("Dog is being deinitialized")
  }
}



var giftbot: Person! = Person()
var tori: Dog! = Dog()

giftbot.pet = tori
tori.owner = giftbot

giftbot.doSomething()
tori.doSomething()

giftbot.pet = nil
giftbot = nil
tori.owner = nil
tori = nil

/*:
 ---
 ### Question
 - 두 객체를 메모리에서 할당 해제해보세요.
 ---
 */


//: [Next](@next)
