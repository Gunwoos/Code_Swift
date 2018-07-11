//: [Previous](@previous)
import Foundation
/*:
 # UserDefaults
 - iOS 에서 데이터를 파일에 저장하기 위해 사용하는 대표적인 클래스 중 하나
 - 간단한 정보를 저장하고 불러올 때 사용하며 내부적으로 pList 파일로 저장
 */

//let userDefault = UserDefaults.init()
let userDefaults = UserDefaults.standard

var intkey = 10
intkey

UserDefaults.standard.set(10, forKey: "IntKey")
UserDefaults.standard.integer(forKey: "IntKey")

UserDefaults.standard.set(3.14, forKey: "Double Pi")
UserDefaults.standard.double(forKey: "Double Pi")

UserDefaults.standard.set(true , forKey: "Bool Key")
UserDefaults.standard.double(forKey: "Bool Key")


//UserDefaults.standard.set(<#T##url: URL?##URL?#>, forKey: <#T##String#>)
//UserDefaults.standard.url(forKey: <#T##String#>)



//
//let userDefaults = UserDefaults.standard
print(userDefaults)


print("\n---------- [ dictionaryRepresentation ] ----------\n")
userDefaults.dictionaryRepresentation()

print("\n---------- [ keys ] ----------\n")
print(Array(UserDefaults.standard.dictionaryRepresentation().keys))

print("\n---------- [ values ] ----------\n")
print(Array(UserDefaults.standard.dictionaryRepresentation().values))



//: [Next](@next)
