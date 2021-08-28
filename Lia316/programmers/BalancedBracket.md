# 프로그래머스

## 코딩테스트 연습 - 2020 KAKAO BLIND RECRUITMENT :  괄호 변환


[문제링크](https://programmers.co.kr/learn/courses/30/lessons/60058)

 균형잡힌 괄호를 올바른 괄호로 변환하여 리턴하는 프로그램


### 코드

```swift
import Foundation

func solution(_ p:String) -> String {
    if p == "" { return "" }
    
    let mapped = p.map{ $0 == "(" ? true : false}
    return recursive(mapped).map{ $0 ? "(" : ")" }.joined()
}

func recursive(_ str: [Bool]) -> [Bool] {
    if str == [] { return [] }
    
    var u = [Bool]()
    var v = str
    var isBalence = 0
    
    for element in str {
        isBalence +=  element ? 1 : -1
        u.append(element)
        v.removeFirst()
        
        if isBalence == 0 { break }
    }
    
    if isCorrect(u) {
        return u + recursive(v)
    } else {
        u.removeFirst()
        u.removeLast()
        return [true] + recursive(v) + [false] + u.map{!$0}
    }
}

func isCorrect(_ str: [Bool]) -> Bool {
    var stack = [Bool]()
    
    for element in str {
        stack.append(element)
        
        if let last = stack.last, stack.count >= 2 {
            if !last && stack[stack.count - 2] {
                _ = stack.popLast()
                _ = stack.popLast()
            }
        }
    }
    return stack.isEmpty
}
```

### 풀이 및 선택 이유

- String 값을 직접적으로 계산하면 오래걸리므로 [Bool] 타입으로 변환하여 계산함
- 올바른 괄호 판단법 : 정석적인 스택 처리 방법으로 구현
  - 이 경우는 더 이상 쪼갤 수 없는 최소한의 균형잡힌 괄호이므로 그 정도 로직까지는 필요치 않았음

### 다른 사람 풀이
```swift
let p: String = "(()))(("
p.startIndex

// 1. 다음 index로 넘어갈 수 있다
index = p.index(after: index)

// 2. index 범위로 String 값을 구할 수 있다
var u = String(p[..<index]), v = String(p[index...])

// 3. 간단한 correct 판단
if String(u.first!) == "("
```
