# 프로그래머스

## 코딩테스트 연습 문제
: N개의 최소공배수

[문제링크](https://programmers.co.kr/learn/courses/30/lessons/12953)

n개의 수의 최소공배수를 구하는 프로그램


### 코드

```swift
class LCMofN {
    
    func solution(_ arr:[Int]) -> Int {
        var arr = arr
        
        while arr.count > 1 {
            let a = arr.removeFirst()
            let b = arr.removeFirst()
            arr.append(lcm(a, b))
        }
        return arr[0]
    }
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        let r = a % b
        
        if r > 0 { return gcd(b, r) }
        else { return b }
    }
    
    func lcm(_ a: Int, _ b: Int) -> Int {
        return a * b / gcd(a, b)
    }
}
```

### 참고 공식

-  A * B = 최소공배수 * 최대공약수
- 최대공약수 : 유클리드 호제법 -> mod 연산으로 구하기

### 배운 점

- `solution()` 함수의 의도는, divide & conquer 방식으로 O(logN) 만큼 `lcm()`을 호출하는 것이었다
- O(N) 인 reduce 사용보다 더 효율적이라고 생각했는데, 실제 시간 차이는 내 코드가 reduce 사용 코드보다 2배 느렸다.
- 원인 분석: `arr.removeFirst()`에서 배열의 앞을 건드므로 배열 연산에 따른 cost가 생각보다 높을 것이다.
