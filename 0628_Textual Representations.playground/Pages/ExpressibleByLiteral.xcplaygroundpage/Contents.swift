//: [Previous](@previous)
/*:
 ---
 # ExpressibleByLiteral
 ---
 */

struct NameCompounder: ExpressibleByStringLiteral {
  typealias StringLiteralType = String
  
  let familyName: String = "장"
  let fullName: String
  
  init(stringLiteral value: StringLiteralType) {
    fullName = familyName + value
  }
}


let name: NameCompounder = "동건"
name.fullName
print(name)
print(type(of: name))



//: [Next](@next)
