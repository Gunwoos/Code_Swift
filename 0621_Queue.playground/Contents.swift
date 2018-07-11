//: Playground - noun: a place where people can play

import UIKit


struct CustomQueue{
    var inQueueStack : [Int] = []
    var deQueueStack : [Int] = []
}

var myQueue = CustomQueue()

func InQueue(newData: Int){
    myQueue.inQueueStack.append(newData)
}

func DeQueue(){
    
    myQueue.deQueueStack.popLast()
}
