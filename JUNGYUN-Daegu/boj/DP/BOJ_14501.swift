
// BOJ 14501 퇴사
// https://www.acmicpc.net/problem/14501
// 22.01.08


import Foundation

let N = Int(readLine()!)!

var times: [Int] = []
var prices: [Int] = []

for _ in 0..<N {
    let m = readLine()!.split(separator: " ").map { Int($0)! }
    
    times.append(m.first!)
    prices.append(m.last!)
}

var dp = Array(repeating: 0, count: N)

func reachable(from day1: Int, to day2:Int) -> Bool {
    
    if day1 == day2 {
        return true
    } else if day2 - day1 >= times[day1] {
        return true
    } else {
        return false
    }
}


for i in 0..<N {
    
    var validPrice: Int = prices[i]
    
    if i + times[i] > N {
        validPrice = 0
    }
    
    for j in 0...i {
        guard reachable(from: j, to: i) else { continue }

        if i == j {
            dp[i] = max(dp[i], validPrice)
        } else {
            dp[i] = max(dp[i], validPrice + dp[j])
        }
        
    }
}

print(dp.max()!)
