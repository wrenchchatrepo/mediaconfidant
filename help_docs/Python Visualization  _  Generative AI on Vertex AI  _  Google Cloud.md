Try Gemini 1.5 models (https://console.cloud.google.com/vertex-ai/generative/multimodal/create/text), our newest multimodal models in Vertex AI, and see what you can build with a 1M token context window.

## Python Visualization

Write Python code to visualize a weighted directed graph with example data You can query a model directly and test the results returned when using different parameter values with the Cloud console, or by calling th Vertex AI API directly.

For an example of using the Vertex AI API, see Quickstart using the Vertex AI API
 (/vertex-ai/generative-ai/docs/start/quickstarts/api-quickstart).

To view this sample in the Cloud console:
Go to Google Cloud console (https://console.cloud.google.com/vertex-ai/generative/language/prompt-examples/Python%20visualiz

| Prompt                                                                                                                                                              | Freeform                        | Model:gemini-1.5-flash-0   |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------|----------------------------|
| Temperature:1                                                                                                                                                       |                                 |                            |
| Write Python code to draw a directed graph using matplotlib and networkx. Show how to use the code with some example data. Include all necessary import statements. | Max output 8192 tokens: TopK:40 |                            |
| Response                                                                                                                                                            | TopP:0.95                       |                            |

import matplotlib.pyplot as plt import networkx as nx
\# Example data: a directed graph with nodes and edges nodes = ['A', 'B', 'C', 'D', 'E']
edges = [('A', 'B'), ('A', 'C'), ('B', 'D'), ('C', 'E'), ('D', 'E')]
\# Create a directed graph object graph = nx.DiGraph() \# Add nodes to the graph graph.add_nodes_from(nodes)
\# Add edges to the graph graph.add_edges_from(edges)
\# Draw the graph using matplotlib nx.draw(graph, with_labels=True, node_color='lightblue', node_size=500, fo \# Display the graph Explanation:
1. **Import necessary libraries:**
2. matplotlib.pyplot for plotting the graph.

3. networkx for creating and manipulating the graph.

4. **Define example data:**
5. nodes: A list of node names. 6. edges: A list of tuples representing directed edges, where each tuple is (source node, target node).

7. **Create a directed graph object:**
8. graph = nx.DiGraph(): Creates an empty directed graph object.

9. **Add nodes and edges:**
10. graph.add_nodes_from(nodes): Adds all nodes from the nodes list to the graph. 11. graph.add_edges_from(edges): Adds all edges from the edges list to the graph.

12. **Draw the graph:**
13. nx.draw(graph, ...): Draws the graph using matplotlib. 14. with_labels=True: Displays node labels. 16. node_size=500: Sets the node size. 17. font_size=10: Sets the font size for labels. 18. arrowsize=20: Sets the arrow size for edges. 19. **Display the graph:** 20. plt.show(): Shows the plotted graph.

Output:
This code will generate a directed graph visualization with the specified nodes and edges. The nodes will be labeled, colored light blue, and connected by arrows representing the direction of the edges.

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License
 (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-06-20 UTC.

15. node_color='lightblue': Sets the node color to light blue.