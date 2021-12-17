
// BOJ 1149 RGB거리
// https://www.acmicpc.net/problem/1149
// 21.12.17

let N = Int(readLine()!)!

var costs = Array(repeating: [Int](), count: N + 1)
/*
    R G B
 0| - - -
 1| - - -
 2| - - -
 3| - - -
 
 */

for i in 0...N {
    if i == 0 {
       costs[i] = [0, 0, 0]
    } else {
        let cost = readLine()!.split(separator: " ").map { Int(String($0))! }
        costs[i] = cost
    }
}

/*
    R  G  B
 0| 0  0  0
 1| 26 40 83
 2| 49 60 57
 3| 13 89 99
 
 */

var table = Array(repeating: Array(repeating: 0, count: 3), count: N + 1)

// make table
for row in 1...N {
    table[row][0] = min(table[row - 1][1], table[row - 1][2]) + costs[row][0]
    table[row][1] = min(table[row - 1][0], table[row - 1][2]) + costs[row][1]
    table[row][2] = min(table[row - 1][0], table[row - 1][1]) + costs[row][2]
}

print(table[N].min(by: { $0 < $1 })!)
