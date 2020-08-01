/*
 Given a collection of distinct integers, return all possible permutations.
 */
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        permutation(nums, [], &result)
        return result
    }

    //    (23, 1)          (13, 2)         (12, 3)          3
    // (3, 12)(2, 13)| (3, 21)(1, 23) | (2, 31)(1, 32)      6
    //   123    132      213     231      312    321        6
    //
    // Time Complexity: O(n!), Space Complxity: O(n!)
    private func permutation(_ remaining: [Int],
                             _ partialResult: [Int],
                             _ result: inout [[Int]]) {
        guard remaining.count > 0 else {
            result.append(partialResult)
            return
        }

        for (index, num) in remaining.enumerated() {
            var remain = remaining
            let removed = remain.remove(at: index)
            
            var partial = partialResult
            partial.append(removed)

            permutation(remain, partial, &result)
        }
    }
}
