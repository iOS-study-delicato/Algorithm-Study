// 프로그래머스 > 완전탐색 > 소수 찾기
// https://programmers.co.kr/learn/courses/30/lessons/42839
// 22.01.10


import Foundation

func isPrime(num: Int) -> Bool {
    if num < 4 {
        return num <= 1 ? false : true
    }
    
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}

func solution(_ numbers:String) -> Int {
    var nums: Set<Int> = []
    let numArray = Array(numbers)
    var visited = Array(repeating: false, count: numbers.count)
    
    func permutation(pickedIndices: [Int], target: Int) {
        
        if pickedIndices.count == target {
            var newNumber = ""
            
            for index in pickedIndices {
                newNumber.append(numArray[index])
            }
            
            if isPrime(num: Int(newNumber)!) {
                nums.insert(Int(newNumber)!)
            }

            return
        }
        
        for i in 0..<numArray.count {
            
            guard !visited[i] else { continue }
            
            var newIndices = pickedIndices
            newIndices.append(i)
            
            visited[i] = true
            permutation(pickedIndices: newIndices, target: target)
            visited[i] = false
            
        }
        
    }
    
    for j in 1...numArray.count {
        permutation(pickedIndices: [], target: j)
    }
    
    return nums.count
}

