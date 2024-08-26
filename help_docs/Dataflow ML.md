# Apache Beam Runinference With Hugging Face

Run in Google Colab

![0_image_0.png](0_image_0.png)

 (https://colab.research.google.com/github/apache/beam/blob/master/examples/notebooks/beamml/run_inference_huggingface.ipynb)
View so (https:/ ml/run_
This notebook shows how to use models from Hugging Face (https://huggingface.co/) and Hugging Face pipeline (https://huggingface.co/docs/transformers/main_classes/pipelines) in Apache Beam pipelines that uses the RunInference
 (https://beam.apache.org/releases/pydoc/current/apache_beam.ml.inference.base.html\#apache_beam.ml. inference.base.RunInference)
transform. Apache Beam has built-in support for Hugging Face model handlers. Hugging Face has three model handlers:
Use the HuggingFacePipelineModelHandler
 (https://github.com/apache/beam/blob/926774dd02be5eacbe899ee5eceab23afb30abca/sdks/pyth on/apache_beam/ml/inference/huggingface_inference.py\#L567)
model handler to run inference with Hugging Face pipelines (https://huggingface.co/docs/transformers/main_classes/pipelines\#pipelines). Use the HuggingFaceModelHandlerKeyedTensor
 (https://github.com/apache/beam/blob/926774dd02be5eacbe899ee5eceab23afb30abca/sdks/pyth on/apache_beam/ml/inference/huggingface_inference.py\#L208)
model handler to run inference with models that uses keyed tensors as inputs. For example, you might use this model handler with language modeling tasks. Use the HuggingFaceModelHandlerTensor
 (https://github.com/apache/beam/blob/926774dd02be5eacbe899ee5eceab23afb30abca/sdks/pyth on/apache_beam/ml/inference/huggingface_inference.py\#L392)
model handler to run inference with models that uses tensor inputs, such as tf.Tensor or torch.Tensor.

For more information about using RunInference, see Get started with AI/ML pipelines (https://beam.apache.org/documentation/ml/overview/) in the Apache Beam documentation.

## Install Dependencies

Install both Apache Beam and the required dependencies for Hugging Face.

$ pip install torch --quiet $ pip install tensorflow --quiet $ pip install transformers==4.30.0 --quiet $ pip install apache-beam[gcp]>=2.50 --quiet from typing import Dict from typing import Iterable from typing import Tuple import tensorflow as tf import torch from transformers import AutoTokenizer from transformers import TFAutoModelForMaskedLM import apache_beam as beam from apache_beam.ml.inference.base import KeyedModelHandler from apache_beam.ml.inference.base import PredictionResult from apache_beam.ml.inference.base import RunInference from apache_beam.ml.inference.huggingface_inference import HuggingFacePipelineMo from apache_beam.ml.inference.huggingface_inference import HuggingFaceModelHandl from apache_beam.ml.inference.huggingface_inference import HuggingFaceModelHandl from apache_beam.ml.inference.huggingface_inference import PipelineTask

## Use Runinference With Hugging Face Pipelines

You can use Hugging Face pipelines (https://huggingface.co/docs/transformers/main_classes/pipelines\#pipelines) with RunInference by using the HuggingFacePipelineModelHandler model handler. Similar to the Hugging Face pipelines, to instantiate the model handler, the model handler needs either the pipeline task or the model that defines the task. To pass any optional arguments to load the pipeline, use load_pipeline_args. To pass the optional arguments for inference, use inference_args. You can define the pipeline task in one of the following two ways:
In the form of string, for example "translation". This option is similar to how the pipeline task is defined when using Hugging Face. In the form of a PipelineTask
 (https://github.com/apache/beam/blob/ac936b0b89a92d836af59f3fc04f5733ad6819b3/sdks/pytho n/apache_beam/ml/inference/huggingface_inference.py\#L75)
enum object defined in Apache Beam, such as PipelineTask.Translation.

## Create A Model Handler

This example demonstrates a task that translates text from English to Spanish.

model_handler = HuggingFacePipelineModelHandler( task=PipelineTask.Translation_XX_to_YY, model = "google/flan-t5-small", load_pipeline_args={'framework': 'pt'}, inference_args={'max_length': 200}
)
Define the input examples Use this code to define the input examples.

text = ["translate English to Spanish: How are you doing?",
"translate English to Spanish: This is the Apache Beam project."]
Postprocess the results The output from the RunInference transform is a PredictionResult object. Use that output to extract inferences, and then format and print the results.

class FormatOutput(beam.DoFn):
""" Extract the results from PredictionResult and print the results. """ def process(self, element):
example = element.example translated_text = element.inference[0]['translation_text'] print(f'Example: {example}') print(f'Translated text: {translated_text}') print('-' * 80)
Run the pipeline Use the following code to run the pipeline.

with beam.Pipeline() as beam_pipeline:
examples = (
beam_pipeline | "CreateExamples" >> beam.Create(text)
) inferences = (
examples | "RunInference" >> RunInference(model_handler) | "Print" >> beam.ParDo(FormatOutput())
)
Example: translate English to Spanish: How are you doing? Translated text: Cómo está acerca? -------------------------------------------------------------------------------- Example: translate English to Spanish: This is the Apache Beam project. Translated text: Esto es el proyecto Apache Beam. --------------------------------------------------------------------------------

# Runinference With A Pretrained Model From Hugging Face Hub

To use pretrained models directly from Hugging Face Hub
 (https://huggingface.co/docs/hub/models), use either the HuggingFaceModelHandlerTensor model handler or the HuggingFaceModelHandlerKeyedTensor model handler. Which model handler you use depends on your input type:
Use HuggingFaceModelHandlerKeyedTensor to run inference with models that uses keyed tensors as inputs. Use HuggingFaceModelHandlerTensor to run inference with models that uses tensor inputs, such as tf.Tensor or torch.Tensor.

When you construct your pipeline, you might also need to use the following items:
Use the load_model_args to provide optional arguments to load the model. Use the inference_args argument to do the inference. For TensorFlow models, specify the framework='tf'. For PyTorch models, specify the framework='pt'.

The following language modeling task predicts the masked word in a sentence.

## Create A Model Handler

This example shows a masked language modeling task. These models take keyed tensors as inputs.

model_handler = HuggingFaceModelHandlerKeyedTensor( model_uri="stevhliu/my_awesome_eli5_mlm_model", model_class=TFAutoModelForMaskedLM, framework='tf', load_model_args={'from_pt': True}, max_batch_size=1
)
Define the input examples Use this code to define the input examples.

text = ['The capital of France is Paris .',
'It is raining cats and dogs .', 'He looked up and saw the sun and stars .', 'Today is Monday and tomorrow is Tuesday .', 'There are 5 coconuts on this palm tree .']

## Preprocess The Input

Edit the given input to replace the last word with a <mask>. Then, tokenize the input for doing inference.

def add_mask_to_last_word(text: str) -> Tuple[str, str]:
"""Replace the last word of sentence with <mask> and return the original sentence and the masked sentence.""" text_list = text.split() masked = ' '.join(text_list[:-2] + ['<mask>' + text_list[-1]]) return text, masked tokenizer = AutoTokenizer.from_pretrained("stevhliu/my_awesome_eli5_mlm_model") def tokenize_sentence( text_and_mask: Tuple[str, str], tokenizer) -> Tuple[str, Dict[str, tf.Tensor]]:
"""Convert string examples to tensors.""" text, masked_text = text_and_mask tokenized_sentence = tokenizer.encode_plus( masked_text, return_tensors="tf")
\# Workaround to manually remove batch dim until we have the feature to \# add optional batching flag. \# TODO(https://github.com/apache/beam/issues/21863): Remove when optional \# batching flag added return text, {
k: tf.squeeze(v) for k, v in dict(tokenized_sentence).items()
}
Postprocess the results Extract the result from the PredictionResult object. Then, format the output to print the actual sentence and the word predicted for the last word in the sentence.

class PostProcessor(beam.DoFn):
"""Processes the PredictionResult to get the predicted word. The logits are the output of the BERT Model. To get the word with the highest probability of being the masked word, take the argmax. """ def __init__(self, tokenizer):
super().__init__() self.tokenizer = tokenizer def process(self, element: Tuple[str, PredictionResult]) -> Iterable[str]:
text, prediction_result = element inputs = prediction_result.example logits = prediction_result.inference['logits'] mask_token_index = tf.where(inputs["input_ids"] == self.tokenizer.mask_token predicted_token_id = tf.math.argmax(logits[mask_token_index[0]], axis=-1) decoded_word = self.tokenizer.decode(predicted_token_id) print(f"Actual Sentence: {text}\nPredicted last word: {decoded_word}") print('-' * 80)
Run the pipeline Use the following code to run the pipeline.

with beam.Pipeline() as beam_pipeline:
tokenized_examples = (
beam_pipeline | "CreateExamples" >> beam.Create(text) | 'AddMask' >> beam.Map(add_mask_to_last_word) | 'TokenizeSentence' >> beam.Map(lambda x: tokenize_sentence(x, tokenizer)))
result = (
tokenized_examples | "RunInference" >> RunInference(KeyedModelHandler(model_handler)) | "PostProcess" >> beam.ParDo(PostProcessor(tokenizer))
)
Actual Sentence: The capital of France is Paris . Predicted last word: Paris -------------------------------------------------------------------------------- Actual Sentence: It is raining cats and dogs . Predicted last word: dogs -------------------------------------------------------------------------------- Actual Sentence: He looked up and saw the sun and stars . Predicted last word: stars -------------------------------------------------------------------------------- Actual Sentence: Today is Monday and tomorrow is Tuesday . Predicted last word: Tuesday -------------------------------------------------------------------------------- Actual Sentence: There are 5 coconuts on this palm tree . Predicted last word: tree --------------------------------------------------------------------------------
Except as otherwise noted, the content of this page is licensed under the Apache 2.0 License
 (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2023-09-14 UTC.