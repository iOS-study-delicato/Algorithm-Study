### Number of Provinces



#### DFS

```swift
class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        if isConnected.count == 1 { return 1 }
        let count = isConnected.count
        var find = Set<Int>()
        
      // 해당 isConnected[i]를 다 돌아봐서 1이고 find에 없다면 추가하고 dfs
        func dfs(i: Int) {
            for (ci, cv) in isConnected[i].enumerated() where cv == 1 && !find.contains(ci) {
                find.update(with: ci)
                dfs(i: ci)
            }
        }
        
        var result = 0
      // 하나씩 살펴본다
        for i in 0..<count {
            if !find.contains(i) {
                dfs(i: i)
                result += 1
            }
        }
        
        return result
    }
}
```





#### 다른 풀이 방법들

##### union find:



```python
class UnionFind(object):
    def __init__(self, n):
        self.u = list(range(n))
        
    def union(self, a, b):
        ra, rb = self.find(a), self.find(b)
        if ra != rb: self.u[ra] = rb
    
    def find(self, a):
        while self.u[a] != a: a = self.u[a]
        return a
    
class Solution(object):
    def findCircleNum(self, M):
        """
        :type M: List[List[int]]
        :rtype: int
        """
        
        if not M: return 0
        s = len(M)
        
        uf = UnionFind(s)
        for r in range(s):
            for c in range(r,s):
                if M[r][c] == 1: uf.union(r,c)
                    
        return len(set([uf.find(i) for i in range(s)]))
```



##### BFS:

Python

```python
class Solution(object):
    def findCircleNum(self, M):
        """
        :type M: List[List[int]]
        :rtype: int
        """
        
        if not M: return 0
        s = len(M)
        seen = set()
        cnt = 0
        for i in range(s):
            if i not in seen:
                q = [i]
                while q:
                    p = q.pop(0)
                    if p not in seen:
                        seen.add(p)
                        q += [k for k,adj in enumerate(M[p]) if adj and (k not in seen)]
                cnt += 1
        
        return cnt
```



swift

```swift
class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        if isConnected.count == 1 { return 1 }
        let count = isConnected.count
        var find = Set<Int>()
        var result = 0
        
      // 하나씩 본다
        for i in 0..<count {
            if !find.contains(i) {
              //queue에 먼저 담아주고
                var queue = [i]
                while !queue.isEmpty {
                  //하나 꺼내서 해당 isConnected[i]를 살펴본다
                    let popQ = queue.removeFirst()
                    if !find.contains(popQ) {
                        find.update(with: popQ)
                        
                        for (ci, cv) in isConnected[popQ].enumerated() where cv == 1 && !find.contains(ci) {
                            queue.append(ci)
                        }
                    }
                }
                result += 1
            }
        }
        return result
    }
}
```



