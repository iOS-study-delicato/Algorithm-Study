// 백준 2252 줄 세우기
// https://www.acmicpc.net/problem/2252
// 21.03.23

let nm = readLine()!.split(separator: " ")
let numberOfStudents = Int(String(nm[0]))!
let timesCompared = Int(String(nm[1]))!

var result = [Int]()
var inDegree = Array(repeating: 0, count: numberOfStudents + 1)
var graph = Array(repeating: [Int]() , count: numberOfStudents + 1)

// make adjacent list
for _ in 0..<timesCompared {
    let comparison = readLine()!.split(separator: " ").map { Int(String($0))! }
    let ahead = comparison[0]
    let following = comparison[1]
    graph[ahead].append(following)
    inDegree[following] += 1
}

var q = [Int]()

// put node with zero in-degree into q
for index in 1...numberOfStudents {
    // node without following node
    if inDegree[index] == 0 {
        q.append(index)
        result.append(index)
    }
}

while !q.isEmpty {
    let node = q.removeLast()
    
    // when node without follwing node follows a certain node
    for i in graph[node] {
        inDegree[i] -= 1
        // and if the certain node becomes a node without a following node
        if inDegree[i] == 0 {
            q.append(i)
            result.append(i)
        }
    }
}

for node in result { print(node, terminator: " ") }
