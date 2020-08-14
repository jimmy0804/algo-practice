/**
 Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.

 The same repeated number may be chosen from candidates unlimited number of times.
 */
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var temp = [Int]()
        
        dfs(candidates.sorted(), &temp, target, 0,  &result)
        
        return result
    }
    
    private func dfs(_ candidates: [Int],
                     _ partialResult: inout [Int],
                     _ target: Int,
                     _ start: Int,
                     _ result: inout [[Int]]) {
        guard target >= 0 else { return }

        if target == 0 {
            result.append(partialResult)
            return
        }
        
        for i in start..<candidates.count {
            let candidate = candidates[i]
            
            partialResult.append(candidate)
            dfs(candidates, &partialResult, target - candidate, i, &result)
            partialResult.removeLast()
        }
    }
}
