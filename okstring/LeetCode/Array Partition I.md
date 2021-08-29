### Array Partition I

나름 쉬운 문제였다. 

짝수번째 수를 더해도 조건은 충족된다

```swift
class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted()
        return stride(from: 0, to: nums.count, by: 2).map({ min(sortedNums[$0], sortedNums[$0 + 1]) }).reduce(0, +)
    }
}
```



#### 다른 풀이

```swift
func arrayPairSum(_ nums: [Int]) -> Int {
    let tempArray = nums.sorted(by: <)
    var result = 0
    for value in tempArray.enumerated() {
        if(value.offset % 2 == 0){
            result+=value.element
        }
    }
    return result;
}
```

