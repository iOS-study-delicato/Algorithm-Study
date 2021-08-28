# 프로그래머스

## 코딩테스트 연습 :  큰 수 만들기
#### Greedy

[문제링크](https://programmers.co.kr/learn/courses/30/lessons/42883)

 어떤 숫자에서 k개의 수를 제거했을 때 얻을 수 있는 가장 큰 숫자를 구하는 문제


### 코드

```swift
import Foundation

func solution(_ number:String, _ k:Int) -> String {
    
    var nums = number.map{ Int(String($0)) ?? -1 }
    var kk = k
    var bigNum = [Int]()
    
    while(kk > 0 && nums.count > kk) {
        let s = nums[0...kk].firstIndex(of: 9)
        let maxIndex = s != nil ? s! : getMax(arr: nums[0...kk])
        
        bigNum.append(nums[maxIndex])
        for _ in 0..<maxIndex {
            nums.removeFirst()
            kk -= 1
        }
        nums.removeFirst()
    }
    if kk == 0 { bigNum += nums }
    
    return String(bigNum.map{String($0)}.joined().prefix(number.count - k))
}

func getMax(arr: Array<Int>.SubSequence) -> Int {
    var index = 0
    var max = arr[0]
    
    for idx in 0..<arr.count - 1 {
        if max < arr[idx + 1] {
            index = idx + 1
            max = arr[idx + 1]
        }
    }
    return index
}
```

### 고민

입력 값이 큰 경우 시간 초과가 난다 (10번 케이스)

