### 보물

```python
n = int(input())
a = sorted(list(map(int, input().split())))
b = sorted(list(map(int, input().split())), reverse=True)
r = 0
for i in range(n):
    r += a[i] * b[i]
print(r)
```



### 다른 풀이

```swift
N = int(input())
A = list(map(int,input().split()))
B = list(map(int,input().split()))
def min(A,B):
    sum = 0
    A.sort()
    for i in A:
        t = max(B)
        sum += i*t
        B.pop(B.index(t))
    return print(sum)
min(A,B)
```

