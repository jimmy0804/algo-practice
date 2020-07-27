/**
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

 push(x) -- Push element x onto stack.
 pop() -- Removes the element on top of the stack.
 top() -- Get the top element.
 getMin() -- Retrieve the minimum element in the stack.
 */
class MinStack {
    
    private var stack = [Int]()
    private var mins = [Int]()

    /** initialize your data structure here. */
    init() {
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if mins.isEmpty {
           mins.append(x)
        } else if x <= mins.last! {
            mins.append(x)
        }
    }
    
    func pop() {
        let last = stack.removeLast()
        
        if last == getMin() {
            mins.removeLast()
        }
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func getMin() -> Int {
        return mins.last!
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
