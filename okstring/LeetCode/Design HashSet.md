### Design HashSet

HashSet을 디자인해보는 문제

HashSet은 Data를 중복해서 포함할 수 없고 Hash하는 만큼 순서의 의미가 없다



```swift
class MyHashSet {
  // 데이터를 하나씩 append하는 느낌
    var array: [[Int]]
    var size: Int
    
    init() {
        size = 1000
        array = [[Int]](repeating: [Int](), count: self.size)
    }
    
    func hash(key: Int) -> Int {
        return key % self.size
    }
    
    func add(_ key: Int) {
      // 중복이 없게끔 검사
        if contains(key) { return }
        let hashValue = hash(key: key)
        self.array[hashValue].append(key)
    }
    
    func remove(_ key: Int) {
        let hashValue = hash(key: key)
      // 해당 key는 모두 제거
        self.array[hashValue].removeAll { (val) -> Bool in
            return val == key
        }
    }
    
    func contains(_ key: Int) -> Bool {
        let hashValue = hash(key: key)
      // key가 있으면
        let first = array[hashValue].first { (val) -> Bool in
            val == key
        }
        return first != nil
    }
}
```

