//: [Previous](@previous)
/*:
 ---
 # print, debugPrint, dump
 ---
 */

print("\n---------- [ double ] ----------\n")
print(Double(99.99))
debugPrint(Double(99.99))
dump(Double(99.99))

print("\n---------- [ string ] ----------\n")
print("string")
debugPrint("string")
dump("string")

print("\n---------- [ array ] ----------\n")
print([1,2,3,4])
debugPrint([1,2,3,4])
dump([1,2,3,4])

print("\n---------- [ dict ] ----------\n")
print(["a": 1, "b": 2, "c":3])
debugPrint(["a": 1, "b": 2, "c":3])
dump(["a": 1, "b": 2, "c":3])

print("\n---------- [ print ] ----------\n")
let str = "myString"
print(str, "hello", "world", separator: " ", terminator: "\n")
print(str, "hello", "world", separator: "/", terminator: "!!!\n")
print(str, "hello", "world", separator: "-", terminator: ">>>\n")
print(str, "hello", "world", separator: "()", terminator: "]]]]] ")
print("world agin")

var textStream = "hello"
print(" world", to: &textStream)

print(textStream)

//: [Next](@next)
