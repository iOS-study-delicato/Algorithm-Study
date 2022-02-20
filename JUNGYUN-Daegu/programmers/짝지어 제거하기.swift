// 프로그래머스 > 짝지어 제거하기
// https://programmers.co.kr/learn/courses/30/lessons/12973
// 22.02.20

import Foundation

func solution(_ s:String) -> Int{
    let s = Array(s)
    var stack: [Character] = []
    
    for char in s {
        if !stack.isEmpty && stack.last! == char {
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }
    
    if stack.count == 0 {
        return 1
    } else {
        return 0
    }
}
