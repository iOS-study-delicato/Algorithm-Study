### k진수에서 소수 개수 구하기



```swift
import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    
    let t = String(n, radix: k)
    let list = t.components(separatedBy: "0")
    
    func isPrime(num: Int) -> Bool{
        if num == 1 {
            return false
        }
        for i in 2..<num {
            if i*i > num {
                return true
            }
            if num % i == 0 {
                return false
            }
        }
        return true
    }
    
    return list.filter({ isPrime(num: Int($0) ?? 1) }).count
}


print(solution(437674, 3)) // 3
print(solution(110011, 10)) // 2
```

