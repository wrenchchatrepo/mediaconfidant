# Code With Gemini Code Assist

As an early-stage technology, Gemini can generate output that seems plausible but is factually incorrect. We recommend that you validate all output from Gemini before you use it. For more information, see Gemini for Google Cloud and responsible AI (/gemini/docs/discover/responsible-ai).

This document describes how you can use Gemini Code Assist (/gemini/docs/codeassist/overview), an AI-powered collaborator in Google Cloud, to help you do the following in Cloud Code:
Provide guidance to help you solve problems with your code. Generate code for your project. Receive inline suggestions while you're coding.

Gemini doesn't use your prompts or its responses as data to train its models. For more information, see How Gemini for Google Cloud uses your data (/gemini/docs/discover/data-governance). To help you comply with any license requirements for your code, Gemini Code Assist provides source citations when its suggestions directly quote at length from a specific source. To learn more about how and when Gemini cites sources, see How Gemini helps you generate code and cites sources (/gemini/docs/discover/works\#how-when-gemini-cites-sources). This document is intended for developers of all skill levels. It assumes you have working knowledge of VS Code and are familiar with Google Cloud. If you prefer, you can also explore Gemini Code Assist in Cloud Workstations (/workstations/docs/write-code-gemini), Cloud Code for IntelliJ (/code/docs/intellij/write-code-gemini), and Cloud Shell Editor (/code/docs/shell/write-code-gemini).

## Before You Begin

