// 백준 12851 숨바꼭질 2
// https://www.acmicpc.net/problem/12851
// 21.08.26

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
var n = nk.first!
let k = nk.last!

var visited = Array(repeating: false, count: 100_001)
var second = Array(repeating: 0, count: 100_001)
var count = Array(repeating: 0, count: 100_001)

var q: [Int] = [n]
visited[n] = true
count[n] = 1

while !q.isEmpty {
    let current = q.removeFirst()
    let nextLocs = [current + 1, current - 1, current * 2]
    
    for nextLoc in nextLocs {
        if nextLoc >= 0 && nextLoc <= 100_000 {
            if !visited[nextLoc] {
                visited[nextLoc] = true
                second[nextLoc] = second[current] + 1
                if second[k] != 0, second[k] < second[nextLoc] { continue }
                q.append(nextLoc)
                count[nextLoc] = count[current]
            } else if second[nextLoc] == second[current] + 1 {
                count[nextLoc] += count[current]
            }
        }
    }
}

print(second[k])
print(count[k])


