import logging
from google.api_core.exceptions import ResourceExhausted, AlreadyExists, NotFound
from google.cloud import aiplatform

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

# Initialize the AI Platform client
api_client = aiplatform.gapic.ModelServiceClient()

def check_model_exists(model_name):
    try:
        model = api_client.get_model(name=model_name)
        logger.info(f"Model '{model_name}' already exists.")
        return True
    except NotFound:
        logger.info(f"Model '{model_name}' not found, ready to create new model.")
        return False

def upload_model(model_name, model_data):
    try:
        if not check_model_exists(model_name):
            # Attempt to upload the model
            model_response = api_client.upload_model(
                parent=f"projects/{your_project_id}/locations/{your_location}",
                model=model_data
            )
            logger.info(f"Model '{model_name}' uploaded successfully.")
        else:
            logger.info(f"Skipping upload for '{model_name}' as it already exists.")
    except AlreadyExists as e:
        logger.error(f"Entity already exists error: {e}")
    except ResourceExhausted as e:
        logger.error(f"Quota exceeded error: {e}")
        logger.error("You may need to request a quota increase or reduce request frequency.")
    except NotFound as e:
        logger.error(f"Resource not found error: {e}")
    except Exception as e:
        logger.error(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    model_name = "your_model_name"
    model_data = {}  # Replace with actual model data
    upload_model(model_name, model_data)