// BOJ 9012 괄호
// https://www.acmicpc.net/problem/9012
// 21.11.05

let t = Int(readLine()!)!

for _ in 0..<t {
    let input = readLine()!
    print(isVPS(string: input))
}

func isVPS(string: String) -> String {
    var stack = 0
    
    for char in string {
        if char == "(" {
            stack += 1
        } else {
            stack -= 1
        }
        if stack == -1 {
            return "NO"
        }
    }
    
    if stack == 0 {
        return "YES"
    } else {
        return "NO"
    }
    
}

