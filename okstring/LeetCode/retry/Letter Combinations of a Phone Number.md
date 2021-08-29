## Letter Combinations of a Phone Number





```swift
class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits == "" { return [] }
        
        var dict = [
            "2": "abc",
            "3": "def",
            "4": "ghi",
            "5": "jkl",
            "6": "mno",
            "7": "pqrs",
            "8": "tuv",
            "9": "wxyz"
        ]
        var result = [String]()
        func dfs(_ index: Int, path: String) {
          // 백트래킹
            if path.count == digits.count {
                result.append(path)
                return
            }
          //이후 인덱스부터 digits 갯수까지
            for index in index..<digits.count {
                let digitIndex = digits.index(digits.startIndex, offsetBy: index)
                for str in dict[String(digits[digitIndex])]! {
                    dfs(index + 1, path: path + String(str))
                }
            }
        }
        
        dfs(0, path: "")
        
        return result
    }
}
```

