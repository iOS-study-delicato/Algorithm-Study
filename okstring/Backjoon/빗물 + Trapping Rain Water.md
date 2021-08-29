### 빗물 + Trapping Rain Water



시뮬레이션 문제 중 유명한 문제. 시뮬레이션 문제에 약한 것 같다 

한 번에 풀려고 하지 않아도 된다.



### Brute Force

```swift
let input = readLine()!.split(separator: " ").map({ Int(String($0))! })
let h = input[0]
let w = input[1]
let arr = readLine()!.split(separator: " ").map({ Int(String($0))! })

var right = 0
var left = 0
var result = 0

for i in 1..<w-1 {
    let current = arr[i]
    left = 0
    right = 0
    for j in 0..<i {
        left = max(left, arr[j])
    }
    for j in i+1..<w {
        right = max(right, arr[j])
    }
    result += max(0, min(left, right) - current)
}

print(result)
```



### Dynamic Programming

```swift
class Solution {
    func trap(_ height: [Int]) -> Int {
        if height.isEmpty { return 0 }
        var result = 0
        let count = height.count
        var left = height
        var right = height
        left[0] = height[0]
        for i in 1..<count {
            left[i] = max(height[i], left[i - 1])
        }
        right[count-1] = height[count-1]
        for i in (0..<count-1).reversed() {
            right[i] = max(height[i], right[i + 1])
        }
        for i in 0..<count-1 {
            result += min(left[i], right[i]) - height[i]
        }
        return result
    }
}
```





### Stack

앞으로 가다가 높은게 생기면 아래부터 채워나가는 방식

```swift
class Solution {
    func trap(_ height: [Int]) -> Int {
        var result = 0
        var c = 0
        var stack = [Int]()
        while c < height.count {
            while !stack.isEmpty && height[c] > height[stack.last!] {
                let top = stack.popLast()!
                if stack.isEmpty {
                    break
                }
                let distance = c - stack.last! - 1
                let boundedHeight = min(height[c], height[stack.last!]) - height[top]
                result += distance * boundedHeight
                print("index:\(c), top: \(top), distance: \(distance), boundedHeight:\(boundedHeight)")
                print("distance * boundedHeight \(distance * boundedHeight)")
            }
            stack.append(c)
            c += 1
        }
        return result
    }
}

print(Solution().trap([4,2,0,3,2,5])) // 9

//index:3, top: 2, distance: 1, boundedHeight:2
//distance * boundedHeight 2
//index:3, top: 1, distance: 2, boundedHeight:1
//distance * boundedHeight 2
//index:5, top: 4, distance: 1, boundedHeight:1
//distance * boundedHeight 1
//index:5, top: 3, distance: 4, boundedHeight:1
//distance * boundedHeight 4
//9
```







