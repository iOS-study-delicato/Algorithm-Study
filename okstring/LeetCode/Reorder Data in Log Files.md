### Reorder Data in Log Files



문제 조건이 헷갈리는 문제

첫번째가 식별자임을 알아야한다.

```swift
class Solution {
    func reorderLogFiles(_ logs: [String]) -> [String] {
        var numbers = [String]()
        var strings = [String]()
        
      // 	numbers와 strings를 구분
        for log in logs {
            let tmpLog = log.split(separator: " ")
            if String(tmpLog[1]).isNumber {
                numbers.append(log)
            } else {
                strings.append(log)
            }
        }
        
        strings = strings.sorted(by: { (strA, strB) -> Bool in
            let tmpStrA = strA.split(separator: " ")
            let tmpStrB = strB.split(separator: " ")
            
				// 인덱스가 넘어가지 않게 식별자 이후로
            for index in 1..<min(tmpStrA.count, tmpStrB.count) {
              // 문자가 똑같으면
                if tmpStrA[index] == tmpStrB[index] {
                    continue
                  // 아니면 비교
                } else {
                    return tmpStrA[index] < tmpStrB[index]
                }
            }
            // 꼬리가 더 붙으면 더 큰걸로 간주
            if tmpStrA.count != tmpStrB.count {
                return min(tmpStrA.count, tmpStrB.count) < max(tmpStrA.count, tmpStrB.count)
            // 마지막으로 식별자 정렬
            } else {
                return tmpStrA.first! < tmpStrB.first!
            }
            
        })
        return strings + numbers
    }
}

extension String {
    var isNumber: Bool {
        for character in self {
            if !Character(String(character)).isNumber {
                return false
            }
        }
        return true
    }
}
```





