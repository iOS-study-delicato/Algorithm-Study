// BOJ 1373 2진수 8진수
// https://www.acmicpc.net/problem/1373
// 22.02.19

import Foundation

let binary = readLine()!.map { $0 }.reversed()

var result: String = ""
var temp: Int = 0

for (i, num) in binary.enumerated() {
    let adjustedIndex = i % 3
    
    if i != 0 && adjustedIndex == 0 {
        result.append(String(temp))
        temp = 0
    }
    
    let val = pow(2.0, Double(adjustedIndex))
    temp += Int(String(num))! * Int(val)
}

result.append(String(temp))

print(result.reversed().map{String($0)}.joined())


