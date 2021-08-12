/*  
    给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。

    请必须使用时间复杂度为 O(log n) 的算法。

     

    示例 1:

    输入: nums = [1,3,5,6], target = 5
    输出: 2
    示例 2:

    输入: nums = [1,3,5,6], target = 2
    输出: 1
    示例 3:

    输入: nums = [1,3,5,6], target = 7
    输出: 4
    示例 4:

    输入: nums = [1,3,5,6], target = 0
    输出: 0
    示例 5:

    输入: nums = [1], target = 0
    输出: 0
     

    提示:

    1 <= nums.length <= 104
    -104 <= nums[i] <= 104
    nums 为无重复元素的升序排列数组
    -104 <= target <= 104

    来源：力扣（LeetCode）
    链接：https://leetcode-cn.com/problems/search-insert-position
    著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/

/*  
    解题思路，二分法寻找第一个大于或者等于target的元素
    let nums = [1,3,5,6], target = 5
    l = 0, r = 3, m = 1, mv = 3, t > mv, l = m + 1
    l = 1, r = 3, m = 2, mv = 5, t = mv, return m

    let nums = [1,3,5,6], target = 2
    l = 0, r = 3, m = 1, mv = 3, t < mv, r = m - 1
    l = 0, r = 0, m = , mv = 5, t = mv, return 
*/

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1
        if nums.count == 0 {
            return 0
        }
        if nums[0] > target {
            return 0
        }
        var a = nums.count
        if nums[nums.count - 1] < target {
            return nums.count
        }

        while l <= r {
            let m = l + (r - l) / 2
            print("l: \(l), r: \(r), m: \(m), mv: \(nums[m]), tv: \(target)")
            if nums[m] > target {
                a = m
                r = m - 1
            } 
            // 取到的值小于
            else if nums[m] < target {
                l = m + 1
            }
            // 相等时返回m
            else {
                return m
            }
        }


        return a
    }
}

// let nums = [1,3,5,6], target = 5
// let nums = [1,3,5,6], target = 2
let nums = [1,3,5,6], target = 7
// let nums = [1], target = 0
let i = Solution().searchInsert(nums, target)
print(i)