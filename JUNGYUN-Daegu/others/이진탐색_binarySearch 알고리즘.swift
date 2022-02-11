// Return target index. Returns -1 without result.
// nums is should be an ascendant array
func binarySearch(nums: [Int], target: Int) -> Int {
    var result: Int = -1
    var start: Int = 0
    var end: Int = nums.count
    
    while start <= end {
        let mid = start + ((end - start) / 2)
    
        if nums[mid] == target {
            result = mid
            break
        } else if nums[mid] < target {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return result
}

//let nums = [1, 3, 5 ,6]
//let target = 4
//let nums = [1, 3, 5 ,6]
//let target = 1
let nums = [1, 3, 5 ,6, 7, 8, 9, 11, 999, 9999]
let target = 8

print(binarySearch(nums: nums, target: target))

