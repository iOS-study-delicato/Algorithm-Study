// 프로그래머스 > 2022 KAKAO BLIND RECRUITMENT > k진수에서 소수 개수 구하기
// https://programmers.co.kr/learn/courses/30/lessons/92335
// 22.02.19

import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    let converted: String = String(n, radix: k)
    
    func isPrime(_ n: Int) -> Bool {
        if n < 4 {
            return n <= 1 ? false : true
        }
        
        for i in 2...Int(sqrt(Double(n))) {
            if n % i == 0 {
                return false
            }
        }
        
        return true
    }
    
    var temp: String = ""
    var result: Int = 0
    
    for char in converted {
        if char == "0" {
            if temp != "" && isPrime(Int(temp)!) {
                result += 1
            }
            temp = ""
        } else {
            temp.append(char)
        }
    }
    
    if temp != "" && isPrime(Int(temp)!) {
        result += 1
    }
    
    return result
}

print(solution(437674, 3))

