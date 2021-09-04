
let userInput1 = readLine()!.split(separator: " ")
let arrayCount = Int(userInput1[0])!
let desiredSum = Int(userInput1[1])!

let numArray = readLine()!.split(separator: " ").compactMap({ (sub) -> Int in
    Int(sub)!
})

var count = 0
var tempSum = 0
var endPointer = 0

for startPointer in 0..<arrayCount {
    while endPointer < arrayCount && tempSum < desiredSum {
        tempSum += numArray[endPointer]
        endPointer += 1
    }
    
    if tempSum == desiredSum {
        count += 1
    }
    
    tempSum -= numArray[startPointer]
}

print(count)

