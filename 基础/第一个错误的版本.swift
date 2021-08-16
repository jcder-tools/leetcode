/*
    你是产品经理，目前正在带领一个团队开发新的产品。不幸的是，你的产品的最新版本没有通过质量检测。由于每个版本都是基于之前的版本开发的，所以错误的版本之后的所有版本都是错的。

    假设你有 n 个版本 [1, 2, ..., n]，你想找出导致之后所有版本出错的第一个错误的版本。

    你可以通过调用 bool isBadVersion(version) 接口来判断版本号 version 是否在单元测试中出错。实现一个函数来查找第一个错误的版本。你应该尽量减少对调用 API 的次数。

 
    示例 1：

    输入：n = 5, bad = 4
    输出：4
    解释：
    调用 isBadVersion(3) -> false 
    调用 isBadVersion(5) -> true 
    调用 isBadVersion(4) -> true
    所以，4 是第一个错误的版本。
    示例 2：

    输入：n = 1, bad = 1
    输出：1
     

    提示：

    1 <= bad <= n <= 231 - 1

    来源：力扣（LeetCode）
    链接：https://leetcode-cn.com/problems/first-bad-version
    著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/
/*
    解题思路：二分查找，查找最后一个好的版本
*/
class VersionControl {
    func isBadVersion(_ version: Int) -> Bool{
        return version >= 4
    }
}

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var l = 1
        var r = n
        while l <= r {
            // 查找到左侧第一个非坏的版本，返回l
            if isBadVersion(l) {
                print("return l \(isBadVersion(l))")
                return l
            }
            // 查找到右侧第一个不是坏的版本，返回r + 1
            if !isBadVersion(r) {
                print("return r \(isBadVersion(r))")
                return r + 1
            }
            let m = (r - l) / 2 + l
            let b = isBadVersion(m)
            print("l: \(l), r: \(r), m: \(m), b: \(b)")
            if b {
                r = m - 1
            } else {
                l = m + 1
            }
        }
        return -1
    }
}
let i = Solution().firstBadVersion(5)
print(i)