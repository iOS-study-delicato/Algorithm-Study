### Best Time to Buy and Sell Stock

이중루프를 사용하지 않는 습관을 길러야 한다

```swift
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minValue = Int.max
        var result = 0
        
        for price in prices {
            minValue = min(minValue, price)
            result = max(price - minValue, result)
        }
        
        return result
    }
}
```

