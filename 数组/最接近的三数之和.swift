/*
    给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。

     

    示例：

    输入：nums = [-1,2,1,-4], target = 1
    输出：2
    解释：与 target 最接近的和是 2 (-1 + 2 + 1 = 2) 。
     

    提示：

    3 <= nums.length <= 10^3
    -10^3 <= nums[i] <= 10^3
    -10^4 <= target <= 10^4


    来源：力扣（LeetCode）
    链接：https://leetcode-cn.com/problems/3sum-closest
    著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/

/*
    解题思路：
    1. 首先数组需要排序
    2. 排序后，如果三个数相加大于


*/

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        nums.sort()
        // 小于等于3 时直接返回数组中所有值的和
        if nums.count <= 3 {
            var temp: Int = 0
            for i in 0 ... nums.count - 1 {
                temp += nums[i]
            }
            return temp
        }

        var best: Int?

        for i in 0 ... nums.count - 1 {
            var small: Int = i
            var big: Int = nums.count - 1 
            var cv = nums[i]
            while  big > small {
                cv + nums[big] + nums[small]
            }

        }

        return 0
    }
}