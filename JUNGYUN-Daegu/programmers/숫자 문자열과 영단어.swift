// Programmers 2021 카카오 채용연계형 인턴십 > 숫자 문자열과 영단어
// https://programmers.co.kr/learn/courses/30/lessons/81301
// 22.03.09

import Foundation

func solution(_ s:String) -> Int {
    let dict: [String: Int] = [
        "zero": 0,
        "one": 1,
        "two": 2,
        "three": 3,
        "four": 4,
        "five": 5,
        "six": 6,
        "seven": 7,
        "eight": 8,
        "nine": 9,
    ]
    var result = ""
    let s = s.map { $0 }
    var temp = ""
    
    for i in s {
        if i.isNumber {
            result += String(i)
        } else {
            temp += String(i)
            if dict[temp] != nil {
                result += String(dict[temp]!)
                temp = ""
            }
        }
    }
    
    return Int(result)!
}
