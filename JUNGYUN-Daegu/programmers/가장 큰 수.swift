// 프로그래머스 정렬 > 가장 큰 수
// https://programmers.co.kr/learn/courses/30/lessons/42746
// 22.01.06

import Foundation

func solution(_ numbers:[Int]) -> String {
    
    func compare(index: Int, num1: [String], num2: [String]) -> Bool {
        
        if num1.count - 1 < index && num2.count - 1 < index {
            
            return false
            
        } else if num1.count - 1 < index || num2.count - 1 < index {
            
            let option1 = num1.joined() + num2.joined()
            let option2 = num2.joined() + num1.joined()
            
            return option1 > option2
            
        } else if num1[index] > num2[index] {
            
            return true
            
        } else if num1[index] == num2[index] {
            
            return compare(index: index + 1, num1: num1, num2: num2)
            
        } else {
            
            return false
            
        }
        
    }
    
    
    let nums = numbers.map { number in
        Array(String(number)).map { String($0) }
    }
    
    let sortedNums = nums.sorted { first, second in
        compare(index: 0, num1: first, num2: second)
    }
    
    
    var result: String = ""
    
    for i in sortedNums {
        result += i.joined()
    }
    
    if result.first! == "0" {
        return "0"
    } else {
        return result
    }
    
}
