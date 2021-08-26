// 백준 17952 과제는 끝나지 않아!
// https://www.acmicpc.net/problem/17952
// 21.08.12

class Solution {
    func taskScore() -> Int {
        var ss: [Int] = []
        var ts: [Int] = []
        var result = 0
        let n = Int(readLine()!)!
        
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map { Int(String($0))! }
            
            if input[0] != 0 {
                ss.append(input[1])
                ts.append(input[2])
            }
            
            guard !ts.isEmpty else { continue }
            ts[ts.count - 1] -= 1
            
            if ts.last! == 0 {
                result += ss.popLast()!
                ts.removeLast()
            }
            
        }
        return result
    }
}

let sol = Solution()
print(sol.taskScore())
