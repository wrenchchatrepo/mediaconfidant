Try Gemini 1.5 models (https://console.cloud.google.com/vertex-ai/generative/multimodal/create/text)**, our newest multimodal** models in Vertex AI, and see what you can build with a 1M token context window.

## Model Api For Gemini In Vertex Ai

Release Notes The Vertex AI API for Gemini lets you create an application with Gemini models. Use it to create requests and then receive responses to help create applications for your use case. The following topics include some example uses cases for Gemini models:
Gemini 1.5 Pro and Gemini 1.5 Flash use cases (/vertex-ai/generative-ai/docs/multimodal/overview\#1.5-pro-use-cases) Gemini 1.0 Pro Vision use cases (/vertex-ai/generative-ai/docs/multimodal/overview\#multimodal-use-cases)
Gemini 1.0 Pro use cases (/vertex-ai/generative-ai/docs/multimodal/overview\#text-use-cases)

## Create A Google Cloud Account To Get Started

To start using the Vertex AI Model API for Gemini, create a Google Cloud account (https://console.cloud.google.com/freetrial?redirectPath=/marketplace/product/google/cloudaicompanion.googleapis.com).

After creating your account, use this document to review the Gemini model request body (\#request), model parameters
 (\#parameters), response body (\#response), and some sample requests (\#sample-requests) and responses (\#sample-responses). When you're ready, see the Vertex AI API for Gemini quickstart
 (/vertex-ai/generative-ai/docs/start/quickstarts/quickstart-multimodal) to learn how to send a request to the Vertex AI
Gemini API using a using a programming language SDK or the REST API.

## Send An Http Request

The following tabs show you how to send an HTTP request with each Gemini model:

```
Gemini 1.5 Pro
            
   (#gemini-1.5-pro)
           Gemini 1.5 Flash … Gemini 1.0 Pro … Gemini 1.0 Pro Vision …
                                                                                   

```

POST https://{REGION}-aiplatform.googleapis.com/v1/projects/{PROJECT_ID}/locations/{REGION}/pu To send a stream request to the model, see the streamGenerateContent
 (/vertex-ai/docs/reference/rest/v1/projects.locations.publishers.models/streamGenerateContent) method for more information.

To send a non-streaming request to the model, use the generateContent
 (/vertex-ai/docs/reference/rest/v1/projects.locations.publishers.models/generateContent) method instead. For a list of supported regions, see Available locations (/vertex-ai/generative-ai/docs/learn/locations\#available-regions).

## Model Versions

To use the auto-updated version (/vertex-ai/generative-ai/docs/learn/model-versioning\#auto-updated-version), specify the model name without the trailing version number, for example gemini-1.0-pro instead of gemini-1.0-pro-001.

For more information, see Gemini model versions and lifecycle (/vertex-ai/generative-ai/docs/learn/model-versioning\#gemini-model-versions).

## Request Body

The request body contains data with the following structure:
{
"contents": [
{
"role": string, "parts": [
{
// Union field data can be only one of the following: "text": string, "inlineData": {
"mimeType": string,
"data": string
}, "fileData": {
"mimeType": string, "fileUri": string
}, // End of list of possible types for union field data. "videoMetadata": {
"startOffset": {
"seconds": integer,
"nanos": integer
}, "endOffset": {
"seconds": integer, "nanos": integer
}
}
}
]
}
],
"systemInstruction": {
"role": string, "parts": [
{
"text": string
}
]
}, "tools": [
{
"functionDeclarations": [
{
"name": string, "description": string, "parameters": {
object (OpenAPI Object Schema  (https://spec.openapis.org/oas/v3.0.3\#schema))
}
}
]
}
], "safetySettings": [
{
"category": enum (HarmCategory), "threshold": enum (HarmBlockThreshold)
}
], "generationConfig": {
"temperature": number, "topP": number, "topK": number, "candidateCount": integer,
"maxOutputTokens": integer,
"presencePenalty": float, "frequencyPenalty": float, "stopSequences": [
string
], "responseMimeType": string
}
}

## Gemini Model Parameters

You can use the following parameters in your request body:

| Parameter   | Description                                                                                                                                                                                              |
|-------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| role        | The role in a conversation associated with the content. Specifying a role is required even in singleturn use cases. Acceptable values include the following: USER: Specifies content that's sent by you. |

MODEL: Specifies the model's response.

| parts      | Ordered parts that make up the input. Parts may have different MIME types. For limits on the inputs, such as the maximum number of tokens or the number of images, see the model specifications on the Google models (/vertex-ai/generative-ai/docs/learn/models) page. To compute the number of tokens in your request, see Get token count  (/vertex-ai/generative-ai/docs/multimodal/get-token-count).   |
|------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| text       | The text instructions or chat dialogue to include in the prompt.                                                                                                                                                                                                                                                                                                                                            |
| inlineData | Serialized bytes data of the image, audio clip, or video clip. For gemini-1.0-pro-vision, you can specify at most 1 image with inlineData. To specify up to 16 images, use fileData.                                                                                                                                                                                                                        |

mimeType The media type of the file specified in the data or fileUri fields. Acceptable values include the following:
add_circle **Click to expand MIME types**
application/pdf audio/mpeg audio/mp3 audio/wav image/png image/jpeg text/plain video/mov video/mpeg video/mp4 video/mpg video/avi video/wmv video/mpegps video/flv For gemini-1.0-pro-vision, the maximum video length is 2 minutes.

For Gemini 1.5 Pro, the maximum length of an audio file is 8.4 hours and the maximum length of a video file (without audio) is one hour. For more information, see Gemini 1.5 Pro media requirements
 (/vertex-ai/generative-ai/docs/multimodal/send-multimodal-prompts\#media_requirements). Text files must be UTF-8 encoded. The contents of the text file count toward the token limit.

| There is no limit on image resolution.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |                                                                                                                                                                                                                                                                                                                                                                                 |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| data                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | The base64 encoding (/vertex-ai/generative-ai/docs/image/base64-encode) of the image, PDF, or video to include inline in the prompt. When including media inline, you must also specify the media type (mimeType) of the data. size limit: 20MB                                                                                                                                 |
| fileUri                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | The Cloud Storage URI of the file to include in the prompt. The bucket object must either be publicly readable or reside in the same Google Cloud project that's sending the request. You must also specify the media type (mimeType) of the file. For gemini-1.5-pro, the size limit is 2GB. For gemini-1.0-pro-vision, the size limit is 20MB.                                |
| videoMetadata                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | Optional. For video input, the start and end offset of the video in Duration  (https://protobuf.dev/reference/protobuf/google.protobuf/#duration) format. For example, to specify a 10 second clip starting at 1:00, set "start_offset": { "seconds": 60 } and "end_offset": { "seconds": 70 }.                                                                                 |
| systemInstruction                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Optional. Available for gemini-1.5-pro and gemini-1.0-pro-002. Instructions for the model to steer it toward better performance. For example, "Answer as concisely as possible" or "Don't use technical terms in your response". The text strings count toward the token limit. The role field of systemInstruction is ignored and doesn't affect the performance of the model. |
| tools                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | A piece of code that enables the system to interact with external systems to perform an action, or set of actions, outside of knowledge and scope of the model.                                                                                                                                                                                                                 |
| functionDeclarationsOne or more function declarations. Each function declaration contains information about one function that includes the following: name The name of the function to call. Must start with a letter or an underscore. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64. description (optional). The description and purpose of the function. The model uses this to decide how and whether to call the function. For the best results, we recommend that you include a description. parameters The parameters of this function in a format that's compatible with the OpenAPI schema  (https://spec.openapis.org/oas/v3.0.3#schema) format. For more information, see Function calling (/vertex-ai/generative-ai/docs/multimodal/function-calling). |                                                                                                                                                                                                                                                                                                                                                                                 |

| category        | The safety category to configure a threshold for. Acceptable values include the following: add_circle Click to expand safety categories HARM_CATEGORY_SEXUALLY_EXPLICIT HARM_CATEGORY_HATE_SPEECH HARM_CATEGORY_HARASSMENT HARM_CATEGORY_DANGEROUS_CONTENT                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| threshold       | The threshold for blocking responses that could belong to the specified safety category based on probability. BLOCK_NONE BLOCK_LOW_AND_ABOVE BLOCK_MED_AND_ABOVE BLOCK_ONLY_HIGH                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| temperature     | The temperature is used for sampling during response generation, which occurs when topP and topK are applied. Temperature controls the degree of randomness in token selection. Lower temperatures are good for prompts that require a less open-ended or creative response, while higher temperatures can lead to more diverse or creative results. A temperature of 0 means that the highest probability tokens are always selected. In this case, responses for a given prompt are mostly deterministic, but a small amount of variation is still possible. If the model returns a response that's too generic, too short, or the model gives a fallback response, try increasing the temperature. Range for gemini-1.5-pro: 0.0 - 2.0 (default: 1.0) Range for gemini-1.0-pro-vision: 0.0 - 1.0 (default: 0.4) Range for gemini-1.0-pro-002: 0.0 - 2.0 (default: 1.0) Range for gemini-1.0-pro-001: 0.0 - 1.0 (default: 0.9) |
| maxOutputTokens | Maximum number of tokens that can be generated in the response. A token is approximately four characters. 100 tokens correspond to roughly 60-80 words. Specify a lower value for shorter responses and a higher value for potentially longer responses. For the maximum output tokens for each model, see the model specifications on the Google models  (/vertex-ai/generative-ai/docs/learn/models) page. By default, Google uses the model's maximum output token limit as the number of maximum tokens that can be generated.                                                                                                                                                                                                                                                                                                                                                                                               |
| topK            | Top-K changes how the model selects tokens for output. A top-K of 1 means the next selected token is the most probable among all tokens in the model's vocabulary (also called greedy decoding), while a top-K of 3 means that the next token is selected from among the three most probable tokens by using temperature. For each token selection step, the top-K tokens with the highest probabilities are sampled. Then tokens are further filtered based on top-P with the final token selected using temperature sampling. Specify a lower value for less random responses and a higher value for more random responses. Range: 1-40                                                                                                                                                                                                                                                                                        |

| gemini-1.0-pro and gemini-1.5-pro don't support topK Default for gemini-1.0-pro-vision: 32   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|----------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| topP                                                                                         | Top-P changes how the model selects tokens for output. Tokens are selected from the most (see top-K) to least probable until the sum of their probabilities equals the top-P value. For example, if tokens A, B, and C have a probability of 0.3, 0.2, and 0.1 and the top-P value is 0.5, then the model will select either A or B as the next token by using temperature and excludes C as a candidate. Specify a lower value for less random responses and a higher value for more random responses. Range: 0.0 - 1.0 gemini-1.5-pro: 0.94 Default for gemini-1.0-pro: 1 Default for gemini-1.0-pro-vision: 1 |
| frequencyPenalty                                                                             | Positive values penalize tokens that repeatedly appear in the generated text, decreasing the probability of repeating content. This maximum value for frequencyPenalty is up to, but not including, 2.0. Its minimum value is -2.0.                                                                                                                                                                                                                                                                                                                                                                              |
| presencePenalty                                                                              | Positive values penalize tokens that already appear in the generated text, increasing the probability of generating more diverse content. This maximum value for presencePenalty is up to, but not including, 2.0. Its minimum value is -2.0.                                                                                                                                                                                                                                                                                                                                                                    |
| candidateCount                                                                               | The number of response variations to return. This value must be 1.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| stopSequences                                                                                | Specifies a list of strings that tells the model to stop generating text if one of the strings is encountered in the response. If a string appears multiple times in the response, then the response truncates where it's first encountered. The strings are case-sensitive. For example, if the following is the returned response when stopSequences isn't specified: public static string reverse(string myString) Then the returned response with stopSequences set to ["Str", "reverse"] is: public static string Maximum 5 items in the list.                                                              |
| responseMimeType                                                                             | Optional. Available for gemini-1.5-pro.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| (Preview)                                                                                    | The output format of the generated candidate text. Supported MIME types: text/plain: (default) Text output. application/json: JSON response in the candidates.                                                                                                                                                                                                                                                                                                                                                                                                                                                   |

Response body

{
"candidates": [
{
"content": {
"parts": [
{
"text": string
}
]
}, "finishReason": enum (FinishReason),
"safetyRatings": [
{
"category": enum (HarmCategory), "probability": enum (HarmProbability), "blocked": boolean
}
], "citationMetadata": {
"citations": [
{
"startIndex": integer, "endIndex": integer,
"uri": string,
"title": string, "license": string, "publicationDate": {
"year": integer, "month": integer, "day": integer
}
}
]
}
}
], "usageMetadata": {
"promptTokenCount": integer, "candidatesTokenCount": integer, "totalTokenCount": integer
}
}

| Response element   | Description                                                                                                                                                                                                      |
|--------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| text               | The generated text.                                                                                                                                                                                              |
| finishReason       | The reason why the model stopped generating tokens. If empty, the model has not stopped generating the tokens. Because the response uses the prompt for context, it's not possible to change the behavior of how |

| the model stops generating tokens. FINISH_REASON_UNSPECIFIED The finish reason is unspecified. FINISH_REASON_STOP Natural stop point of the model or provided stop sequence. FINISH_REASON_MAX_TOKENS The maximum number of tokens as specified in the request was reached. FINISH_REASON_SAFETY The token generation was stopped as the response was flagged for safety reasons. Note that Candidate.content is empty if content filters block the output. FINISH_REASON_RECITATION The token generation was stopped as the response was flagged for unauthorized citations. FINISH_REASON_OTHER All other reasons that stopped the token   |                                                                                                                                                                                                                                                            |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| category                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | The safety category to configure a threshold for. Acceptable values include the following: add_circle Click to expand safety categories HARM_CATEGORY_SEXUALLY_EXPLICIT HARM_CATEGORY_HATE_SPEECH HARM_CATEGORY_HARASSMENT HARM_CATEGORY_DANGEROUS_CONTENT |
| probability                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | The harm probability levels in the content. HARM_PROBABILITY_UNSPECIFIED NEGLIGIBLE LOW MEDIUM HIGH                                                                                                                                                        |
| blocked                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | A boolean flag associated with a safety attribute that indicates if the model's input or output was blocked.                                                                                                                                               |
| startIndex                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | An integer that specifies where a citation starts in the content.                                                                                                                                                                                          |
| endIndex                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | An integer that specifies where a citation ends in the content.                                                                                                                                                                                            |
| url                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | The URL of a citation source. Examples of a URL source might be a news website or a GitHub repository.                                                                                                                                                     |
| title                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | The title of a citation source. Examples of source titles might be that of a news article or a book.                                                                                                                                                       |
| license                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | The license associated with a citation.                                                                                                                                                                                                                    |
| publicationDate                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | The date a citation was published. Its valid formats are YYYY, YYYY-MM, and YYYY-MM-DD.                                                                                                                                                                    |
| promptTokenCount                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | Number of tokens in the request.                                                                                                                                                                                                                           |
| candidatesTokenCountNumber of tokens in the response(s). totalTokenCount Number of tokens in the request and response(s).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |                                                                                                                                                                                                                                                            |

## Sample Requests

Text

 (\#text)
Chat (\#chat)Multimodal (\#multimodal)Function (\#function)
REST

 (\#rest)
To test a text prompt by using the Vertex AI API with Server-sent events (SSE) enabled, send a POST request to the publisher model endpoint with ?alt=sse at the end of the URL.

Before using any of the request data, make the following replacements:
PROJECT_ID edit

: Your project ID (/resource-manager/docs/creating-managing-projects\#identifiers).

For other fields, see the Request body (\#request_body) table.

HTTP method and URL:
POST https://us-central1-aiplatform.googleapis.com/v1/projects/PROJECT_ID edit/locations/u Request JSON body:
{
"contents": {
"role": "user", "parts": {
"text": "Give me a recipe for banana bread."
}
},
"safety_settings": {
"category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
"threshold": "BLOCK_LOW_AND_ABOVE"
}, "generation_config": {
"temperature": 0.2, "topP": 0.8, "topK": 40
}
}
To send your request, choose one of these options:
curl

 (\#curl)
PowerShell (\#powershell)
star **Note:** The following command assumes that you have logged in to the gcloud CLI with your user account by running gcloud init (/sdk/gcloud/reference/init) or gcloud auth login (/sdk/gcloud/reference/auth/login) , or by using Cloud Shell (/shell/docs), which automatically logs you into the gcloud CLI . You can check the currently active account by running gcloud auth list (/sdk/gcloud/reference/auth/list).

Save the request body in a file named request.json, and execute the following command:
curl -X POST \
-H "Authorization: Bearer $(gcloud auth print-access-token)" \ -H "Content-Type: application/json; charset=utf-8" \ -d @request.json \
"https://us-central1-aiplatform.googleapis.com/v1/projects/PROJECT_ID edit/loca You should receive a JSON response similar to the sample response (\#sample-responses).

## Sample Responses

```
Text
    
    (#text)
    Chat (#chat)Multimodal (#multimodal)Function (#function)

```

data: {"candidates": [{"content": {"role": "model","parts": [{"text": "Ingredients:\n\n- 3 rip data: {"candidates": [{"content": {"role": "model","parts": [{"text": "\n- 1/2 cup (1 stick) u data: {"candidates": [{"content": {"role": "model","parts": [{"text": "- 2 large eggs\n- 2 cup data: {"candidates": [{"content": {"role": "model","parts": [{"text": "1/2 cup chopped walnuts data: {"candidates": [{"content": {"role": "model","parts": [{"text": " and flour a 9x5 inch l data: {"candidates": [{"content": {"role": "model","parts": [{"text": ". In a separate bowl, w data: {"candidates": [{"content": {"role": "model","parts": [{"text": " prepared loaf pan and

## What'S Next

Learn how to use the Vertex AI API for Gemini:
Learn how to send chat prompt requests (/vertex-ai/generative-ai/docs/multimodal/send-chat-prompts-gemini).

Learn how to send multimodal prompt requests (/vertex-ai/generative-ai/docs/multimodal/send-multimodal-prompts).

Learn how to call functions (/vertex-ai/generative-ai/docs/multimodal/function-calling).

Learn how to get token count (/vertex-ai/generative-ai/docs/multimodal/get-token-count). Learn how to configure safety attributes (/vertex-ai/generative-ai/docs/multimodal/configure-safety-attributes).

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-06-24 UTC.