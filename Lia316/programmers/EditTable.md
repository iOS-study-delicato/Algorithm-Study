# 프로그래머스

## 코딩테스트 연습 - 2021 카카오 채용연계형 인턴십 :  표 편집
#### Double Linked List

[문제링크](https://programmers.co.kr/learn/courses/30/lessons/81303?language=swift#)

 표의 행을 명령어 기반으로 선택, 삭제, 복구하는 프로그램의 변화를 구하는 문제


### 코드 1. 배열 내용 바꾸기 풀이


```swift
import Foundation

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var table = Array(repeating: "O", count: n)
    var ptr = k
    var zList = [Int]()
    
    for cmd in cmd {
        switch cmd.first {
        
        case "D":
            var num = Int(cmd.split(separator: " ")[1])!
            while num > 0 {
                ptr += 1
                if table[ptr] == "O" { num -= 1 }
            }
            
        case "U":
            var num = Int(cmd.split(separator: " ")[1])!
            while num > 0 {
                ptr -= 1
                if table[ptr] == "O" { num -= 1 }
            }
            
        case "C":
            zList.append(ptr)
            table[ptr] = "X"
            if ptr == n - 1 {
                repeat {
                    ptr -= 1
                } while table[ptr] == "X"
            }
            else {
                repeat {
                    ptr += 1
                } while ptr < n && table[ptr] == "X"
            }
            if ptr == n {
                repeat {
                    ptr -= 1
                } while table[ptr] == "X"
            }
            
        case "Z":
            table[zList.removeLast()] = "O"
            
        default:
            break
        }
    }
    return table.joined()
}
```

##### 헤맸던 이유 & 배열보다 링크드리스트가 좋은 이유
- 행 삭제 후, 선택은 다음 행으로 넘어간다
- 배열의 내용만 바꾸는 경우, 단순히 선택++ 할 수 없고, "X"가 아닌 행까지 이동해줘야한다
- 이 부분이 상당히 오래 걸리지만, 링크드 리스트의 경우 이런 복잡도가 사라진다
- 그냥 연결을 옮기면 되기 때문이다!
- 근데 그걸 배열로도 구현할 수 있다




### 코드 2. 배열을 링크드리스트처럼 풀기

```swift
import Foundation

func solution2(_ n:Int, _ k:Int, _ cmd:[String]) -> String {

    var prev = [Int]()
    var next = [Int]()
    var k = k
    var deleted = [Int]()
    
    for i in 0..<n+2 {
        prev.append(i-1)
        next.append(i+1)
    }
    k += 1
    
    for cmd in cmd {
        let c = cmd.split(separator: " ")
        switch c[0] {
        
        case "D":
            let num = Int(c[1])!
            for _ in 0..<num {
                k = next[k]
            }
            
        case "U":
            let num = Int(c[1])!
            for _ in 0..<num {
                k = prev[k]
            }
            
        case "C":
            deleted.append(k)

            next[prev[k]] = next[k]
            prev[next[k]] = prev[k]
            
            if next[k] == n+1 { k = prev[k] }
            else { k = next[k] }
            
        case "Z":
            let resolved = deleted.removeLast()
            
            next[prev[resolved]] = resolved
            prev[next[resolved]] = resolved
            
        default:
            break
        }
    }
    
    var table = Array(repeating: "O", count: n)
    for i in deleted {
        table[i-1] = "X"
    }
    
    return table.joined()
}
```


##### 설명

<img width="680" alt="image" src="https://user-images.githubusercontent.com/73650994/127010553-9437f1c1-07ad-444c-9fa4-2ddaf87ab3f5.png">

- 그림과 같이, 표의 prev, next를 저장하는 배열을 둔다
- 선택된 행은 prev와 next를 통해서만 움직인다

- index를 넘지 않게 하기 위해, prev, next 각 배열의 양 끝에 원소를 추가한다

