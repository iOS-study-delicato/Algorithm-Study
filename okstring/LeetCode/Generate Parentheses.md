

## Generate Parentheses



```swift
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        backTracking(&result, "(", 1, 0, maxStr: n)
        return result
    }
    
    func backTracking(_ result: inout [String],_ str: String,  _ start: Int, _ end: Int, maxStr: Int) {
        if str.count == maxStr * 2 {
            result.append(str)
            return
        }
        
        if start < maxStr {
            backTracking(&result, str + "(", start + 1, end, maxStr: maxStr)
        }
        if end < start {
            backTracking(&result, str + ")", start, end + 1, maxStr: maxStr)
        }
    }
}
```





### 다른 풀이

```swift
// Approach 1: Top-down

func generateParenthesis(_ n: Int) -> [String] {
    var dp = [Int: [String]]()
    dp[0] = [""]
    return helper(n, &dp)
}

func helper(_ n: Int, _ dp: inout [Int: [String]]) -> [String] {
    if let generated = dp[n] { return generated }

    var combos = [String]()

    for i in 0..<n {
        let inside = helper(i, &dp)
        let tail = helper(n - i - 1, &dp)
        for i in inside {
            for t in tail {
                combos.append("(" + i + ")" + t)
            }
        }
    }

    dp[n] = combos
    return combos
}

// Approach 2: Bottom-up

func generateParenthesis(_ n: Int) -> [String] {
    var dp = [Int: [String]]()
    dp[0] = [""]

    for i in 1...n {
        var combos = [String]()
        for j in 0..<i {
            let insides = dp[j]!
            let tails = dp[i - j - 1]!
            for inside in insides {
                for tail in tails {
                    combos.append("(" + inside + ")" + tail)
                }
            }
        }
        dp[i] = combos
    }

    return dp[n]
}
```

