## Maximum Number of Vowels in a Substring of Given Length



```swift
class Solution {
    func maxVowels(_ s: String, _ k: Int) -> Int {
        var start = 0
        var maxSum = 0
        var currentSum = 0
        let vowel = ["a", "e", "i", "o", "u"]
        let sArr = Array(s)
        for endIndex in 0..<s.count {
            if endIndex - start > k - 1 {
                if vowel.contains(String(sArr[start])) {
                    currentSum -= 1
                }
                start += 1
            }
            if vowel.contains(String(sArr[endIndex])) {
                currentSum += 1
            }
            maxSum = max(maxSum, currentSum)
        }
        return maxSum
    }
}
```

