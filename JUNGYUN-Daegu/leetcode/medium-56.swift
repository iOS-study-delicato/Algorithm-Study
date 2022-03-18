// LeetCode Medium 56. Merge Intervals
// https://leetcode.com/problems/merge-intervals/
// 22.03.07

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var result: [[Int]] = []
        var start: [Int] = [intervals[0][0]]
        var end: [Int] = [intervals[0][1]]
        
        for i in 1..<intervals.count {
            var newInterval = [intervals[i][0], intervals[i][1]]
            var toBeDeleted: [Int] = []
            
            for j in 0..<start.count {
                if isOverlapping(current: (start: start[j], end: end[j]), rhs: newInterval) {
                    let newStart = min(start[j], newInterval[0])
                    let newEnd = max(end[j], newInterval[1])
                    newInterval = [newStart, newEnd]
                    toBeDeleted.append(j)
                }
            }
            
            for k in toBeDeleted.reversed() {
                start.remove(at: k)
                end.remove(at: k)
            }
            
            start.append(newInterval[0])
            end.append(newInterval[1])
        }
    
        print(start, end)
        
        for idx in 0..<start.count {
            result.append([start[idx], end[idx]])
        }
        
        return result
    }
    
    func isOverlapping(current: (start: Int, end: Int), rhs: [Int]) -> Bool {
        if current.start > rhs[0] {
            if current.start <= rhs[1] {
                return true
            } else {
                return false
            }
        } else if current.start < rhs[0] {
            if current.end >= rhs[0] {
                return true
            } else {
                return false
            }
        } else {
            return true
        }
    }
}

