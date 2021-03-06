import Foundation
/*
 请你来实现一个 myAtoi(string s) 函数，使其能将字符串转换成一个 32 位有符号整数（类似 C/C++ 中的 atoi 函数）。

 函数 myAtoi(string s) 的算法如下：

 读入字符串并丢弃无用的前导空格
 检查下一个字符（假设还未到字符末尾）为正还是负号，读取该字符（如果有）。 确定最终结果是负数还是正数。 如果两者都不存在，则假定结果为正。
 读入下一个字符，直到到达下一个非数字字符或到达输入的结尾。字符串的其余部分将被忽略。
 将前面步骤读入的这些数字转换为整数（即，"123" -> 123， "0032" -> 32）。如果没有读入数字，则整数为 0 。必要时更改符号（从步骤 2 开始）。
 如果整数数超过 32 位有符号整数范围 [−2^31,  2^31 − 1] ，需要截断这个整数，使其保持在这个范围内。具体来说，小于 −2^31 的整数应该被固定为 −2^31 ，大于 2^31 − 1 的整数应该被固定为 2^31 − 1 。
 返回整数作为最终结果。
 注意：

 本题中的空白字符只包括空格字符 ' ' 。
 除前导空格或数字后的其余字符串外，请勿忽略 任何其他字符。
  

 示例 1：

 输入：s = "42"
 输出：42
 解释：加粗的字符串为已经读入的字符，插入符号是当前读取的字符。
 第 1 步："42"（当前没有读入字符，因为没有前导空格）
          ^
 第 2 步："42"（当前没有读入字符，因为这里不存在 '-' 或者 '+'）
          ^
 第 3 步："42"（读入 "42"）
            ^
 解析得到整数 42 。
 由于 "42" 在范围 [-2^31, 2^31 - 1] 内，最终结果为 42 。
 示例 2：

 输入：s = "   -42"
 输出：-42
 解释：
 第 1 步："   -42"（读入前导空格，但忽视掉）
             ^
 第 2 步："   -42"（读入 '-' 字符，所以结果应该是负数）
              ^
 第 3 步："   -42"（读入 "42"）
                ^
 解析得到整数 -42 。
 由于 "-42" 在范围 [-2^31, 2^31 - 1] 内，最终结果为 -42 。
 示例 3：

 输入：s = "4193 with words"
 输出：4193
 解释：
 第 1 步："4193 with words"（当前没有读入字符，因为没有前导空格）
          ^
 第 2 步："4193 with words"（当前没有读入字符，因为这里不存在 '-' 或者 '+'）
          ^
 第 3 步："4193 with words"（读入 "4193"；由于下一个字符不是一个数字，所以读入停止）
              ^
 解析得到整数 4193 。
 由于 "4193" 在范围 [-2^31, 2^31 - 1] 内，最终结果为 4193 。
 示例 4：

 输入：s = "words and 987"
 输出：0
 解释：
 第 1 步："words and 987"（当前没有读入字符，因为没有前导空格）
          ^
 第 2 步："words and 987"（当前没有读入字符，因为这里不存在 '-' 或者 '+'）
          ^
 第 3 步："words and 987"（由于当前字符 'w' 不是一个数字，所以读入停止）
          ^
 解析得到整数 0 ，因为没有读入任何数字。
 由于 0 在范围 [-2^31, 2^31 - 1] 内，最终结果为 0 。
 示例 5：

 输入：s = "-91283472332"
 输出：-2147483648
 解释：
 第 1 步："-91283472332"（当前没有读入字符，因为没有前导空格）
          ^
 第 2 步："-91283472332"（读入 '-' 字符，所以结果应该是负数）
           ^
 第 3 步："-91283472332"（读入 "91283472332"）
                      ^
 解析得到整数 -91283472332 。
 由于 -91283472332 小于范围 [-2^31, 2^31 - 1] 的下界，最终结果被截断为 -2^31 = -2147483648 。
  

 提示：

 0 <= s.length <= 200
 s 由英文字母（大写和小写）、数字（0-9）、' '、'+'、'-' 和 '.' 组成

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/string-to-integer-atoi
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/*
    解题思路：
    1. 正整数符号一般会在第一位，如果第一位没有则默认正数
    2. 如果超过Int32的最大值，则返回最大值，小于Int32的最小值返回最小值，注意边界情况
    3. 非数字在中间，则返回当前的值
 */

class Solution1 {
     func myAtoi(_ s: String) -> Int {
            var numStr = ""
            var isF: Bool = false
            var isC: Bool = false

            for (_ ,c) in s.enumerated() {
                if c.isNumber {
                    numStr.append(c)
                } else if (c == "-" || c == "+") && !isC {
                    if numStr.count > 0 {
                            break
                    }
                    isC = true
                    if c == "-" {
                        isF = true
                    }
                } else if c == " "  {
                    if numStr.count > 0 || isC {
                            break
                    }
                }else {
                    break
                }
            }
            
            if let num = Double(numStr) {
                var fNum = num
                if isF {
                    fNum = -num
                }
                if fNum < Double(-(1<<31)) {
                    return -(1<<31)
                } else if fNum >= Double((1<<31)) {
                    return (1<<31) - 1
                } else {
                    return Int(fNum)
                }
            }
        return 0
            
    }
}
class Solution2 {

    func myAtsoi(_ s: String) -> Int {
        let s = s.trimmingCharacters(in: .whitespaces)
        var num: Int = 0
        var sign: Int = 1
        let max: Int = Int(Int32.max)
        let min: Int = Int(Int32.min)
        for c in s.enumerated() {
            print(c)
            // 如果c是数字则原本num * 10 并加 c
            if c.element.isNumber, let v = Int(String(c.element)) {
                num = num * 10 + v
                if num > max {
                    if sign == 1 {
                        return max
                    } else {
                        return min
                    }
                }

            } else if ["-", "+"].contains(c.element) {
                // 符号不在第一位时直接返回0
                if c.offset != 0 {
                    return num * sign
                }
                
                if c.element == "+"{
                    sign = 1
                } else {
                    sign = -1
                }
            } else {
                print("异常")
                return num * sign
            }
            
        }
        return num * sign
    }
}

class Solution3 {

    enum TOIState {
        case start, num, end
    }

    func myAtoi(_ s: String) -> Int {
        var characters: [Character] = []
        var state = TOIState.start
        var isNegative = false
        for c in s {
            if c.isWhitespace && state == .start {
                continue
            } else if c == "-" && state == .start {
                state = .num
                isNegative = true
            } else if c == "+" && state == .start {
                state = .num
                isNegative = false
            } else if c.isNumber {
                if state == .num {
                    characters.append(c)
                } else if state == .start {
                    state = .num
                    isNegative = false
                    characters.append(c)
                } else {
                    state = .end
                    break
                }
            } else {
                state = .end
                break
            }
        }
        guard characters.count > 0 else { return 0 }
        var num = Int(String(characters)) ?? Int.max
        if isNegative {
            num = -num
            if num < Int32.min {
                return Int(Int32.min)
            }
        }
        if num > Int32.max {
            return Int(Int32.max)
        }
        return num
    }
}