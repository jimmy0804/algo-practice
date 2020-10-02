/*
 895. Maximum Frequency Stack
 
 Implement FreqStack, a class which simulates the operation of a stack-like data structure.

 FreqStack has two functions:

 push(int x), which pushes an integer x onto the stack.
 pop(), which removes and returns the most frequent element in the stack.
 If there is a tie for most frequent element, the element closest to the top of the stack is removed and returned.
 
 Time complexity: O(1)
 Space complexity: O(1)
 */

class FreqStack {

    // 5 7 5 4 7 5
    
    // [0: 5, 7, 4]
    // [1: 5, 7]
    // [2: 5]
    
    private var occurrenceTable = [Int: Int]()
    private var tableOfStacks = [[Int]]()
    
    init() {
        
    }
    
    func push(_ x: Int) {
        if occurrenceTable[x] != nil {
            occurrenceTable[x]! += 1
        } else {
            occurrenceTable[x] = 1
        }
        
        if occurrenceTable[x]! > tableOfStacks.count {
            tableOfStacks.append([x])
        } else {
            tableOfStacks[occurrenceTable[x]! - 1].append(x)
        }
    }
    
    func pop() -> Int {
        guard let last = tableOfStacks.last?.last else { return -1 }

        tableOfStacks[tableOfStacks.count - 1].removeLast()
        occurrenceTable[last]! -= 1

        if let count = occurrenceTable[last], count == 0 {
            occurrenceTable[last] = nil
        }

        if tableOfStacks[tableOfStacks.count - 1].isEmpty {
            tableOfStacks.removeLast()
        }

        return last
    }
}
