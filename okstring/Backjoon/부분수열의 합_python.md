### 부분수열의 합_python



```python
NS = list(map(int, input().split()))
N, S = NS[0], NS[1]
arr = list(map(int, input().split()))

def search(i, s):
    count = 0
    if s == S:
        count += 1

    for j in range(i+1, N):
        count += search(j, s + arr[j])

    return count

count = 0
for i in range(0, N):
    count += search(i, arr[i])

print(count)
```



### 다른 풀이

https://www.acmicpc.net/source/21464660

```python
N, S = map(int, input().split())
num_li = list(map(int, input().split()))
answer = 0

A, B = num_li[:N//2], num_li[N//2:]
tableA, tableB = {}, {}

def dfs(n,sum_, i, o):
    #n은 카운터
    if n == len(i):
        o[sum_] = o.get(sum_,0) +1
        return

    dfs(n+1, sum_, i, o)
    dfs(n+1, sum_+i[n], i,o)

dfs(0, 0, A, tableA)
dfs(0, 0, B, tableB)

tableA[0] -= 1
tableB[0] -= 1

ans = tableA.get(S,0) + tableB.get(S,0)

for i in tableA:
    if S-i in tableB:
        ans += tableB[S-i] * tableA[i]

print(ans)
```

