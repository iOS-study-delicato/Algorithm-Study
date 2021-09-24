
import Foundation

func lowerBound(arr: [Int], start: Int, end: Int, target: Int) -> Int {
    var start = start
    var end = end
    
    while start < end {
        let mid = (start + end) / 2
        if arr[mid] < target {
            start = mid + 1
        } else {
            end = mid
        }
    }
    
    return end
}

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var dict = [String: [Int]]()
    
    var visited = Array(repeating: false, count: 4)
    
    func combination(startIndex: Int, infoIndex: Int) {
        if startIndex == 4 {
            var finalCombination = ""
            let temp = info[infoIndex].split(separator: " ").map({ String($0) })
            
            for (index, i) in visited.enumerated() {
                if i == true {
                    finalCombination.append("\(temp[index])")
                } else {
                    finalCombination.append("-")
                }
            }

            if dict[finalCombination] == nil {
                dict[finalCombination] = [Int(temp[startIndex])!]
            } else {
                dict[finalCombination]?.append(Int(temp[startIndex])!)
            }
            return
        }
        visited[startIndex] = true
        combination(startIndex: startIndex + 1, infoIndex: infoIndex)
        visited[startIndex] = false
        combination(startIndex: startIndex + 1, infoIndex: infoIndex)
    }
    
    for infoIndex in 0..<info.count {
        combination(startIndex: 0, infoIndex: infoIndex)
    }
    
    for key in dict.keys {
        dict[key]!.sort()
    }
    
    var result: [Int] = []
    
    for q in query {
            let splitQ = q.split(separator: " ")
            let conditionScore = Int(String(splitQ[7]))!
            let condition = [splitQ[0], splitQ[2], splitQ[4], splitQ[6]].map({ String($0) }).joined()
        
        if let considerables = dict[condition] {
            let cnt = considerables.count - lowerBound(arr: considerables, start: 0, end: considerables.count, target: conditionScore)
            result.append(cnt)
        } else {
            result.append(0)
        }
    }
    
    return result
}
