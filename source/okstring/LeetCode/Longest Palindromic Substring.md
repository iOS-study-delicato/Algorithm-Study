### Longest Palindromic Substring

슬라이딩 윈도우, 투 포인터.. 생소한 개념이 많이 나왔지만 문자열에 자신감이 생긴 것 같다.

꼭 다시 한 번 더 풀어볼 것

```swift
class Solution {
    func longestPalindrome(_ s: String) -> String {
        func expand(left: Int, right: Int) -> String {
            var l = left
            var r = right
          // palindrome 검사
            while l >= 0 && right < s.count && s[s.index(from: l)] == s[s.index(from: r)] {
                l -= 1
                r += 1
            }
            return s.substring(with: l + 1..<r)
        }
        // 금방 끝나는 조건은 바로 반환
        if s.count < 2 || s == String(s.reversed()) {
            return s
        }
        
        var result = ""
        for i in 0..<s.count - 1 {
          // 짝수의 경우, 홀수의 경우가 있기 때문에
            result = [result, expand(left: i, right: i + 1), expand(left: i, right: i + 2)]
                .max(by: { $0.count < $1.count })!
        }
        return result
    }
    
}

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }

    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}

```

