class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        return topDownMergeSort(nums)
    }
    
    private func topDownMergeSort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }
        let mid = nums.count / 2
        let sortedLeft = topDownMergeSort(Array(nums[0..<mid]))
        let sortedRight = topDownMergeSort(Array(nums[mid..<nums.count]))
        return merge(sortedLeft, sortedRight)
    }
    
    private func merge(_ first: [Int], _ second: [Int]) -> [Int] {
        var result = [Int]()
        var i = 0
        var j = 0
        
        while i < first.count && j < second.count {
            let firstNum = first[i]
            let secondNum = second[j]
            
            if firstNum < secondNum {
                result.append(firstNum)
                i += 1
            } else {
                result.append(secondNum)
                j += 1
            }
        }
        
        if !first.isEmpty {
            while i < first.count {
                result.append(first[i])
                i += 1
            }
        }
        
        if !second.isEmpty {
            while j < second.count {
                result.append(second[j])
                j += 1
            }
        }
        
        return result
    }
}
