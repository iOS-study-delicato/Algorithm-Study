// 백준 14719 빗물
// https://www.acmicpc.net/problem/14719
// 22.01.25

let HW = readLine()!.split(separator: " ").map { Int($0)! }
let height = HW.first!
let width = HW.last!

let graph = readLine()!.split(separator: " ").map { Int($0)! }

var stack = [Int]()
var result: Int = 0

for (i, v) in graph.enumerated() {
    while !stack.isEmpty && graph[stack.last!] < v {
        let shortPreviousBlock = graph[stack.popLast()!]
        
        if stack.isEmpty {
            break
        }
        
        let height = min(v, graph[stack.last!]) - shortPreviousBlock
        let width = i - stack.last! - 1
        result += height * width
    }
    stack.append(i)
}

print(result)
