class Solution {
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return -1
        }
        if nums.count == 1 {
            return nums[0] == target ? 0 : -1
        }
        var l = 0
        var r = nums.count - 1
        while l <= r {
            
            let m = (r - l) / 2 + l
            print("l: \(l), r: \(r), m: \(m), mv: \(nums[m]), tv: \(target)")

            if nums[m] > target {
                r = m - 1

            } else if nums[m] < target {
                l = m + 1
            } else if nums[m] == target {
                return m
            }
        }
        return -1
    }
}


let nums = [2,5]
let t = 5
let i = Solution().search(nums, t)
print(i)
