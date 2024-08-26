
## Gemini Api Overview

The Gemini API gives you access to the latest generative models from Google. Once you're familiar with the general features available to you through the API, try a tutorial for your language of choice to start developing.

Note: If you're new to generative AI models, visit the generative models guide (/gemini-api/docs/models/generative-models) or start prototyping your prompts in the Google AI Studio (https://aistudio.google.com).

## Models

Gemini is a series of multimodal generative AI models developed by Google. Gemini models can accept text and image in prompts, depending on what model variation you choose, and output text responses. To get more detailed model information refer to the Gemini models (/gemini-api/docs/models/gemini) page. You can also use the list_models (/api/python/google/generativeai/list_models) method to list all the models available and then the get_model (/api/python/google/generativeai/get_model) method to get the metadata for a particular model.

## Prompt Data And Design

Specific Gemini models accept both text data and media files as input. This capability creates many additional possibilities for generating content, analyzing data, and solving problems. There are some limitations and requirements to consider, including the general input token limit for the model you are using. For information on the token limits for specific models, see Gemini models (/gemini-api/docs/models/gemini). Prompts using the Gemini API cannot exceed 20MB in size. The Gemini API provides a File API
 (https://ai.google.dev/api/rest/v1beta/files) for temporarily storing media files for use in prompting, which lets you provide prompt data beyond the 20MB limit. For more information on using the Files API and file formats supported for prompting, see Prompting with media files (/tutorials/prompting_with_media).

## Prompt Design And Text Input

Creating effective prompts, or prompt engineering, is a combination of art and science. See the intro to prompting (/gemini-api/docs/prompting-intro) for guidance on how to approach prompting and the prompt 101
 (/gemini-api/docs/models/generative-models\#prompt101) guide to learn about different approaches to prompting.

Generate content The Gemini API lets you use both text and image data for prompting, depending on what model variation you use. For example, you can generate text from either text-only prompts or multimodal prompts using a Gemini 1.5 model. This section gives basic code examples of each. Refer to the generateContent
 (/api/rest/v1beta/models/generateContent) API reference for a more detailed example that covers all of the parameters.

Text and image input You can send a text prompt with an image to a Gemini 1.5 model to perform a vision-related task. For example, captioning an image or identifying that's in an image. The following code examples demonstrate a basic implementation of a text and image prompt for each supported language:

```
Python
      
   (#python)
      Go  (#go)Node.js (#node.js)Web (#web)Dart (Flutter)  (#dart-flutter)Swift (#swift)Android (#android)cURL (#curl)

```

model = genai.GenerativeModel('gemini-1.5-flash') cookie_picture = {
'mime_type': 'image/png',
'data': pathlib.Path('cookie.png').read_bytes()
}
prompt = "Do these look store-bought or homemade?" response = model.generate_content( model="gemini-1.5-flash",
content=[prompt, cookie_picture]
)
print(response.text)
See the Python tutorial (/gemini-api/docs/get-started/python) to see the complete code snippet.

## Text Only Input

The Gemini API can also handle text-only input. This feature lets you perform natural language processing
(NLP) tasks such as text completion and summarization. The following code examples demonstrate a basic implementation of a text-only prompt for each supported language:

```
Python
      
   (#python)
      Go  (#go)Node.js (#node.js)Web (#web)Dart (Flutter)  (#dart-flutter)Swift (#swift)Android (#android)cURL (#curl)

```

model = genai.GenerativeModel('gemini-1.5-flash')
prompt = "Write a story about a magic backpack."
response = model.generate_content(prompt)
See the Python tutorial (/gemini-api/docs/get-started/python) for the full example.

## Multi-Turn Conversations (Chat)

You can use the Gemini API to build interactive chat experiences for your users. Using the chat feature of the API lets you collect multiple rounds of questions and responses, allowing users to incrementally step toward answers or get help with multi-part problems. This feature is ideal for applications that require ongoing communication, such as chatbots, interactive tutors, or customer support assistants. The following code examples demonstrate a basic implementation of chat interaction for each supported language:

```
Python
      
   (#python)
      Go  (#go)Node.js (#node.js)Web (#web)Dart (Flutter)  (#dart-flutter)Swift (#swift)Android (#android)cURL (#curl)

```

model = genai.GenerativeModel('gemini-1.5-flash')
chat = model.start_chat(history=[]) response = chat.send_message(
"Pretend you\'re a snowman and stay in character for each response.")
print(response.text) response = chat.send_message(
"What\'s your favorite season of the year?")
print(response.text)
See the chat demo in the Python tutorial (/gemini-api/docs/get-started/python) for a full example.

## Streamed Responses

The Gemini API provides an additional way to receive responses from generative AI models: as a data stream. A
streamed response sends incremental pieces of data back to your application as it is generated by the model. This feature lets you respond quickly to a user request to show progress and create a more interactive experience. Streamed responses are an option for freeform prompting and chats with Gemini models. The following code examples show how to request a streamed response for a prompt for each supported language:

```
Python
      
   (#python)
      Go  (#go)Node.js (#node.js)Web (#web)Dart (Flutter)  (#dart-flutter)Swift (#swift)Android (#android)cURL (#curl)

```

prompt = "Write a story about a magic backpack." response = genai.stream_generate_content( model="models/gemini-1.5-flash", prompt=prompt
)
See the Python tutorial (/gemini-api/docs/get-started/python) to see the complete code snippet.

## Json Format Responses

Depending on your application, you may want the response to a prompt to be returned in a structured data format, particularly if you are using the responses to populate programming interfaces. The Gemini API
provides a configuration parameter to request a response in JSON format.

Note: This response configuration option is supported only with the Gemini 1.5 Pro and 1.5 Flash models.

You can have the model output JSON by setting the response_mime_type configuration option to application/json and in the prompt, describe the format of JSON you want in response:

```
Python
      
   (#python)
      cURL (#curl)

```

model = genai.GenerativeModel('gemini-1.5-flash',
generation_config={"response_mime_type": "application/json" prompt = """
List 5 popular cookie recipes.

Using this JSON schema:
Recipe = {"recipe_name": str}
Return a `list[Recipe]`
"""
response = model.generate_content(prompt)
print(response.text)
While Gemini 1.5 Flash models only accept a *text* description of the JSON schema you want returned, the Gemini 1.5 Pro models let you pass a schema object (or a Python type equivalent), and the model output will strictly follow that schema. This is also known as controlled generation or *constrained decoding*.

For example, to get a list of Recipe objects, pass list[Recipe] to the response_schema field of the generation_config argument:

```
Python
      
   (#python)
      cURL (#curl)

```

import typing_extensions as typing class Recipe(typing.TypedDict):
recipe_name: str model = genai.GenerativeModel(model_name="models/gemini-1.5-pro") result = model.generate_content(
"List 5 popular cookie recipes",
generation_config=genai.GenerationConfig(response_mime_type="application/json",
response_schema = list[Recipe]))
print(result.text)
To learn more, refer to the JSON mode quickstart
 (https://github.com/google-gemini/cookbook/blob/main/quickstarts/JSON_mode.ipynb) in the Gemini API cookbook
 (https://github.com/google-gemini/cookbook/tree/main).

## Embeddings

The embedding service in the Gemini API generates state-of-the-art embeddings for words, phrases, and sentences. The resulting embeddings can then be used for NLP tasks, such as semantic search, text classification, and clustering, among many others. See the embeddings guide (/gemini-api/docs/embeddings) to learn what embeddings are and some key use cases for the embedding service to help you get started.

## Next Steps

Get started with the Google AI Studio UI using the Google AI Studio quickstart
 (/gemini-api/docs/ai-studio-quickstart).

Try out server-side access to the Gemini API with the tutorials for Python (/gemini-api/docs/get-started/python), Go (/gemini-api/docs/get-started/go), or Node.js
 (/gemini-api/docs/get-started/node). Start building for the web with the web tutorial (/gemini-api/docs/get-started/web).

Start building for mobile apps with the Swift tutorial (/gemini-api/docs/get-started/swift) or the Android tutorial (/gemini-api/docs/get-started/android).

If you're an existing Google Cloud user (or you would like to use Gemini on Vertex to take advantage of the powerful Google Cloud ecosystem), check out Generative AI on Vertex AI
 (https://cloud.google.com/vertex-ai/docs/generative-ai/learn/overview) to learn more.

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License
 (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies
 (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-06-20 UTC.