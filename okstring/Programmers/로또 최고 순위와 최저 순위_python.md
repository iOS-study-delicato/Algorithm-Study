### 로또 최고 순위와 최저 순위



```python
def solution(lottos, win_nums):
    l = set(lottos)
    w = set(win_nums)

    winCnt = len(l.intersection(w))
    removedCnt = len(list(filter(lambda x : x == 0, lottos)))

    answer = [min(7 - winCnt - removedCnt, 6), min(7-winCnt, 6)]
    return answer
```





### 다른 풀이

```python
def solution(lottos, win_nums):

    rank=[6,6,5,4,3,2,1]

    cnt_0 = lottos.count(0)
    ans = 0
    for x in win_nums:
        if x in lottos:
            ans += 1
    return rank[cnt_0 + ans],rank[ans]
```

