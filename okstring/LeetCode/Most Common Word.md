### Most Common Word

정규표현식을 이용해 풀어봤다. 

코딩테스트에서도 나올 수 있으니 정규식을 잘 알고 이용하는게 좋겠다고 생각했다.

```swift
class Solution {
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
        var dict = Dictionary<String, Int>()
        paragraph.replace(for: "\\W", with: " ").lowercased().split(separator: " ").forEach { (word) in
            dict[String(word), default: 0] += 1
        }
        
        return dict.filter { (keyValue) -> Bool in
            for ban in banned {
                if keyValue.key == ban {
                    return false
                }
            }
            return true
        }.max(by: { $0.value < $1.value })!.key
    }
}

extension String {
    func replace(for regex: String, with replaced: String) -> String {
        return self.replacingOccurrences(of: regex, with: replaced, options: [.regularExpression])
    }
}
```

