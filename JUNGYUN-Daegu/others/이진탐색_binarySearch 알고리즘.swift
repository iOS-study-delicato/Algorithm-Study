
let nums = [1, 3, 5 ,6]
let target = 4

// return target index in nums if any, or return insertion index
func binarySearch(start: Int, end: Int) -> Int {
    
    if end - start < 2 {
        if target <= nums[start] {
            return start
        } else if target < nums[end] {
            return start + 1
        } else if target == nums[end] {
            return end
        } else {
            return end + 1
        }
    }
    
    let mid = start + ((end - start) / 2)
    
    if nums[mid] == target {
        return mid
    } else if nums[mid] > target {
        return binarySearch(start: start, end: mid - 1)
    } else {
        return binarySearch(start: mid + 1, end: end)
    }
}

print(binarySearch(start: 0, end: nums.count - 1))
