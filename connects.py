import looker_sdk

# Initialize the Looker SDK with API 4.0
sdk = looker_sdk.init40()

try:
    # Retrieve all connections
    connections = sdk.all_connections()

    # Print the name of each connection
    for connection in connections:
        print(connection.name)

except Exception as e:
    print(f"Error occurred: {e}")