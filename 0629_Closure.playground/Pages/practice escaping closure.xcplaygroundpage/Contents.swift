//: [Previous](@previous)

import Foundation

typealias voidvoidclosure = () -> Void

let firstClosure: voidvoidclosure = {
    print("Closure A")
}

let secondClosure: voidvoidclosure = {
    print("Closure B")
}

func returnOneClosure(first: @escaping voidvoidclosure , second: @escaping voidvoidclosure, shouldReturnFirstClosure: Bool) -> voidvoidclosure {
    return shouldReturnFirstClosure ? first : second
}

let returnedClosure: voidvoidclosure = returnOneClosure(first: firstClosure, second: secondClosure, shouldReturnFirstClosure: true)

returnedClosure()

var closures: [voidvoidclosure] = []

func appendCLosure(closure: @escaping voidvoidclosure){
    closures.append(closure)
}
//: [Next](@next)
