/**
 1282. Group the People Given the Group Size They Belong To
 Runtime: 68 ms, faster than 97.87% of Swift online submissions for Group the People Given the Group Size They Belong To.
 Memory Usage: 21.3 MB, less than 100.00% of Swift online submissions for Group the People Given the Group Size They Belong To.
 */
class Solution {
    func groupThePeople(_ groupSizes: [Int]) -> [[Int]] {
        var output = [[Int]]()
        var groupMap = [Int: [Int]]()
        for (id, groupSize) in groupSizes.enumerated() {
            if let group = groupMap[groupSize] {
                let isGroupFull = group.count >= groupSize
                if isGroupFull {
                    output.append(group)
                    groupMap[groupSize] = [id]
                } else {
                    groupMap[groupSize]?.append(id)
                }
            } else {
                groupMap[groupSize] = [id]
            }
        }
        
        
        for (_, group) in groupMap {
            output.append(group)
        }

        return output
    }
}
