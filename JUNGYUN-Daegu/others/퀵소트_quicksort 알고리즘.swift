var nums = readLine()!.split(separator: " ").map { Int($0)! }

// Ascendant Sorting
func quickSort(start: Int, end: Int) {
    
    if start >= end {
        return
    }
    
    let pivot = start
    
    var left = start + 1
    var right = end
    
    while left <= right {
        
        // for descendant sort: 'while left <= end && nums[left] >= nums[pivot]'
        while left <= end && nums[left] <= nums[pivot] {
            left += 1
        }
        // for descendant sort: 'while right > start && nums[right] <= nums[pivot]'
        while right > start && nums[right] >= nums[pivot] {
            right -= 1
        }
        
        if left < right {
            nums.swapAt(left, right)
        } else {
            nums.swapAt(pivot, right)
        }
        
        quickSort(start: pivot, end: right - 1)
        quickSort(start: right + 1, end: end)
    }
    
}
    
quickSort(start: 0, end: nums.count - 1)
print(nums)



