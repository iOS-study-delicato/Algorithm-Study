// Programmers > 2022 KAKAO BLIND RECRUITMENT > 신고 결과 받기
// https://programmers.co.kr/learn/courses/30/lessons/92334
// 22.02.24

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var result: [Int] = Array(repeating: 0, count: id_list.count)
    // reportee: [reporter]
    var dict: [String: Set<String>] = [:]
    var toBeMailed: [String: Int] = [:]
    
    for report in report {
        let content = report.split(separator: " ").map { String($0) }
        let reporter = content[0]
        let reportee = content[1]
        
        if dict[reportee] == nil {
            dict[reportee] = [reporter]
        } else {
            dict[reportee]!.insert(reporter)
        }
    }
    
    for key in dict.keys {
        if dict[key]!.count >= k {
            for reporter in dict[key]! {
                if toBeMailed[reporter] == nil {
                    toBeMailed[reporter] = 1
                } else {
                    toBeMailed[reporter]! += 1
                }
            }
        }
    }
    
    for (i, id) in id_list.enumerated() {
        if toBeMailed[id] == nil {
            continue
        } else {
            result[i] = toBeMailed[id]!
        }
    }
    
    return result
}

