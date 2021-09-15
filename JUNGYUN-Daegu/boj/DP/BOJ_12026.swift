// 백준 12026 BOJ 거리
// https://www.acmicpc.net/problem/12026
// 21.09.16

let n = Int(readLine()!)!
let blocks = Array(readLine()!)
var cost = Array(repeating: 1_000_001, count: n)
cost[0] = 0

func previousPosition(before currentPosition: String.Element) -> String.Element {
    switch currentPosition {
    case "B": return "J"
    case "O": return "B"
    case "J": return "O"
    default:
    print("prev position error")
    return "X"
    }
}


for i in 1..<n {
    let prev = previousPosition(before: blocks[i])
    
    for j in 0..<i {
        if prev == blocks[j] {
            let newCost = min(cost[i], cost[j] + (i-j)*(i-j))
            cost[i] = newCost
        }
    }
}

if cost[n - 1] == 1_000_001 {
    print(-1)
} else {
    print(cost[n - 1])
}
