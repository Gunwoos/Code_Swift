//: Playground - noun: a place where people can play

import UIKit

class CustomQueue<Element>{
    var EnqueueStack = [Element]()
    var DequeueStack = [Element]()
    
    func Enqueue(_ newValue : Element){
        if DequeueStack.isEmpty{
            EnqueueStack.append(newValue)
        }
        else{
            while DequeueStack.isEmpty != true {
                EnqueueStack.append(DequeueStack.popLast()!)
            }
            EnqueueStack.append(newValue)
        }
    }
    func Dequeue(){
        if EnqueueStack.isEmpty{
            DequeueStack.popLast()
        }
        else{
            while EnqueueStack.isEmpty != true {
                DequeueStack.append(EnqueueStack.popLast()!)
            }
            DequeueStack.popLast()
        }
    }
}

var myCustomQueue = CustomQueue<Int>()


myCustomQueue.Enqueue(1)
myCustomQueue.EnqueueStack
myCustomQueue.DequeueStack
myCustomQueue.Enqueue(2)
myCustomQueue.EnqueueStack
myCustomQueue.DequeueStack
myCustomQueue.Dequeue()
myCustomQueue.EnqueueStack
myCustomQueue.DequeueStack
myCustomQueue.Enqueue(3)
myCustomQueue.EnqueueStack
myCustomQueue.DequeueStack
myCustomQueue.Dequeue()
myCustomQueue.EnqueueStack
myCustomQueue.DequeueStack

var myCustomQueue2 = CustomQueue<String>()


myCustomQueue2.Enqueue("1")
myCustomQueue2.EnqueueStack
myCustomQueue2.DequeueStack
myCustomQueue2.Enqueue("2")
myCustomQueue2.EnqueueStack
myCustomQueue2.DequeueStack
myCustomQueue2.Dequeue()
myCustomQueue2.EnqueueStack
myCustomQueue2.DequeueStack
myCustomQueue2.Enqueue("3")
myCustomQueue2.EnqueueStack
myCustomQueue2.DequeueStack
myCustomQueue2.Dequeue()
myCustomQueue2.EnqueueStack
myCustomQueue2.DequeueStack