1. Install the Cloud Code extension (/code/docs/vscode/install\#install) if you haven't already.

Cloud Code integrates with Gemini Code Assist in your IDE.

2. Optional: If you choose to clone a sample for the tasks in this document, install Git
 (https://git-scm.com/book/en/v2/Getting-Started-Installing-Git). Git is required for copying samples to your machine.

## Connect To Google Cloud And Select A Project

In this section, you'll connect to Google Cloud and select a Google Cloud project with the Cloud AI Companion API enabled in your IDE. If you select a Google Cloud project without the Cloud AI Companion API enabled, you receive an error notification and are instructed to contact your administrator. For more information, see Set up Gemini Code Assist for a project (/gemini/docs/discover/set-up-gemini). If you prefer to follow the **Code with Gemini Code Assist** walkthrough directly in your IDE, click Launch VS Code and follow the steps in the walkthrough to connect to Google Cloud and activate Gemini Code Assist.

Launch VS Code (vscode://googlecloudtools.cloudcode/cloudcode.openWalkthrough?id=duet-ai)
Otherwise, follow these steps:
1. Launch your IDE. 2. In the status bar, click **Cloud Code - Sign In**.

3. When prompted to allow Cloud Code to open the external website, click **Open**.

4. Follow the prompts to sign into your Google Account. 5. When asked if you downloaded Cloud Code from Google, click **Sign In**.

You're now connected to Google Cloud.

Next, to select a Google Cloud project that has the Cloud AI Companion API enabled, follow these steps:
1. In the **Gemini Code Assist** status bar, click **Gemini Code Assist**.

![1_image_0.png](1_image_0.png)

![1_image_1.png](1_image_1.png) 2. In the **Gemini Code Assist** menu, select **Select Gemini Code Assist project**. 3. Select a Google Cloud project that has the Cloud AI Companion API enabled.

Gemini is ready to use.

![2_image_0.png](2_image_0.png)

To test the capabilities of Gemini Code Assist, open an application, or create a sample application in the next section.

## Optional: Create A Sample Application

If you prefer to use an existing application to test the capabilities of Gemini Code Assist, you can skip this section. Otherwise, to create a sample application, follow these steps:
1. In your IDE, open the command palette: either press **Control+Shift+P** (for Windows and Linux) or **Command+Shift+P** (for macOS), and then run Cloud Code: New Application.

2. Select **Kubernetes application**. 3. Select the **Python (Flask): Guestbook** application template. 4. Save the new application in your preferred location.

A notification confirms that your application was created, and a new window opens with your application loaded.

## Chat With Gemini Code Assist

In this section, you learn how to open the **Gemini Code Assist** pane and chat with Gemini Code Assist to get an explanation of your existing code. To begin chatting with Gemini, follow these steps:
1. Create a new or use an existing code file. If you're using the Python (Flask) sample, you can perform this task in your front.py file: navigate to Explorer > src > **frontend** and open the front.py file.

2. In the activity bar of your IDE, click **Gemini Code Assist**.

3. In the **Gemini Code Assist** pane, enter the prompt Explain this code to me and click
**Send**.

Gemini uses the code in your code file as a reference to your prompt and responds with an explanation of your code. To refer to a specific block of code instead of all the code in the file, you can select the block in your code file and then prompt Gemini.

## Reset Chat History

Gemini Code Assist uses the chat history for additional context when responding to your prompts. If your chat history is no longer relevant to what you're trying to achieve, you can reset the chat history: in the **Gemini Code Assist** pane, click **Reset Chat**.

Note: The chat history automatically resets when you switch the workspace or exit your IDE.

## Generate Code With Prompts

The following sections show you how to use Gemini Code Assist to generate code with the example prompt \# Function to create a Cloud Storage bucket inside a Python file. You can also select a part of your code and then prompt Gemini Code Assist for help through the chat feature, and receive and accept or reject code suggestions while you code.

Prompt Gemini Code Assist in a code file 1. Create a new or use an existing code file. If you're using the Python (Flask) sample, you can do this in your front.py file: navigate to Explorer > src > **frontend** and open the front.py file.

2. In your code file, on a new line, enter \# Function to create a Cloud Storage bucket, and then press **Enter** (for Windows and Linux) or **Return** (for macOS).

3. To generate code, press **Control+Enter** (for Windows and Linux) or Control+Return (for macOS).

Next to your prompt text in the Python file, Gemini Code Assist generates the code in the form of ghost text.

4. Optional: To accept the generated code, press Tab.

Optional: Change keyboard shortcut for generating code If the default keyboard shortcut for generating code isn't working as outlined in the previous section, you can change the keyboard shortcut by following these steps:
1. In your IDE, click **File** (for Windows and Linux) or **Code** (for macOS), and then navigate to Settings > **Keyboard Shortcuts**.

2. In the list of keyboard shortcuts, scroll until you find **Cloud Code: Generate code**.

3. Click **Cloud Code: Generate Code**, and then click **Change Keybinding**.

4. In the dialog that appears, enter your own shortcut.

5. Press **Enter** (for Windows and Linux) or **Return** (for macOS).

You can now use your newly assigned keyboard shortcut to generate code with Gemini Code Assist.

To learn more about changing shortcuts in your IDE, see Keybindings for Visual Studio Code (https://code.visualstudio.com/docs/getstarted/keybindings).

Prompt Gemini Code Assist with selected code using chat Gemini Code Assist can perform tasks or answer your questions based on the code that you select. To get generated code that's based on a prompt with selected code, follow these steps:
1. In your IDE, open a file in your project that contains code, or use the same code file that you used in previous steps.

2. In the activity bar, click **Gemini Code Assist** to open the **Gemini Code Assist** pane.

3. In your code file, select a block of code. 4. In the **Gemini Code Assist** pane text field, enter a prompt for the selected code.

For example, select a function in your code and enter the prompt Write a unit test for this function:
Gemini uses your selected code as reference and responds to your prompt.

Get inline suggestions while you code While you write code, Gemini Code Assist makes inline code suggestions that you can either accept or ignore. To try this feature, follow these steps:
1. Create a new or use an existing code file. If you're using the Python (Flask) sample, you can do this in your front.py file: navigate to Explorer > src > **frontend** and open the front.py file.

2. In your code file, on a new line, start writing a function. For example, if you're in a Python file, write def. Gemini suggests code in the form of ghost text.

3. To accept the code suggestion from Gemini Code Assist, press Tab. Otherwise, to ignore the suggestion, press Esc or continue writing your code.

Optional: Disable inline suggestions If you prefer to disable inline suggestions in Gemini Code Assist, follow these steps:
1. In your IDE, select **Code** (for macOS) or **File** (for Windows and Linux), and then navigate to Settings > **Settings**.

2. On the **User** tab of the **Settings** dialog, navigate to Extensions > **Cloud Code**. 3. Scroll until you find the **Cloudcode: Gemini Code Assist: Inline Suggestions: Enable Auto**
list, and then select Off.

This turns off the inline suggestions. You can still press **Control+Enter** (for Windows and Linux) or **Control+Return** (for macOS) to manually trigger inline suggestions.

Disable code suggestions that match cited sources Gemini provides citation information when it directly quotes at length from another source, such as existing open source code. For more information, see How and when Gemini cites sources (/gemini/docs/discover/works\#how-when-gemini-cites-sources).

To prevent code that matches cited sources from being suggested, you can modify the cloudcode.duetAI.recitation.maxCitedLength setting to 0 in a settings.json file:
"cloudcode.duetAI.recitation.maxCitedLength": 0

## Use Smart Actions

To help you be more productive while minimizing context switching, Gemini Code Assist provides AI-powered *smart actions* directly in your code editor. When you select your code in your code editor, you can view and select from a list of actions relevant to your context. To use smart actions in your code, follow these steps:
1. In your code file, select a block of code.

2. Next to the selected code block, click **Show Code Actions**.

3. Select an action such as **Generate unit tests**.

Gemini generates a response that's based on the action you selected.

## Test Other Example Prompts

After reading through the Generate code with prompts (\#generate_code_with_prompts) section of this document, try some of the following example prompts.

Get an explanation of code 1. In your code file, select a function that you want explained. 2. In the **Gemini Code Assist** pane, enter the prompt Explain this code to me.

Gemini uses your selected code as a reference and responds with an explanation of the selected function.

Generate test plans 1. In your code file, select the code that you want to add unit tests for. 2. In the **Gemini Code Assist** pane, enter the prompt Write unit tests for my code.

Get help with debugging code 1. In your code file, select the code that you want to debug. 2. In the **Gemini Code Assist** pane, enter the prompt Help me debug my code.

Make your code more readable 1. In your code file, select the code that you want to make more readable. 2. In the **Gemini Code Assist** pane, enter the prompt Make my code more readable.

If you prefer to focus on a specific part of your code, then select the preferred part of code before prompting Gemini.

## Known Issues

The following sections outline the known issues of Gemini Code Assist.

Chat responses may be truncated when they include an updated version of a large open file To work around this issue, select a smaller section of code and include an additional directive in the chat prompt, such as only output the selected code.

Vim: Cannot accept or dismiss code generation suggestions unless in insert mode When using the Vim plugin in normal mode, you can't accept or dismiss code suggestions.

To work around this issue, press i to enter insert mode, and then press Tab to accept the suggestion.

Vim: Inconsistent behavior when pressing Esc to dismiss suggestions When you press Esc, both IntelliJ and Gemini suggestions are dismissed. This behavior is different from the non-Vim behavior where pressing Esc re-triggers Gemini.

License recitation warnings don't persist across sessions If license recitation warnings don't persist across sessions, refer to the persistent logs:
1. Click View > **Output**. 2. Select **Gemini Code Assist - Citations**.

Connectivity issues in the Gemini Code Assist output window If you see a connection error or other connectivity problems in the Gemini Code Assist output window, try the following:
Configure your firewall to allow access to oauth2.googleapis.com and cloudaicompanion.googleapis.com. Configure your firewall to allow communication over HTTP/2, which gRPC uses.

You can use the grpc-health-probe tool to test connectivity. A successful check results in the following output:
$ grpc-health-probe -addr cloudaicompanion.googleapis.com:443 -tls error: this server does not implement the grpc health protocol (grpc.health.v1.Health): GRPC target method can't be resolved An unsuccessful check results in the following output:
timeout: failed to connect service "cloudaicompanion.googleapis.com:443" within 1s To obtain more details, run the following before grpc-health-probe:
export GRPC_GO_LOG_SEVERITY_LEVEL=info Leave feedback To leave feedback of your experience, follow these steps:
1. In the status bar, click **Gemini Code Assist**, and then in the **Quick Pick** menu, select Send feedback.

2. In the form, fill out the **Title** and **Comments** fields. 3. If you want to share your Skaffold or AI Companion logs, make sure that you select the Send Skaffold logs or **Send AI Companion logs** option.

4. Click **Submit Feedback**.

## What'S Next

Learn how to write better prompts (/gemini/docs/discover/write-prompts).

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-05-14 UTC.