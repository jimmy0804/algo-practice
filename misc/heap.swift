class Heap {
    enum HeapType {
        case max, min
        
        func compare(_ num1: Int, _ num2: Int) -> Bool {
            switch self {
            case .max:
                return num1 > num2
            case .min:
                return num1 < num2
            }
        }
    }

    private var list = [Int]()
    private let heapType: HeapType
    
    init(heapType: HeapType = .min) {
        self.heapType = heapType
    }
    
    func add(_ item: Int) {
        list.append(item)
        heapup(index: list.count - 1)
    }
    
    func pop() -> Int? {
        guard !list.isEmpty else { return nil }

        if list.count == 1 {
            return list.removeLast()
        }
        
        let first = list[0]
        list[0] = list.removeLast()
        heapdown(index: 0)
        return first
    }
    
    func display() -> String {
        guard !list.isEmpty else { return "Empty" }
        var result = [String]()
        var queue = [Int]()
        queue.append(0)
        
        while !queue.isEmpty {
            var level = [String]()
            for _ in 0..<queue.count {
                let index = queue.removeFirst()
                
                level.append(String(list[index]))
                
                if index.left < list.count {
                    queue.append(index.left)
                }
                
                if index.right < list.count {
                    queue.append(index.right)
                }
            }

            result.append(level.joined(separator: " "))
        }
        
        return result.joined(separator: "\n")
    }
    
    private func heapup(index: Int) {
        var i = index

        while i.parent >= 0, heapType.compare(list[i], list[i.parent]) {
            swap(i, i.parent)
            i = i.parent
        }
    }
    
    private func heapdown(index: Int) {
        guard index < list.count else { return }
        var i = index
        
        if index.left < list.count, !heapType.compare(list[index], list[index.left]) {
            i = index.left
        }
        
        if index.right < list.count, !heapType.compare(list[i], list[index.right]) {
            i = index.right
        }
        
        if i <= index {
            return
        }
        
        swap(index, i)
        heapdown(index: i)
    }
    
    private func swap(_ index: Int, _ index2: Int) {
        let temp = list[index]
        list[index] = list[index2]
        list[index2] = temp
    }
}

extension Int {
    var left: Int {
        self * 2 + 1
    }
    
    var right: Int {
        self * 2 + 2
    }
    
    var parent: Int {
        (self - 1) / 2
    }
}

let heap = Heap(heapType: .max)

heap.add(2)
heap.add(22)
heap.add(1)
heap.add(56)
heap.add(8)
heap.add(100)
heap.add(4)
heap.add(12)

heap.display()

heap.pop()
heap.pop()
heap.pop()
heap.pop()
heap.pop()
heap.pop()
heap.pop()
heap.pop()
heap.pop()

heap.display()
