//: # Basic Codable
import Foundation


struct Dog: Codable {
  let age: Int
  let name: String
  
  //  private enum CodingKeys: String, CodingKey {
  //    case age
  //    case name
  //  }
  //
  //  init(from decoder: Decoder) throws {
  //    let values = try decoder.container(keyedBy: CodingKeys.self)
  //    age = try values.decode(Int.self, forKey: .age)
  //    name = try values.decode(String.self, forKey: .name)
  //  }
  //
}


func basic() {
  print("\n---------- [ basic ] ----------\n")
  let jsonData = """
  {
    "age": 3,
    "name": "Tory"
  }
  """.data(using: .utf8)!
  
  // JSONSerialization
//  let dog1 = try! JSONSerialization.jsonObject(with: jsonData)
//    let jsonObject = try! JSONSerialization.jsonObject(with: jsonData) as! [String:Any]
//    let dog1 = Dog(age: jsonObject["age"] as! Int, name: jsonObject["name"] as! String)
//
//  print(dog1)
//    dog1.age
    
//  print(dog1.age)   // error
  
  /***************************************************
   JSONSerialization 을 이용해 dog 객체를 생성해보세요.
   ***************************************************/
  

  // Codable
//  let dog2 = try! JSONDecoder().decode(Dog.self, from: jsonData)
//  print(dog2)
}


func array() {
  print("\n---------- [ array ] ----------\n")
  let jsonData = """
  [
    {
      "age": 3,
      "name": "Tory"
    },
    {
      "age": 3,
      "name": "Tory"
    }
  ]
  """.data(using: .utf8)!
  
  // JSONSerialization
  let jsonObject = try! JSONSerialization.jsonObject(with: jsonData) as! [[String: Any]]
  let first = jsonObject.first!
  print(Dog(age: first["age"] as! Int, name: first["name"] as! String))
  
  // Codable
  let dogs = try! JSONDecoder().decode([Dog].self, from: jsonData)
  dogs.forEach { print($0) }
}


func dictionary() {
  print("\n---------- [ dictionary ] ----------\n")
  let jsonData = """
  {
    "first": {
      "age": 3,
      "name": "Tory"
    },
    "second": {
      "age": 4,
      "name": "Tory"
    }
  }
  """.data(using: .utf8)!
  
  // JSONSerialization
  let dogs1 = try! JSONSerialization.jsonObject(with: jsonData) as! [String: [String: Any]]
  let first = dogs1["first"]!
  print(Dog(age: first["age"] as! Int, name: first["name"] as! String))
  
  // Codable
  let dogs = try! JSONDecoder().decode([String: Dog].self, from: jsonData)
  dogs.forEach { print($0, $1) }
}

//basic()
//array()
//dictionary()

//: [Table of Contents](@Contents) | [Previous](@previous) | [Next](@next)
