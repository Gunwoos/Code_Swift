//: Playground - noun: a place where people can play

import UIKit

/*------------------------------------------------------------------------------------------------
 06/22 금요일 과제
 
 2개의 스택을 이용해서 하나의 큐를 구현.
 즉, 스택 구조를 이용하여 저장하고 출력하되, 큐 구조를 사용하듯 FIFO(First In, First Out)로 동작하도록 해야 한다.
 
 프로퍼티 - size,  list,
 메서드 - enqueue(), dequeue()
 -------------------------------------------------------------------------------------------------*/

class Queue {
    var size = 0
    // list를 어디에 사용해야하는지 모르겠음
    var list: Queue?
    
    var stack1: [Int] = []
    var stack2: [Int] = []
    
    // enqueue
    func enqueue(_ value: Int) {
        stack1.append(value)
        print("[enqueue] push value : \(value) \t|\t current Quque : \(stack1)")
        size += 1
    }
    
    // 한 개 dequeue
    func dequeue() {
        guard !stack1.isEmpty else {
            return print("[Error] Queue is Empty")
        }
        
        while !stack1.isEmpty {
            stack2.append(stack1.popLast()!)
        }
        print("[dequeue] pop value : \(stack2.popLast()!)", terminator: "\t\t|\t")
        while !stack2.isEmpty {
            stack1.append(stack2.popLast()!)
        }
        print(" current Queue : \(stack1)")
        size -= 1
        
    }
    
    // 큐 전체 dequeue
    func dequeueAll() {
        guard !stack1.isEmpty else {
            return print("[Error] Queue is Empty")
        }
        
        for index in (0...stack1.count - 1).reversed() {
            stack2.append(stack1[index])
        }
        
        while !stack2.isEmpty {
            stack1.remove(at: stack1.startIndex)
            print("[dequeueAll] pop value : \(stack2.popLast()!) \t|\t current Queue : \(stack1)")
        }
        print("[dequeueAll] Finish \t\t|\t current Queue : \(stack1)")
        size = 0
        
    }
    
    // 큐 사이즈 출력
    func sizeOfQueue() {
        print("[Size] Queue Size : \(size)")
    }
    
    // 현재 큐 출력
    func listOfQueue() {
        print("[List] Queue List : \(stack1)")
    }
    
}

var queue = Queue()
print("------------------------------[  초기값  ]------------------------------")
queue.listOfQueue()
queue.sizeOfQueue()
print("\n------------------------------[ enqueue ]------------------------------")
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)
queue.enqueue(5)
print("\n----------------------------[ size & list ]----------------------------")
queue.listOfQueue()
queue.sizeOfQueue()
print("\n------------------------------[ dequeue ]------------------------------")
queue.dequeue()
queue.dequeue()
queue.dequeue()
queue.dequeue()
queue.enqueue(6)
queue.dequeue()
queue.dequeue()
print("\n----------------------------[ size & list ]----------------------------")
queue.listOfQueue()
queue.sizeOfQueue()
print("\n------------------------------[ dequeue ]------------------------------")
queue.dequeue()
print("\n------------------------------[ enqueue ]------------------------------")
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)
queue.enqueue(5)
print("\n----------------------------[ size & list ]----------------------------")
queue.listOfQueue()
queue.sizeOfQueue()
print("\n----------------------------[ dequeueAll ]----------------------------")
queue.dequeueAll()
print("\n----------------------------[ size & list ]----------------------------")
queue.listOfQueue()
queue.sizeOfQueue()
print("\n----------------------------[ dequeueAll ]----------------------------")
queue.dequeueAll()

