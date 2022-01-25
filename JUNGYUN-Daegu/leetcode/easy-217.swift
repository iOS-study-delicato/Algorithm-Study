// LeetCode Easy 217. Contains Duplicate
// https://leetcode.com/problems/contains-duplicate/
// 22.01.25

class Solution_Sort { // nlogn + n
    func containsDuplicate(_ nums: [Int]) -> Bool {
        let sorted = nums.sorted()
        
        for i in 1..<nums.count {
            if sorted[i] == sorted[i - 1] {
                return true
            }
        }
        
        return false
    }
}

class Solution_HashMap { // n
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set: Set<Int> = []
        
        for num in nums {
            if set.contains(num) {
                return true
            } else {
                set.insert(num)
            }
        }
        
        return false
    }
}

