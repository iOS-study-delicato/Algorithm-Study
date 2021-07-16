# 정렬

## 힙 정렬 (Heap Sort)

* 시간복잡도: O(nlogn)

### 힙 (Heap)

* 조건
  * Complete Binary Tree (완전 이진트리 구조): 마지막 레벨을 제외하면 완전히 꽉 차있고, 마지막 레벨에는 가장 오른쪽부터 연속된 몇 개의 노드가 비어있을 수 있음
  * Heap Property를 만족
    * Max Heap Property (최대힙): 부모 >= 자식 (루트 노드가 가장 큰 값)
    * Min Heap Property (최소힙): 부모 <= 자식 (루트 노드가 가장 작은 값)

* cf. Node의 종류
  * Root Node: 부모가 존재하지 않는 노드 (유일함)
  * Leaf Node: 자식이 없는 노드

* Heap의 표현

  * 노드의 개수가 n개인 일차원 배열: A[1...n]

  ![Heap의 표현](https://user-images.githubusercontent.com/56751259/125742056-2ebcfec3-dd3b-442c-98cf-ab0c947828c7.jpeg)

  * 루트 노드: A[1]
  * A[i]의 부모 = A[i / 2]
  * A[i]의 왼쪽 자식 = A[2i]
  * A[i]의 오른쪽 자식 = A[2i + 1]

* 이점

  * 추가 배열이 불필요 → 메모리 낭비가 덜함
  * 힙은 일차원 배열로 표현 가능
    * 자료구조를 유지하기 위한 Overhead가 거의 없음
    * Complete Binary Tree이기 때문에 일차원 배열로 표현해도 부모 - 자식 관계를 보존

* 기본 연산: MAX-HEAPIFY (or MIN-HEAPIFY)

  * 전제 조건

    1. 트리의 전체 모양은 Complete Binary Tree임
    2. 왼쪽, 오른쪽 Subtree가 그 자체로 Heap임
    3. 유일하게 루트만이 Heap Property를 만족 안함

  * 구현: 두 자식들 중에 더 큰 쪽이 나보다 크면 exchange

    * 자신의 자식(들)이 나보다 작아지거나 자신이 Leaf 노드까지 내려오면 종료

  * Pseudocode: Recursive Ver.

    ```
    MAX-HEAPIFY(A, i)
    {
    	if there is no child of A[i]
    		return;
    	k ← index of the biggest child of i;
    	if A[i] >= A[k]
    		return;
    	exchange A[i] and A[k];
    	MAX-HEAPIFY(A, k);
    }
    ```

  * Swift Code

    ```swift
    func swap(_ array: inout [Int], _ i: Int, _ k: Int) {
        let temp = array[i]
        array[i] = array[k]
        array[k] = temp
    }
    
    func maxHeapify(_ array: inout [Int], _ i: Int, _ size: Int) {
        var k = i
        let left = 2 * i + 1
        let right = 2 * i + 2
        if left < size && array[i] < array[left] {
            k = left
        }
        if right < size && array[i] < array[right] && array[left] < array[right] {
            k = right
        }
        if k != i {
            swap(&array, i, k)
            maxHeapify(&array, k, size)
        }
    }
    ```

  * Pseudocode: Iterative Ver.

    ```
    MAX-HEAPIFY(A, i)
    {
    	while A[i] has a child do
    		k ← index of the biggest child of i;
    		if A[i] >= A[k]
    			return;
    		exchange A[i] and A[k];
        i = k;
       end.
    }
    ```

  * Swift Code

    ```swift
    func maxHeapify(_ array: inout [Int], _ i: Int, _ size: Int) {
        var i = i
        var k = i
        while 2 * i + 1 < size {
            let left = 2 * i + 1
            let right = 2 * i + 2
            if left < size && array[i] < array[left] {
                k = left
            }
            if right < size && array[i] < array[right] && array[left] < array[right] {
                k = right
            }
            if array[i] >= array[k] {
                break
            }
            swap(&array, i, k)
            i = k
        }
    }
    ```

  * 시간복잡도: O(h) = O(θ(logn))

    * 트리의 높이가 h일 때, O(h)
    * 노도의 개수가 n일 때, h = θ(logn)

  * 응용

    * 우선순위 큐 구현에 사용
    * 다익스트라 알고리즘에서 노드 관리를 위해 사용하기도 함

### 힙 정렬 (Heap Sort)

1. 주어진 데이터로 힙을 만든다.

   * 레벨 오더의 역순 중 처음으로 Leaf Node가 아닌 노드를 찾아 HEAPIFY

   * 처음으로 Leaf Node가 아닌 노드 = 마지막 노드의 부모 노드 = A[n / 2]

   * 루트 노드까지 계속 역순으로 HEAPIFY

   * Pseudocode

     ```
     BUILD-MAX-HEAP(A)
     heap-size[A] ← length[A]
     for i ← length[A]/2 downto 1
     	do MAX-HEAPIFY(A, i)
     ```

   * Swift Code

     ```swift
     func buildMaxHeap(_ array: inout [Int]) {
         for i in stride(from: array.count / 2 - 1, through: 0, by: -1) {
             maxHeapify(&array, i, array.count)
         }
     }
     ```

   * 시간 복잡도: O(n)

     * O(logn)인 MAX-HEAPIFY(A, i)를 n / 2번 반복 → (n / 2) * logn = O(nlongn)
     * 하지만 MAX-HEAPIFY(A, i)하는 노드의 개수가 항상 n개가 아니므로 (e.g. 처음엔 2개, 3개, ..., n개) BUILD-MAX-HEAP(A)의 시간 복잡도를 O(nlongn)라고 하는 것은 과도하게 측정한 값이라고 볼 수 있음
     * 다시 하지만! 힙을 정렬하는 시간 복잡도가 O(nlogn)이므로 힙 정렬 알고리즘의 전체 시간 복잡도는 O(nlogn)

2. 힙에서 최대값(루트)을 가장 마지막 값과 바꾼다: 가장 큰 값이 마지막으로 갔으므로 자신의 자리를 찾아간 것!
3. 힙의 크기가 1 줄어든 것으로 간주한다. 즉, 가장 마지막 값은 힙의 일부가 아닌 것으로 간주한다. (n = n -1)
4. 루트 노드에 대해서 HEAPIFY(1)한다.
5. 2 ~ 4번을 반복한다.

* Pseudocode

  ```
  HEAPSORT(A)
  BUILD-MAX-HEAP(A)										: O(n)
  for i ← heap_size downto 2 do				: n-1 times
  	exchange A[1] and A[i]						: O(1)
  	heap_size ← heap_size - 1					: O(1)
  	MAX-HEAPIFY(A, 1)									: O(logn)
  ```

* Swift Code

  ```swift
  func heapSort(_ array: inout [Int]) {
      buildMaxHeap(&array)
      var heapSize = array.count
      for i in stride(from: heapSize - 1, through: 1, by: -1) {
          swap(&array, 0, i)
          heapSize -= 1
          maxHeapify(&array, 0, heapSize)
          print(i, array)
      }
  }
  ```

### 참고 자료

* [앱] [Algorithms: Explained&Animated](https://apps.apple.com/us/app/algorithms-explained-animated/id1047532631)
* [책] [알고리즘 도감](http://www.yes24.com/Product/Goods/58290453)
* [강의] [영리한 프로그래밍을 위한 알고리즘 강좌](https://www.youtube.com/watch?v=ihyg2OR8IR0)

