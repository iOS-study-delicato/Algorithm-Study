// 백준 14226 이모티콘
// https://www.acmicpc.net/problem/14226
// 21.09.03

let s = readLine()!.split(separator: " ").map { Int(String($0))! }[0]

var leftQ: [(count: Int, time: Int, clipBoard: Int?)] = [(count: 1, time: 0, clipBoard: nil)]
var rightQ: [(count: Int, time: Int, clipBoard: Int?)] = []

var result = Int.max

while !leftQ.isEmpty || !rightQ.isEmpty {
    if rightQ.isEmpty {
        rightQ = leftQ.reversed()
        leftQ.removeAll()
    }
    
    let q = rightQ.popLast()!
    let count = q.count
    let time = q.time

    if  time >= result {
        continue
    } else if count == s {
        result = time
    } else {
        if let clipBoard = q.clipBoard, clipBoard > 0 {
            leftQ.append((count: count + clipBoard, time: time + 1, clipBoard: clipBoard))
        }
        leftQ.append((count: count * 2, time: time + 2, clipBoard: count))
        guard count > 0 else { continue }
        leftQ.append((count: count - 1, time: time + 1, clipBoard: nil))
    }
}

print(result)
