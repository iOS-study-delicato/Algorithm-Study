// LeetCode Daily Temperatures
// https://leetcode.com/problems/daily-temperatures/
// 21.08.09

class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var ans = [Int]()
        var s = [Int]() // here for element index，not element
        
        for i in (0...temperatures.count - 1).reversed() {
            while (!s.isEmpty && temperatures[s.last!] <= temperatures[i]) {
                s.removeLast()
            }
            
            if s.isEmpty {
                ans.append(0)
            } else {
                ans.append(s.last! - i)
            }
            s.append(i) // add index，not element
        }
        return ans.reversed()
    }
}
