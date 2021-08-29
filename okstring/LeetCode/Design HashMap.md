### Design HashMap

HashMap을 디자인하는 문제다.



#### 로드 팩터(Load Factor)

- 해시 테이블에 저장된 데이터 개수 n을 버킷의 개수 k로 나눈 것이다 `load factor = n / k`



#### 모듈러 연산을 이용한 나눗셈 방식(Modulo-Division Method)을 사용

#### 개별 체이닝 사용

- 다른 충돌 해결방법으로는 오픈 어드레싱



#### swift는 

- 둘다 사용하는 형태

- Swift dictionaries uses open addressing and linear probing.



```swift
class MyHashMap {
    class ListNode {
        var key: Int?
        var value: Int?
        var next: ListNode?
        
        init(key: Int? = nil, value: Int? = nil, next: ListNode? = nil) {
            self.key = key
            self.value = value
            self.next = next
        }
    }
    
    var size: Int
    var table: [ListNode?]
    
    /** Initialize your data structure here. */
    init() {
        self.size = 1000
        self.table = Array(repeating: nil, count: self.size)
    }
    
    func hash(_ key: Int) -> Int {
        return key % self.size
    }
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        let index = hash(key)
        
        // 해당 index에 없으면 값을 넣어준다
        if self.table[index] == nil {
            self.table[index] = ListNode(key: key, value: value)
            return
        }
        
        var node = self.table[index]
        
        while node != nil {
            // key가 같으면 value를 바꿔주고
            if node?.key == key {
                node?.value = value
                break
            }
            // node next가 없으면 만들어 다음에 넣어준다
            if node?.next == nil {
                node?.next = ListNode(key: key, value: value)
            }
            node = node?.next
        }
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        let index = hash(key)
        
        var node = table[index]
        while node != nil {
            // key가 맞으면 value 반환
            if node?.key == key {
                return node?.value ?? -1
            }
            node = node?.next
        }
        
        return -1
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        let index = hash(key)
        
        var beforeNode: ListNode? = nil
        var node = table[index]
        
        while node != nil {
            // key가 같고 첫번째 노드라면 next 노드가 첫번째 노드가 된다
            if node?.key == key && beforeNode == nil {
                table[index] = node?.next
            // 두번째 이상 노드라면 before 노드를 다다음 노드와 연결
            } else if node?.key == key && beforeNode != nil {
                beforeNode?.next = node?.next
            }
            beforeNode = node
            node = node?.next
        }
    }
}

```





#### Discuss - 다른 풀이

```swift
class MyHashMap {

    var array = [Int]()
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        if array.count <= key {
            array += Array(repeating: -1, count: key - array.count + 1)
        }
        
        array[key] = value
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        guard key < array.count else { return -1 }
        return array[key]
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        guard key < array.count else { return }
        array[key] = -1
    }
}
```

