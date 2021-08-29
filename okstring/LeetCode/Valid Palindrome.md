### Valid Palindrome

`typealias Element = Character`

String.Element도 Character 속성을 사용할 수 있었다!!



```swift
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let trimStr = s.reversed().compactMap{ string in
            let str = String(string)
            let character = Character(str)
            if character.isLetter || character.isNumber {
                return str.lowercased()
            } else {
                return ""
            }
        }.joined()
        return trimStr == String(trimStr.reversed())
    }
}
```





다른 풀이

```swift
class Solution {
	func isPalindrome(_ s: String) -> Bool {
      var reversed = ""

      for item in s.lowercased().reversed() where item.isLetter || item.isNumber {
          reversed.append(item)
      }

      return reversed == String(reversed.reversed())
  }
}
```

