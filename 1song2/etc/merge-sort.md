# 정렬

## 병합 정렬 (Merge Sort)

* 시간복잡도: O(nlogn)

### 분할정복법 (Divide and conquer)

* 분할정복법을 사용하는 대표적인 예: Merge Sort, Quick Sort
* 세가지 단계를 거쳐서 문제를 해결하는 기법
  1. 분할: 해결하고자 하는 문제를 작은 크기의 **동일한** 문제들로 분할
  2. 정복: 각각의 작은 문제를 순환적으로 해결
  3. 합병: 작은 문제의 해를 합하여(merge) 원래 문제에 대한 해를 구함
* 결국 핵심은 Recursion!

### 구현

1. 데이터가 저장된 배열을 절반으로 나눔 (divide)
   * 계속 쪼개어 나누다 보면 길이가 하나인 리스트들로 나누어짐
2. 각각을 순환적으로 정렬 (recursively sort)
3. ⭐️정렬된 두 개의 배열을 합쳐 전체를 정렬 (merge): 실제로 sorting이 일어나는 부분
   * 추가 배열이 필요

* Pseudocode

  ```
  mergeSort(A[], p, r)       ▷ A[p...r]을 정렬한다.
  {
   if (p < r) then {
    q ← (p + r) / 2;         1. p, r의 중간 지점 계산
    mergeSort(A, p, q);      2. 전반부 정렬
    mergeSort(A, q + 1, r);  3. 후반부 정렬
    merge(A, p, q, r);       4. 합병
   }
  }
  
  merge(A[], p, q, r)
  {
   정렬되어 있는 두 배열 A[p...q]와 A[q+1...r]을 합하여 정렬된 하나의 배열 A[p...r]을 만든다.
  }
  ```

  ```java
  void merge(int data[], int p, int q, int r) {
   int i = p, j = q + 1, k = p;
   int tmp[data.length()];
   while (i <= q && j <= r) {
    if (data[i] <= data[j])
     tmp[k++] = data[i++];
    else
     tmp[k++] = data[j++];
   }
   while (i <= q)
    tmp[k++] = data[i++];
   while (j <= r)
    tmp[k++] = data[j++];
   for (int i = p; i <= r; i++)
    data[i] = tmp[i];
  }
  ```

  * 각각의 리스트에서 가장 작은 값을 비교
  * i: 첫번째 리스트에서 가장 작은 값의 위치
  * j: 두번째 리스트에서 가장 작은 값의 위치
  * k: 전체에서 가장 작은 값이 저장된 추가배열상에서의 위치
    * A[i]와 A[j]중 더 작은 값이 위치하게 됨
  * tmp: 추가 배열 (Merge Sort에서는 반드시 필요)

* Swift Code

  ```swift
  func mergeSort(_ array: inout [Int], _ p: Int, _ r: Int) {
      if p < r {
          let q = (p + r) / 2
          mergeSort(&array, p, q)
          mergeSort(&array, q + 1, r)
          merge(&array, p, q, r)
      }
  }
  
  func merge(_ array: inout [Int], _ p: Int, _ q: Int, _ r: Int) {
      var i = p
      var j = q + 1
      var k = p
      var temp = array
      
      while i <= q && j <= r {
          if array[i] <= array[j] {
              temp[k] = array[i]
              i += 1
          } else {
              temp[k] = array[j]
              j += 1
          }
          k += 1
      }
      while i <= q {
          temp[k] = array[i]
          k += 1
          i += 1
      }
      while j <= r {
          temp[k] = array[j]
          k += 1
          j += 1
      }
      for index in p...r {
          array[index] = temp[index]
      }
  }
  ```

### 참고 자료

* [앱] [Algorithms: Explained&Animated](https://apps.apple.com/us/app/algorithms-explained-animated/id1047532631)
* [책] [알고리즘 도감](http://www.yes24.com/Product/Goods/58290453)
* [강의] [영리한 프로그래밍을 위한 알고리즘 강좌](https://www.youtube.com/watch?v=ihyg2OR8IR0)
