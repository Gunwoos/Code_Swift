//: [Previous](@previous)
//: # etc
//: ## (enumerated, sorted, reversed)

print("\n---------- [ enumerated ] ----------\n")

for (idx, num) in [5,1,2,4,3].enumerated() {
  print(idx, num)
}

print("\n---------- [ sorted ] ----------\n")

for (idx, num) in [5,1,2,4,3].sorted().enumerated() {
  print(idx, num)
}

print("\n---------- [ reversed ] ----------\n")

for (idx, num) in [5,1,2,4,3].sorted().enumerated().reversed() {
  print(idx, num)
}

//: [Next](@next)
