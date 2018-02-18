/*
Clone an undirected graph. Each node in the graph contains a label and a list of its neighbors.
*/

/**
 * Definition for undirected graph.
 * struct UndirectedGraphNode {
 *     int label;
 *     vector<UndirectedGraphNode *> neighbors;
 *     UndirectedGraphNode(int x) : label(x) {};
 * };
 */
UndirectedGraphNode *Solution::cloneGraph(UndirectedGraphNode *node) {
    map<UndirectedGraphNode*, UndirectedGraphNode*> m;
    queue<UndirectedGraphNode*> q;
 
    // Enqueue src node
    q.push(node);
    UndirectedGraphNode *newnode;
 
    // Make a clone Node
    newnode = new UndirectedGraphNode(node->label);
    
 
    // Put the clone node into the Map
    m[node] = newnode;
    while (!q.empty())
    {
        //Get the front node from the queue
        //and then visit all its neighbours
        UndirectedGraphNode *u = q.front();
        q.pop();
        vector<UndirectedGraphNode *> v = u->neighbors;
        int n = v.size();
        for (int i = 0; i < n; i++)
        {
            // Check if this node has already been created
            if (m[v[i]] == NULL)
            {
                // If not then create a new Node and
                // put into the HashMap
                newnode = new UndirectedGraphNode(v[i]->label);
                m[v[i]] = newnode;
                q.push(v[i]);
            }
 
            // add these neighbours to the cloned graph node
            m[u]->neighbors.push_back(m[v[i]]);
        }
    }
 
    // Return the address of cloned src Node
    return m[node];
}
