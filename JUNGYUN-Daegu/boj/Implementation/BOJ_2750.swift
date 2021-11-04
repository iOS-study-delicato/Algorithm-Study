// BOJ 2750 수 졍렬하기
// https://www.acmicpc.net/problem/2750
// 21.10.21

let N = Int(readLine()!)!

var result: [Int] = []

for _ in 0..<N {
    result.append(Int(readLine()!)!)
}

result.sorted(by: { $0 < $1 }).forEach { num in
    print(num)
}


