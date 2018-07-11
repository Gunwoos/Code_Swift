//: [Previous](@previous)

import Foundation

struct CustomQueue {
    var list: [String] {
        mutating get {
            if !popStack.isEmpty {
                for _ in 0...popStack.count-1 {
                    pushStack.append(popStack.popLast()!)
                }
            }
            return pushStack
        }
    }
    
    var size: Int {
        return pushStack.count + popStack.count
    }
    
    var pushStack: [String]  = []
    var popStack: [String] = []
    
    mutating func enqueue(value: String) {
        if !popStack.isEmpty {
            for _ in 0...popStack.count-1 {
                pushStack.append(popStack.popLast()!)
            }
        }
        pushStack.append(value)
    }
    
    mutating func dequeue() -> String?{
        if !pushStack.isEmpty {
            for _ in 0...pushStack.count-1 {
                popStack.append(pushStack.popLast()!)
            }
        }
        return popStack.popLast()
    }
    
}
