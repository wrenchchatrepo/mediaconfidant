# Agentic System Overview with Knowledge Graph Visualizer

![image](https://github.com/user-attachments/assets/84ff1d31-90b7-453e-ac6e-6b0c7cac9c33)

**User Prompt:**

“Please write the steps and code needed to get data from my GA4 account into my BQ instance and modeled in Looker.”

## Agentic System Overview with Knowledge Graph Visualizer:

1.	Request Reception and Processing:
•	User Input: The system receives the user’s request through the Streamlit interface.
•	AI Model Selection: The system uses the AI models integrated into the Knowledge Graph Visualizer (Claude, GPT-4, etc.) to process the input and extract relevant entities and relationships.
2.	Knowledge Graph Creation Using NetworkX:
•	Source Identification: The system identifies relevant sources (e.g., LookML/SQLX/SQL files, README.md files) and uses the AI models to extract entities and relationships from these documents.
•	Entity and Relationship Mapping: The Knowledge Graph Visualizer creates a graph using NetworkX, representing the entities (e.g., GA4, BigQuery, Looker) and their relationships. Relevant sources (e.g., LookML/SQLX/SQL files, README.md files) are stored in Google Cloud Storage (GCS): 

```gsutil ls gs://your-project-bucket/looker/
gsutil cp gs://your-project-bucket/looker/model.lookml .
```

•	Graph Visualization: The graph is visualized using Pyvis within the Streamlit app, allowing users to interact with the knowledge graph.
3.	Solution Formulation Using Knowledge Graph:
•	Graph Traversal: The system traverses the knowledge graph to identify relevant paths and relationships that will help in solving the user’s problem.
•	Context-Aware Reasoning: The extracted entities and relationships help in generating the required SQLX/SQL code and LookML models, with the system reasoning based on the relationships defined in the graph.
4.	Output and Feedback:
•	Solution Delivery: The generated steps and code are presented through the Streamlit interface, with options to download the code or explore the knowledge graph further.
•	Interactive Feedback: Users can refine their queries and get updated results based on the updated graph or new inputs.
5.	Continuous Improvement:
•	History and System Messages: The system can maintain a session-based history of user interactions to refine future responses, similar to how chat history is managed in a conversational agent.

## Steps to Create the Environment with Knowledge Graph Visualizer:

1.	Set Up the Python Environment:
•	Install Python (if not already installed).
•	Create a Virtual Environment:

```python -m venv graph_env
source graph_env/bin/activate  # On Windows, use `graph_env\Scripts\activate
```

•	Install Dependencies from requirements.txt:

`pip install -r /path/to/requirements.txt`

2.	Set Up API Keys (if using AI models):
•	Obtain API keys for AI models (e.g., OpenAI, Anthropic).
•	Set them as environment variables or directly in the application.
3.	Configure and Run the Streamlit App:
•	Place the knowledge_graph_st.py script in your working directory.
•	Run the Streamlit app:

`streamlit run knowledge_graph_st.py`

4.	Customize Entity and Relationship Extraction:
•	Modify the AI model prompts and extraction logic in the knowledge_graph_st.py script to suit your data sources (e.g., GA4, BigQuery documentation).
•	Configure how entities and relationships are mapped in the graph, ensuring that the connections relevant to your use case (e.g., GA4 → BigQuery → Looker) are captured accurately.
5.	Visualize and Explore the Graph:
•	Use the interactive Pyvis visualization to explore the knowledge graph generated from your documents.
•	Allow users to interact with the graph, explore nodes and edges, and understand the connections between different entities.
6.	Generate and Present Solutions:
•	Based on the extracted relationships, generate SQLX/SQL code and LookML models.
•	Present these solutions in the Streamlit interface, with options to download the output or get further explanations.
7.	Iterate and Improve:
•	Collect user feedback to refine the entity extraction and relationship mapping process.
•	Continuously update the system with new data sources and improve the reasoning capabilities based on the knowledge graph.

## Combined Information Flow and Process Description:

1.	User Request Initiation:
•	The process begins when the user submits a request through the Knowledge Graph Visualizer interface. For example, the user asks, “Please write the steps and code needed to get data from my GA4 account into my BQ instance and modeled in Looker.”
2.	Data Retrieval from Google Cloud Storage (GCS):
•	Upon receiving the request, the system identifies and retrieves relevant files stored in GCS. These files may include LookML, SQLX, SQL scripts, and documentation (e.g., README.md files) that define data models and processing steps.
•	The system uses gsutil commands or GCS APIs to access these files. For example:
3.	Entity and Relationship Extraction:
•	Once the files are retrieved, AI models such as GPT-4 or Claude process them to extract relevant entities and relationships. Entities might include GA4, BigQuery, and Looker, while relationships define how these entities interact (e.g., GA4 data flows into BigQuery, which is then modeled in Looker).
•	The system parses the LookML, SQL, and documentation files to identify key data flows and dependencies.
4.	Knowledge Graph Construction:
•	Using the extracted entities and relationships, the system constructs a knowledge graph using NetworkX. This graph represents the connections between GA4, BigQuery, and Looker, visualizing how data moves and transforms across these components.
•	Pyvis is employed to create an interactive visualization of this graph within the Streamlit interface, allowing users to explore the relationships and data flows.
5.	Reasoning and Code Generation with Vertex AI:
•	The system then invokes Vertex AI’s Gemini 1.5 model to reason about the user’s query within the context of the constructed knowledge graph.
•	Leveraging the relationships in the graph, the system generates the necessary SQL code to load data from GA4 into BigQuery and creates LookML code to model that data in Looker.
6.	Solution Presentation:
•	The generated steps and code are presented to the user within the Knowledge Graph Visualizer interface. Users can interact with the knowledge graph to better understand the relationships and data flows.
•	The system also provides options for the user to download the generated SQL and LookML code or view the extracted entities and their relationships in detail.
7.	Interactive Feedback Loop:
•	If the user requires further refinement or additional steps, they can provide feedback directly through the interface. For example, they might ask for more specific code or details about a particular step in the process.
•	The system reprocesses the request, updating the knowledge graph and regenerating the necessary code based on the new input. The user is then presented with the refined solution.
8.	Final Output and User Confirmation:
•	Once the user is satisfied with the output, they can confirm the solution and proceed with implementing the generated steps in their GA4, BigQuery, and Looker environments.
•	The system ensures that the final output is accurate and ready for deployment, providing any additional documentation or support needed for the implementation.
