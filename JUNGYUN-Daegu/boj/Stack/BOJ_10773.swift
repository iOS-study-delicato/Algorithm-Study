
// BOJ 10773 제로
// https://www.acmicpc.net/problem/10773
// 21.10.08

let k = Int(readLine()!)!
var myArray : [Int] = [0]

for _ in 1...k {
    let input = Int(readLine()!)!
    if input == 0 {
        myArray.removeLast()
    } else {
        myArray.append(input)
    }
}

var result = myArray.reduce(0) { result, ele in
    return result + ele
}

print(result)
