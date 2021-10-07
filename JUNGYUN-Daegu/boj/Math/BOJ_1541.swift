
// BOJ 1541 잃어버린 괄호
// https://www.acmicpc.net/problem/1541
// 21.10.08

let input = readLine()!
var result: Int = 0
var plus: Bool = true
var temp: String = ""

input.forEach { char in
    if let _ = Int(String(char)) {
        temp.append(String(char))
    
    } else {
        if char == "+" {
            if plus {
                result += Int(temp)!
            } else {
                result -= Int(temp)!
            }
        } else {
            if plus {
                result += Int(temp)!
                plus = false
            } else {
                result -= Int(temp)!
            }
        }
        temp = ""
    }
}

if plus {
    result += Int(temp)!
} else {
    result -= Int(temp)!
}

print(result)
