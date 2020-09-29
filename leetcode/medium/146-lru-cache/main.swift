/*
 146. LRU Cache
 
 Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

 Implement the LRUCache class:

 LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
 int get(int key) Return the value of the key if the key exists, otherwise return -1.
 void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.

 Follow up:
 Could you do get and put in O(1) time complexity?
 
 */
class LinkedListNode {
    var next: LinkedListNode?
    var prev: LinkedListNode?
    let key: Int
    var value: Int
    
    init(key: Int = -1, value: Int = -1, next: LinkedListNode? = nil, prev: LinkedListNode? = nil) {
        self.key = key
        self.value = value
        self.next = next
        self.prev = prev
    }
}

class LRUCache {
    
    private var map: [Int: LinkedListNode]
    private var head: LinkedListNode
    private var tail: LinkedListNode
    private let capacity: Int
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.map = [Int: LinkedListNode]()
        
        let head = LinkedListNode()
        let tail = LinkedListNode()
        head.next = tail
        tail.prev = head

        self.head = head
        self.tail = tail
    }
    
    func get(_ key: Int) -> Int {
        guard let node = map[key] else { return -1 }
        
        remove(node: node)
        insert(node: node)

        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        // 1. Key exist in map, simply change the value of the existing node and rank it to top
        if let existingNode = map[key] {
            map[key]?.value = value
            remove(node: existingNode)
            insert(node: existingNode)
            return
        }
        
        // 2. Still has capacity, simply add it to linked list and map
        if map.count < capacity {
            let newNode = LinkedListNode(key: key, value: value)
            map[key] = newNode
            insert(node: newNode)
            return
        }
        
        // 3. No capacity and key not found
        // remove node that is 1 higher than tail and from map, then insert to list and map
        
        let newNode = LinkedListNode(key: key, value: value)
        if let leastUsedNode = tail.prev {
            map[leastUsedNode.key] = nil
            remove(node: leastUsedNode)
        }
        
        map[key] = newNode
        insert(node: newNode)
    }
    
    private func insert(node: LinkedListNode) {
        let headNext = head.next
        head.next = node
        node.prev = head
        node.next = headNext
        headNext?.prev = node
    }
    
    private func remove(node: LinkedListNode) {
        let prev = node.prev
        let next = node.next
        
        prev?.next = next
        next?.prev = prev
        
        node.prev = nil
        node.next = nil
    }
}

        
        
    
    
