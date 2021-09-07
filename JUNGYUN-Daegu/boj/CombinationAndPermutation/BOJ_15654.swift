// 백준 15654 이모티콘
// https://www.acmicpc.net/problem/15654
// 21.09.10
    
let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm.first! // 자연수의 개수
let m = nm.last! // 순열의 길이

let ns = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()

func permu(seq: [Int], count: Int, result: String) {
    if count == m {
        print( result )
    } else {
        var newSeq = seq.sorted()
        let head = newSeq.removeFirst()
        permu(seq: newSeq, count: count + 1, result: "\(result)\(head) ")
        
        for i in 1..<seq.count {
            newSeq = seq.sorted()
            newSeq.swapAt(0, i)
            let head = newSeq.removeFirst()
            permu(seq: newSeq, count: count + 1, result: "\(result)\(head) ")
        }
    }
}

permu(seq: ns, count: 0, result: "")

