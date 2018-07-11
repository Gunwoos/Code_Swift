//: Playground - noun: a place where people can play

import UIKit

//protocol Person{
//    var name : String { get }
//    var sex : String { get }
//    var birthday : Int { get }
//    var country : String { get }
//    func greeting()
//}
//
//class chef : Person{
//    func greeting() { }
//    var name : String = ""
//    var sex : String = ""
//    var birthday: Int = 0
//    var country: String = ""
//
//}

//class Person{
//    private var location : String = "seoul"
//
//    func currentLocation(){
//        print(location)
//    }
//    func goToBusan(){
//        location = "Busan"
//    }
//}
//
//let A = Person()
//
//A.currentLocation()
//A.goToBusan()
//A.currentLocation()

//protocol Person{
//    var location : String { get }
//    func currentLoaction()
//    func goToBusan()
//}

//public class newPerson{
//    private var location: String = "seoul"
////  private (set) var location: String = "seoul"
//
//    func currentLoaction() {
//        print(location)
//    }
//
//    func goToBusan() {
//        location = "Busan"
//    }
//}
//
//var A=newPerson()
//
//A.currentLoaction()
//A.goToBusan()
//A.currentLoaction()

//class person{
//    var name : String = "Someone"
//    var age : Int = 21
//    func eat(){
//
//    }
//}
//class student : person{
//    var grade : String = "2"
//    func study(){
//        print("study")
//    }
//}
//class universityStudent : student{
//    var major : String = "computer"
//    func goMt(){
//        print("drinking")
//    }
//
//    func getPerson(){
//        print("\(self.name) \(self.age) \(self.eat()) \(self.grade) \(self.study()) \(self.major) \(self.goMt()) ")
//    }
//}
//
//var newUniversityStudent = universityStudent()
//
//newUniversityStudent.getPerson()


//class animal{
//    var brain : Bool = true
//    var legs : Int = 0
////    init(legs:Int=0){
////        self.legs=legs
////    }
//}
//class human : animal{
////    override init(legs: Int=2) {
////        super.init()
////        self.legs = 2
////    }
//    func setHuman(){
//        self.legs=2
//    }
//}
//class pet : animal{
//    var fleas : Int = 0
//
//    func setPet(){
//        self.legs=4
//    }
//}
//class dog : pet{
//
//    func setDog(){
//        self.brain=true
//        self.legs=4
//        self.fleas=8
//    }
//}
//class cat : pet{
//
//    func setCat(){
//        self.brain=true
//        self.legs=4
//        self.fleas=4
//    }
//}
//
//var newHuman=human()
//newHuman.setHuman()
//var newDog=dog()
//newDog.setDog()
//var newCat=cat()
//newCat.setCat()
//
//print(newCat.brain, newCat.fleas, newCat.legs)



class dog{
    func bark() {
        print("멍멍")
    }
}

class poodle: dog{
    override func bark() {
        print("왈왈")
    }
}
class husky:dog{
    override func bark() {
        super.bark()
    }

}



// 하위 클래스에서 super.하위클래스메소드 사용시 상위 클래스에 있는 메소드가 실행됨
































