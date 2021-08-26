// LeetCode Sliding Window Maximum
// https://leetcode.com/problems/sliding-window-maximum/
// 21.08.02

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var result: [Int] = []
        var deque: [(index: Int, value: Int)] = []
        
        func add(element: (index: Int, value: Int)) {
            guard !deque.isEmpty else {
                deque.append(element)
                return
            }
            
            while !deque.isEmpty && deque.last!.value < element.value {
                deque.removeLast()
            }
            
            deque.append(element)
        }
        
        guard nums.count > 1 else { return [nums[0]] }
        
        //initial window
        for i in 0..<k {
            let element = (index: i, value: nums[i])
            add(element: element)
        }
        
        result.append(deque.first!.value)
        
        for newNumberIndex in k..<nums.count {
            if deque.first!.index + k <= newNumberIndex {
                deque.removeFirst()
            }
            
            let element = (index: newNumberIndex, value: nums[newNumberIndex])
            add(element: element)
            
            result.append(deque[0].value)
        }
        return result
    }
}
