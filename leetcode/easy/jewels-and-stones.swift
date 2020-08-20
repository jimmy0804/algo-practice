/**
 Runtime: 12 ms, faster than 22.46% of Swift online submissions for Jewels and Stones.
 Memory Usage: 21.5 MB, less than 7.69% of Swift online submissions for Jewels and Stones.
 */
class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        let jewelsMap = J.reduce(into: [Character: Character](), { $0[$1] = $1 })
        return S.filter { jewelsMap[$0] != nil }.count
    }
}
