# 프로그래머스

## 코딩테스트 연습 - 2018 KAKAO BLIND RECRUITMENT :  [3차] 파일명 정렬


[문제링크](https://programmers.co.kr/learn/courses/30/lessons/17686)

단순한 문자 코드 순이 아닌, 파일명에 포함된 숫자를 반영하여 파일을 정렬하는 프로그램


### 코드

```swift
import Foundation

func compare(a: (String, Int), b: (String, Int)) -> Bool {
    if a.0 == b.0 && a.1 == b.1 { return false }
    if a.0 == b.0 { return a.1 < b.1 }
    return a.0 < b.0
}

func convert(_ file: String) -> (String, Int) {
    guard let headRange = file.range(of: "[^0-9]+", options: .regularExpression) else { return ("", 0) }
    guard let numberRange = file.range(of: "[0-9]+", options: .regularExpression) else { return ("", 0) }
    
    let head = String(file[headRange]).lowercased()
    let number = Int(file[numberRange].prefix(5))!

    return (head, number)
}

func excute(_ files: [String]) -> [String] {
    return files.sorted { compare(a: convert($0), b: convert($1)) }
}

let files = ["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"]
print(excute(files))
```
