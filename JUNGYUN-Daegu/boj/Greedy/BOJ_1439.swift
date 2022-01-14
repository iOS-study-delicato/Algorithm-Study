// BOJ 1439 뒤집기
// https://www.acmicpc.net/problem/1439
// 22.01.11

let S = readLine()!.map { char in
    String(char)
}


var result: Int = 0
var initialValue: String? = nil


for (index, value) in S.enumerated() {
    if index == 0 {
        initialValue = value
    } else {
        if value != initialValue! {
            if S[index - 1] != value {
                result += 1
            }
        }
    }
}


print(result)
