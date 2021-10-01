// BOJ 1731 추론
// https://www.acmicpc.net/problem/1731
// 21.10.01

import Foundation

let N = Int(readLine()!)! // length numbers
var P: Int? = nil
var Q1: Int? = nil // 등차 수열 인자
var Q2: Int? = nil // 등비 수열 인자
var lastNum: Int? = nil

for i in 0..<N {
    let input = Int(readLine()!)!
    
    if i == N - 1 {
        lastNum = input
    }
    
    if (Q1 != nil && Q2 == nil) || (Q1 == nil && Q2 != nil) {
        continue
        
    } else if i == 0 {
        P = input
        
    } else if i == 1 {
        Q1 = input - P!
        Q2 = input / P!
        
    } else if i == 2 {
        var tempQ: Int {
            var result = 1
            for _ in 0..<i {
                result *= Q2!
            }
            return result
        }
        
        if input - (Q1! * i) == P && input / tempQ == P {
            continue
        } else if input - (Q1! * i) == P {
            Q2 = nil
            continue
        } else {
            Q1 = nil
            continue
        }
    }
}


if Q2 == nil {
    print(lastNum! + Q1!)
} else {
    print(lastNum! * Q2!)
}


