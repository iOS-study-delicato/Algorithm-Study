# Baekjoon

## [크로아티아 알파벳](https://www.acmicpc.net/problem/2941)

* 분류: 구현, 문자열
* 풀이 언어: Swift
* 문제 요약: 주어진 단어가 몇 개의 크로아티아 알파벳으로 이루어져 있는지 출력

### 코드

##### `replacingOccurrences(of:with:)` 사용

```swift
import Foundation

var w = readLine()!
let croatianAlphabet = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]
for i in croatianAlphabet {
    w = w.replacingOccurrences(of: i, with: "a")
}
print(w.count)
```

* 메모리: 79160 KB
* 시간: 16 ms
* 주어진 단어 중 크로아티아 알파벳에 해당하는 것을 (크로아티아 알파벳에 포함되지 않는) 임의의 `String`으로 대체
* 코드가 짧고 직관적이지만 `replacingOccurrences(of:with:)`를 사용하기 위해 `import Foundation` 해야 하므로 메모리 측면에서 손해

##### `Set`과 `index` 사용

```swift
let w = readLine()!.map { String($0) }
let croatianAlphabet: Set<String> = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]
let len = w.count
var count = 0
var idx = 0

while idx < len {
    var two = ""
    var three = ""
    
    if idx + 2 < len {
        three = w[idx] + w[idx + 1] + w[idx + 2]
    }
    if idx + 1 < len {
        two = w[idx] + w[idx + 1]
    }
    
    if croatianAlphabet.contains(three) {
        idx += 2
    } else if croatianAlphabet.contains(two) {
        idx += 1
    }
    count += 1
    idx += 1
}

print(count)
```

* 메모리: 62228 KB
* 시간: 12 ms
* `contains(_:)`는 `Array`에서 O(n), `Set`에서 O(1)의 복잡도를 가진다.