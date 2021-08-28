# Data Strucure

### Merge Sort

: Merge Sort 직접 구현해보기


### 코드

```swift
import Foundation

final class MergeSort {

    private var nums : [Int]
    
    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    private func merge(_ left: Int, _ mid: Int, _ right: Int) {
        var temp = [Int]()
        var l = 0, r = 0
        let lLenght = mid - left
        let rLenght = right - mid + 1
        
        /// 병합 정렬 :  왼쪽 오른쪽의 가장 앞의 수 중, 더 작은 수를 temp에 넣음
        while l < lLenght && r < rLenght {
            if nums[left + l] < nums[mid + r] {
                temp.append(nums[left + l])
                l += 1
            } else {
                temp.append(nums[mid + r])
                r += 1
            }
        }
        
        /// 왼쪽 오른쪽 중, 길이가 더 길어서 남은 수들
        while l < lLenght {
            temp.append(nums[left + l])
            l += 1
        }
        while r < rLenght {
            temp.append(nums[mid + r])
            r += 1
        }
        
        /// sorted temp arr -> original arr
        for i in 0..<temp.count {
            nums[left + i] = temp[i]
        }
        
    }
    
    private func mergeSort(left: Int, right: Int) {
        if left >= right { return }
        
        /// divide
        let mid = (left + right) / 2
        mergeSort(left: left, right: mid)
        mergeSort(left: mid + 1, right: right)
        
        /// conquer
        merge(left, mid + 1, right)
    }
    
    func sorted() -> [Int] {
        mergeSort(left: 0, right: nums.count - 1)
        return self.nums
    }
    
    func test() {
        let nums = [7, 11, 4, 9, 10, 3, 15, 2]
        let mergeSort = MergeSort(nums)
        print(mergeSort.sorted() == [2, 3, 4, 7, 9, 10, 11, 15])
    }
    
}
```



### 병합 정렬 설명

- divide & conquer 분할 정복
- ½ 로 계속해서 분할 → 쪼개진 배열을 정렬 → 병합 → 정렬 (반복)
- ½ 로 분할하기 때문에 크기 N 배열을 logN 회 정렬한다
  - ex) 크기 8짜리 배열을 1개짜리 배열이 될 때까지 ½ 씩 나누다 보면  log8,즉 3회 정렬한다
  - 4 & 4 정렬 ← 2 & 2 / 2 & 2 / 2 & 2 / 2 & 2 정렬 ← 1 & 1 / 1 & 1 / ... / 1 & 1 정렬
  - 그런데 각 회마다 배열 크기만큼인 8개의 원소를 비교하게 된다
  - 그러므로 병합정렬의 시간 복잡도는 NlogN
- 추가적인 배열 `temp` 가 필요함

  

### `merge()` 메소드 설명

- 매개변수
  - left [ . . . ] mid [ . . . ] right
  - 정렬할`left`, `mid`, `right` 의 인덱스를 매개변수로 받는다
  - left 부터 mid 까지,  mid 부터 right 까지는 정렬된 상태로, 두 그룹을 정렬할 예정
  - `l`, `r`은 각각 left, mid로부터 이동한 정도를 나타내는 포인터
  - `lLength`, `rLength`는 left [ . . .] mid 그룹, mid [ . . . ] right 그룹의 길이로,
    필요한 만큼 정렬을 수행하기 위한 변수
  - `temp` 는 두 그룹을 병합하여 정렬한 수열을 저장하기 위한 배열
  - `position` 은 `temp` 에 저장하기 위한 인덱스

- 정렬 알고리즘
  - left 부터 mid 까지,  mid 부터 right 까지의 길이는 다를 수 있음
  - 그렇기에, 길이가 짧은 그룹에 맞춰 정렬을 시도하고,
  - 그 정렬은 오른쪽, 왼쪽 그룹 중 더 작은 수를 `temp` 에 넣음으로 시행할 수 있다
  - 남은 길이는 `temp` 에 넣어준다
  - 정렬된 `temp` 를 원래 배열의 위치에 맞게 넣어준다

