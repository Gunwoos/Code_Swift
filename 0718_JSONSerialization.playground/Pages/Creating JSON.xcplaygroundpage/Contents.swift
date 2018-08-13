//: [Previous](@previous)
import Foundation
//: - - -
//: # Creating JSON Data
//: * class func isValidJSONObject(_:) -> Bool
//: * class func writeJSONObject(_:to:options:error:) -> Int
//: * class func data(withJSONObject:options:) throws -> Data
//: - - -

//: ---
//: ## Write JSON Object to OutputStream
//: ---
func writeJSONObjectToOutputStream() {
  let jsonObject = ["hello": "world", "foo": "bar", "iOS": "Swift"]
  guard JSONSerialization.isValidJSONObject(jsonObject) else { return }
  
  let jsonFilePath = "myJsonFile.json"
  let outputJSON = OutputStream(toFileAtPath: jsonFilePath, append: false)!
  outputJSON.open()
  _ = JSONSerialization.writeJSONObject(
    jsonObject,
    to: outputJSON,
    options: [.prettyPrinted, .sortedKeys],
//    options: [],
    error: nil
  )
  outputJSON.close()
  
  do {
    let jsonString = try String(contentsOfFile: jsonFilePath)
    print(jsonString)
  } catch {
    print(error.localizedDescription)
  }
}

//print("\n---------- [ writeJSONObjectToOutputStream ] ----------\n")
//writeJSONObjectToOutputStream()

//: ---
//: ## Data with JSON Object
//: ---
private func dataWithJSONObject() {
  let jsonObject1: [String: Any] = [
    "someNumber" : 1,
    "someString" : "Hello",
    "someArray"  : [1, 2, 3, 4],
    "someDict"   : [
      "someBool" : true
    ]
  ]
  let jsonObject2 = [
    "hello": "world",
    "foo": "bar",
    "iOS": "Swift",
    "1": "2"
  ]
  
  guard JSONSerialization.isValidJSONObject(jsonObject1),
    JSONSerialization.isValidJSONObject(jsonObject2)
    else { return }
  
  do {
    let encoded = try JSONSerialization.data(withJSONObject: jsonObject1)
//    let encoded = try JSONSerialization.data(withJSONObject: jsonObject2)
    let decoded = try JSONSerialization.jsonObject(with: encoded)
    if let jsonDict = decoded as? [String: Any] {
      print(jsonDict)
    }
  } catch {
    print(error.localizedDescription)
  }
}

//print("\n---------- [ dataWithJSONObject ] ----------\n")
//dataWithJSONObject()



//: - - -
//: # Creating a JSON Object
//: * class func jsonObject(with:options:) throws -> Any
//: - - -

//: ---
//: ## JSON Object with Data
//: ---
private func jsonObjectWithData() {
  let jsonString =  """
  {
    "someNumber" : 1,
    "someString" : "Hello",
    "someArray"  : [1, 2, 3, 4],
    "someDict"   : {
      "someBool" : true
    }
  }
  """
//  let jsonString = """
//     { "hello": "world", "foo": "bar", "iOS": "Swift" }
//  """
  let jsonData = jsonString.data(using: .utf8)!

  do {
    let foundationObject = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
    if let jsonDict = foundationObject as? [String: Any] {
      print(jsonDict)
    }
  } catch {
    print(error.localizedDescription)
  }
}

print("\n---------- [ jsonObjectWithData ] ----------\n")
jsonObjectWithData()

//: ---
//: ## JSON Object with InputStream
//: ---
private func jsonObjectWithInputStream() {
  let jsonFilePath = "myJsonFile.json"
  let inputStream = InputStream(fileAtPath: jsonFilePath)!
  inputStream.open()
  defer { inputStream.close() }
  
  guard inputStream.hasBytesAvailable else { return }
  
  do {
    let jsonObject = try JSONSerialization.jsonObject(with: inputStream)
    print(jsonObject)
  } catch {
    print(error.localizedDescription)
  }
}

print("\n---------- [ jsonObjectWithInputStream ] ----------\n")
jsonObjectWithInputStream()

//: [Next](@next)
