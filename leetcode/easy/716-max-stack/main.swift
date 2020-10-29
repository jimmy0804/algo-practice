/**
 716. Max Stack
 
 Design a max stack that supports push, pop, top, peekMax and popMax.

 push(x) -- Push element x onto stack.
 pop() -- Remove the element on top of the stack and return it.
 top() -- Get the element on the top.
 peekMax() -- Retrieve the maximum element in the stack.
 popMax() -- Retrieve the maximum element in the stack, and remove it. If you find more than one maximum elements, only remove the top-most one.
 
 Time complexity: O(n)
 Space complexity: O(n)
 */

class MaxStack {
    
    // stack max: 2, 2, 3
    // stack regular: 2, 1, 3

    private var maxStack = [Int]()
    private var stack = [Int]()

    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        let currentMax = maxStack.last ?? x
        
        maxStack.append(max(currentMax, x))
        stack.append(x)
    }
    
    func pop() -> Int {
        maxStack.removeLast()
        return stack.removeLast()
    }
    
    func top() -> Int {
        return stack.last ?? -1
    }
    
    func peekMax() -> Int {
        return maxStack.last ?? -1
    }
    
    func popMax() -> Int {
        let toBeRemovedMax = peekMax()
        var cache = [Int]()
        while top() != toBeRemovedMax {
            cache.append(pop())
        }

        if !stack.isEmpty {
            pop()
        }
        
        for c in cache.reversed() {
            push(c)
        }
        
        return toBeRemovedMax
    }
}

/**
 * Your MaxStack object will be instantiated and called as such:
 * let obj = MaxStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.peekMax()
 * let ret_5: Int = obj.popMax()
 */
