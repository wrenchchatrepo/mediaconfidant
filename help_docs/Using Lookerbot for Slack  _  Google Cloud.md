Note that you are viewing Looker documentation. For Looker Studio documentation, visit https://support.google.com/looker-studio (https://support.google.com/looker-studio).

## Using Lookerbot For Slack

This page provides an overview of how to use Lookerbot, one of several integrations that Looker provides for sharing Looker data in Slack.

Lookerbot for Slack integrates with Looker so that you can query your data directly from Slack, allowing you to share data easily and answer data-driven questions without having to work outside of your organization's existing workflow.

This page discusses these Slack-Lookerbot workflows:
Getting started with Lookerbot (\#getting_started_with_lookerbot) Expanding Looker content URLs automatically  (\#expanding_looker_urls_automatically)
 (\#expanding_looker_urls_automatically)
 (\#expanding_looker_urls_automatically)Using custom slash commands to run and post Looker queries
 (\#using_custom_slash_commands_to_run_and_post_looker_queries)

## Getting Started With Lookerbot

Before you can use Lookerbot in Slack, you must configure the Lookerbot application by following the technical setup (https://github.com/looker/lookerbot) instructions in Looker's open source GitHub repository.

In February 2021, Slack deprecated some API endpoints
 (https://api.slack.com/changelog/2020-01-deprecating-antecedents-to-the-conversations-api\#methods) that affect how Lookerbot interacts with data actions (/looker/docs/reference/param-field-action). Please pull the latest updates from Looker's Lookerbot GitHub repo
 (https://github.com/looker/looker-slackbot). Your package.json file should indicate a Looker version of 0.0.16 or later.

## Expanding Looker Urls Automatically

Lookerbot can expand the URLs automatically for the Looker content that you share in Slack. To enable Lookerbot to automatically expand shared URLs within a Slack channel, you must add Lookerbot to that Slack channel. (The bot configuration must also set the LOOKER_SLACKBOT_EXPAND_URLS environment variable to true. See the Lookerbot technical setup (https://github.com/looker/lookerbot) instructions for more information about environment variables.)
The ability to expand Looker URLS is not available in Slack direct messages, because of the distinction that is made between private/public channels and direct messages in the legacy unfurling API capabilities that are used in Lookerbot.

To invite Lookerbot to a public or private channel in Slack:
1. Click the name of the channel to open the channel settings.

2. Select the **Integrations** tab.

3. Under **Apps**, select the name of your Lookerbot app.

When you paste the URL from an Explore or a Look in a Slack channel to which Lookerbot has been invited, Lookerbot will automatically expand the URL and its content. If the Looker content has an associated visualization, Lookerbot will show an image of that visualization. If the Looker content is a data table, Lookerbot will display the data as text.

## Using Custom Slash Commands To Run And Post Looker Queries

You can also create and use custom slash commands (https://api.slack.com/interactivity/slash-commands) that, when executed, will run a saved query of your data in Looker and post the result in Slack. Custom slash commands are created during Lookerbot setup
 (https://github.com/looker/lookerbot\#configuring-slash-commands) but can be executed in Slack by any Slack user.

Slash commands are not required to interact with Lookerbot. To use all Lookerbot's functions, you can also message the bot directly or mention it in a Slack channel in which Lookerbot is present: @lookerbot help.

If the **Slack integration** (/looker/docs/scheduling-slack) is enabled for your Slack workspace, you cannot use /looker slash commands with the Lookerbot. In place of @looker or /looker, use @lookerbot or /lookerbot.

To see the commands that have been created (https://github.com/looker/lookerbot\#configuring-slash-commands) for your Lookerbot:
Hover over any mention of the Lookerbot. The available commands are listed in the pop-up window.

Select the Lookerbot app in the **Apps** section of the Slack workspace. Then select the **About** tab on the app page. The available commands will be listed under **Commands**.

## Different Ways To Use Slash Commands

There are three ways to use commands. Say, for example, you or a developer in your organization has set up a command to retrieve data from Looker tracking the number of orders that customers have made of a certain product. The developer has used "orders" to represent this data when configuring the slash command. To invoke this command, you can:
1. **@mention Lookerbot** followed by the text component of the command. This can be done in any channel in which Lookerbot is present. For example:
@lookerbot orders 2. **Use the slash command**. You use a command either by clicking on the command from the list of commands or by typing the name of the command (preceded by a slash). You can do this if the slash command has been configured during setup
 (https://github.com/looker/lookerbot).

/lookerbot orders 3. **Direct message Lookerbot**. If you send a message directly to Lookerbot, you don't need to prepend the command with
/lookerbot. In this case the DM would simply be orders.

## Using Slash Commands With Filters

If you or a developer in your organization has created a slash command that queries a dashboard with a single element and dashboard filters, you can run the command to retrieve that Looker content and add filter values from Slack. Filters are optional, and the query will run without that filter if no values are specified. For example, say you have a dashboard with a customer map visualization that filters on specific US cities and a custom slash command has been configured to call this dashboard data. You can run the customer map in command, filtered for New York, like so:

![2_image_0.png](2_image_0.png)

## Data Formats

Commands will return data in different ways depending on the visualization type of the underlying Explore, Look, or dashboard element. There are three possible return formats:
Text: If the underlying content is a table, the data will return as text. For example, if a user runs the configured command top customer this month, Slackbot returns the top record in text format:

![2_image_1.png](2_image_1.png)

Single Value Visualization: If the underlying content is a single value visualization, the data will return as a text value. For

![2_image_2.png](2_image_2.png)

example, if a user runs the configured command orders last week, Slackbot returns the total count for the previous week:
Visualization: If the underlying content is a visualization, the data will return as an image of the visualization. For example, if a user runs the configured command movie budgets with the value Brad Pitt, Slackbot responds with a link to the Looker query and a line chart visualization that depicts the increasing and decreasing value trends of the average Brad Pitt movie budget from 0 to 160 million for a movie's first release year, ranging from 1990 to 2015:

![3_image_0.png](3_image_0.png)

## Additional Resources

For information about Looker's other Slack integrations, see these resources:
Sending data from Looker with the Slack Attachment (API Token) Action
 (/looker/docs/best-practices/how-to-use-the-looker-slack-attachment-api-token-action)
Sending alerts to the Slack Attachment (API Token) integration
 (/looker/docs/creating-alerts\#sending_alerts_to_the_slack_attachment_(api_token)_integration)
Scheduling deliveries to the Slack integration (/looker/docs/scheduling-slack)
Sending alerts to the Slack integration (/looker/docs/creating-alerts\#sending_alerts_to_the_slack_integration)
Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates. Last updated 2023-10-11 UTC.