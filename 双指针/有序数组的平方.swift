/*
    给你一个按 非递减顺序 排序的整数数组 nums，返回 每个数字的平方 组成的新数组，要求也按 非递减顺序 排序。

     

    示例 1：

    输入：nums = [-4,-1,0,3,10]
    输出：[0,1,9,16,100]
    解释：平方后，数组变为 [16,1,0,9,100]
    排序后，数组变为 [0,1,9,16,100]
    示例 2：

    输入：nums = [-7,-3,2,3,11]
    输出：[4,9,9,49,121]
     

    提示：

    1 <= nums.length <= 104
    -104 <= nums[i] <= 104
    nums 已按 非递减顺序 排序
     

    进阶：

    请你设计时间复杂度为 O(n) 的算法解决本问题

    来源：力扣（LeetCode）
    链接：https://leetcode-cn.com/problems/squares-of-a-sorted-array
    著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/

/*  
    解题思路：
    1. 非递减顺序
    2. 大于0的平方，item 越大,平方越大
    3. 小于0的平方，item越小，平方越小
    从两边遍历，每次取大的值插到前面

*/

class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var l = 0
        var r = nums.count - 1
        var ans: [Int] = []
        while l <= r {
            let lv = nums[l]
            let rv = nums[r]
            if lv * lv <= rv * rv {
                ans.insert(rv * rv, at: 0)
                r = r - 1
            } else {
                ans.insert(lv * lv, at: 0)
                l = l + 1
            }
        } 
        return ans      
    }
}

let nums = [-4,-1,0,3,10]
let t = Solution().sortedSquares(nums)
print(t)
