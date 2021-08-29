## Check if Word Equals Summation of Two Words



```swift
class Solution {
    func isSumEqual(_ firstWord: String, _ secondWord: String, _ targetWord: String) -> Bool {
        let c: ((Character) -> (String)) = { String(Int($0.asciiValue!) - 97) }
        return Int(firstWord.map({ c($0) }).joined())! + Int(secondWord.map({ c($0) }).joined())! == Int(targetWord.map({ c($0) }).joined())!
    }
}
```

