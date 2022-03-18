// Programmers > 2021 KAKAO BLIND RECRUITMENT > 신규 아이디 추천
// https://programmers.co.kr/learn/courses/30/lessons/72410
// 22.03.05

import Foundation

func solution(_ new_id:String) -> String {
    var result = ""
    var converted = new_id.map { String($0) }
    // 1
    converted = converted.map { $0.lowercased() }
    
    // 2
    let validCharSet = Set("abcdefghijklmnopqrstuvwxyz1234567890-_.")
    converted = converted.map { ele in
        if !validCharSet.contains(Character(ele)) {
            return ""
        } else {
            return ele
        }
    }
    
    result = converted.joined()
    converted = result.map { String($0) }
    
    //3
    var i = 0
    
    for j in 1..<converted.count {
        if converted[j] == "." && converted[i] == "." {
            converted[j] = ""
            continue
        }
        i = j
    }
    
    result = converted.joined()
    converted = result.map { String($0) }
    
    // 4
    if converted[0] == "." {
        converted[0] = ""
    }
    
    if converted[converted.count - 1] == "." {
        converted[converted.count - 1] = ""
    }
    
    result = converted.joined()
    converted = result.map { String($0) }
    
    // 5
    if result == "" {
        result = "a"
    }
    
    converted = result.map { String($0) }
    
    // 6
    converted = Array(converted.prefix(15))
    
    if converted[converted.count - 1] == "." {
        converted[converted.count - 1] = ""
    }
    
    result = converted.joined()
    converted = result.map { String($0) }
    
    // 7
    while converted.count < 3 {
        converted.append(converted.last!)
    }
    
    result = converted.joined()
    
    return result
}

