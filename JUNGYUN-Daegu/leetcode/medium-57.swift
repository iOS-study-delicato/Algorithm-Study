// LeetCode 57. Insert Interval
// https://leetcode.com/problems/insert-interval/
// 22.03.10

class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var newInterval: [Int]? = newInterval
        var current: [Int] = []
        
        for i in 0..<intervals.count {
            var next = intervals[i]
            
            if newInterval != nil {
                if isOverlapping(lhs: next, rhs: newInterval!) {
                    next = [min(next.first!, newInterval!.first!), max(next.last!, newInterval!.last!)]
                    newInterval = nil
                }
            }
            
            if current.isEmpty {
                current = next
            } else {
                if isOverlapping(lhs: current, rhs: next) {
                    current = [min(current.first!, next.first!), max(current.last!, next.last!)]
                } else {
                    result.append(current)
                    current = next
                }
            }
        }
        
        if !current.isEmpty {
            result.append(current)
        }
        
        if newInterval != nil {
            result.append(newInterval!)
        }
        
        return result.sorted { lhs, rhs in
            lhs.first! < rhs.first!
        }
    }
    
    func isOverlapping(lhs: [Int], rhs: [Int]) -> Bool {
        if lhs.first! < rhs.first! {
            if lhs.last! < rhs.first! {
                return false
            } else {
                return true
            }
        } else if lhs.first! > rhs.first! {
            if lhs.first! > rhs.last! {
                return false
            } else {
                return true
            }
        } else {
            return true
        }
    }
}

