
class Graph:
    def __init__(self, vertices):
        self.vertices = vertices
        self.graph = []
    
    def addEdge(self, v1, v2, weight):
        edgeToAdd = (v1, v2, weight)
        self.graph.append(edgeToAdd)
    
    def find(self, parent, v1):
        if parent[v1] == -1:
            return v1
        else:
            return self.find(parent, parent[v1])

    def union(self, parent, v1, v2):
        x = self.find(parent, v1)
        y = self.find(parent, v2)
        parent[x] = y
    
    def minimumSpanningTree(self):
        parent = [-1] * self.vertices

        # Sort by weight
        self.graph.sort(key=lambda x: x[2])

        currentVertice = 0
        connectedEdges = 0

        spanningTree = []

        while connectedEdges < self.vertices - 1:
            i, j, weight = self.graph[currentVertice]
            v1 = self.find(parent, i)
            v2 = self.find(parent, j)
            currentVertice += 1
            if v1 == v2:
                continue
            
            self.union(parent, v1, v2)
            connectedEdges += 1
            spanningTree.append((v1, v2))

        return spanningTree


g = Graph(5)
g.addEdge(0, 1, 10)
g.addEdge(0, 2, 6)
g.addEdge(0, 3, 5)
g.addEdge(1, 3, 15)
g.addEdge(2, 3, 4)

print(g.minimumSpanningTree())
