//: Playground - noun: a place where people can play

import UIKit

//class Dog{
//    var color: String = "black"  // 값을 입력해주면 디폴트 값으로 들어감
//    var eyeColor:String!  // 디폴트 값을 주기 싫으면 타입형 뒤에 ! 붙이기
//    var height: Double!
//    var weight : Double!
//
//    func sit(){
//        print("sit")
//    }
//    func layDown(){
//        print("layDown")
//    }
//    func shake(){
//        print("shake")
//    }
//}

//let bobby: Dog = Dog()
//bobby.sit()
//
//print(bobby.color)
//
//let kermit: Dog = Dog()
//kermit.color="green"
//kermit.eyeColor="black"
//kermit.height=40.0
//kermit.weight=2.0
//kermit.shake()
//
//let bin : Dog = Dog()
//bin.color = "yello"
//bin.layDown()

// Q. 클래스를 왜 바로 사용할 수 없을까?

// A. 클래스는 지금 구조만 있는 상태로 object로 실체화, 즉 선언 되지 않았기 때문에

// 클래스 끼리는 비교할 수 없음, 비교하면 주소값을 비교하기 때문
// ex)  bin == boddy
// 내부적으로 비교 메소드를 만들지 않는 이상 클래스 명 자체로 비교하는 것은 불가
// struct 랑 enum 도 마찬가지

// struct, enum => Stack  구조적으로 설계를 스텍에 저장하게 함
// class => Heap

// Class Initialize 클래스 초기화

// 초기화 메소드

// 초기값 설정시 init 메소드 필요 없음


//class Dog2{
//    let name: String
//    let color: String
//
//    init(){
//        name = "Tori"
//        color = "Brown"
//    }
//    init(name: String) {
//        self.name = name
//        color = "Brown"
//    }
//    init(name: String, color: String){
//        self.name = name
//        self.color = color
//    }
//}
//
//let tori2 = Dog2()
//
//tori2.color
//tori2.name


//class student{
//    let name: String
//    let sex: String
//
//    init(_ name:String,_ sex:String) {
//        self.name=name
//        self.sex=sex
//    }
//
//    func study(){
//        print("\(name) is studing")
//    }
//    func sleep(){
//        print("\(name) is sleeping")
//    }
//}
//let stu1=student("dean","male")
//let stu2=student("lily","female")
//
//stu1.study()
//stu2.sleep()

//lazy
//1. 등록 정보의 초기 값이 인스턴스의 초기화가 완료 될 때까지 값을 알 수 없는 외부 요인에 의존 할 때
//2. 속성의 초기 값이 복잡하거나 계산 비용이 많이 드는 설정을 필요로 할 때
//3. 필요한 경우가 제한적 일 때


//class Quadrangle{
//    var width : Int
//    var height : Int
//
//    init() {
//        self.width=0
//        self.height=0
//    }
//    init(_ width : Int,_ height : Int) {
//        self.width = width
//        self.height = height
//    }
//    func setDimension(_ width : Int,_ height : Int) {
//        self.width = width
//        self.height = height
//    }
//    func printWidth()->Int{
//        return self.width
//    }
//    func printHeight()->Int{
//        return self.height
//    }
//
//    func printArea()->Int{
//        return self.height*self.width
//    }
//}
//
//var newRectangle = Quadrangle(10, 5)
//var newRectangle2 = Quadrangle(7, 7)
//
//
//newRectangle.printHeight()
//newRectangle.printWidth()
//newRectangle.printArea()
//
//newRectangle2.printHeight()
//newRectangle2.printWidth()
//newRectangle2.printArea()

class TV{
    var channel : Int
    var volume : Int
    var power : Bool

    init() {
        self.channel = 7
        self.volume = 10
        self.power = false
    }

    func powerOn(power : Bool){
        self.power = power
    }
    func powerOff(power : Bool){
        self.power = power
    }
    func checkPower()->Bool{
        return self.power
    }
    func checkChannel()->Int{
        if checkPower()==true{
            return self.channel
        }
        else{
            return 0
        }
    }
    func upChannel(){
        if checkPower()==true{
            self.channel += 1
        }
    }
    func downChannel(){
        if checkPower()==true{
            self.channel -= 1
        }
    }
    func checkVolume()->Int{
        if checkPower()==true{
            return self.volume
        }
        else{
            return 0
        }
    }
    func upVolume(){
        //if checkPower()==true{
        guard checkPower()==true else { return }
            guard self.volume<10 else { print("max volume"); return }
            self.volume += 1
            
            
//            if self.volume<100{
//                self.volume += 1
//            }
//            else{
//                print("max volume")
//            }
    }
    func downVolume(){
        if checkPower()==true{
            if self.volume>0{
                self.volume -= 1
            }
            else{
                print("min volume")
            }
        }
    }
    func muteVolume(){
        if checkPower()==true{
            self.volume = 0
        }
    }
}

var MyTV = TV()

MyTV.power

MyTV.powerOn(power: true)

MyTV.checkPower()

MyTV.checkChannel()

MyTV.checkVolume()

MyTV.upVolume()


//class square{
//    var width : Int
//    var height : Int
//
//    init() {
//        self.width = 0
//        self.height = 0
//    }
//
//    func setSquare(w : Int, h : Int){
//        self.width = w
//        self.height = h
//    }
//
//    func getArea()->Int{
//        return self.width * self.height
//    }
//
//    func getPerimeter()->Int{
//        return (self.width*2) + (self.height*2)
//    }
//}
//var newSquare=square()
//newSquare.setSquare(w: 10, h: 7)
//newSquare.getArea()
//newSquare.getPerimeter()

//class circle{
//    var radius : Double
//
//    init() {
//        self.radius = 0.0
//    }
//
//    func setCircle(_ r : Double){
//        self.radius = r
//    }
//
//    func getArea()->Double{
//        return self.radius * self.radius * 3.14
//    }
//
//    func getCircumference()->Double{
//        return 2 * 3.14 * self.radius
//    }
//}
//
//var newCircle = circle()
//newCircle.setCircle(2.0)
//newCircle.getArea()
//newCircle.getCircumference()








































