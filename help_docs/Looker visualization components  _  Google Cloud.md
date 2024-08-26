Note that you are viewing Looker documentation. For Looker Studio documentation, visit https://support.google.com/looker-studio (https://support.google.com/looker-studio).

## Looker Visualization Components

Looker visualization components are a suite of React-based components that are available in the open source @looker/visualizations package
 (https://github.com/looker-open-source/components/tree/main/packages/visualizations).

Visualization components accept a Query.client_id value or a query ID from a Looker Explore
 (/looker/docs/components-vis-prop-tables) or a dashboard ID from a Looker dashboard (/looker/docs/components-vis-dashboard-id) and render a client-side visualization without an iframe (/looker/docs/private-embedding\#embedding_a_look). These components can be used out of the box, customized, or treated as pure data formatters to pass cleaned data from a Looker Explore to facilitate building your own customized visualizations. Looker visualization components are designed to be used in a React environment that has been authenticated with Looker's API (/looker/docs/api-getting-started) using the TypeScript/JavaScript SDK (https://www.npmjs.com/package/@looker/sdk). That step is handled automatically when you build with the Looker extension framework (/looker/docs/intro-to-extension-framework).

## Creating Visualizations With Looker Visualization Components

Looker's visualization components suite provides two high-level components for working with your data:
Query - Handles the data fetching and loads the response into React context
 (https://reactjs.org/docs/context.html)
Visualization - Accepts the data that is returned by Query and uses configuration adapters to render the appropriately customized chart on a page Currently, data can be rendered as the following chart types:
Line Area Scatter Sparkline Single value Bar Column Table Pie More chart types are in development.

To view the property tables for each chart type, visit the Visualization and Query property tables (/looker/docs/components-vis-prop-tables) documentation page.

To view the available configuration options for each chart type, view the visualization playground (https://developers.looker.com/components/visualization-components/) on the Looker Developer Portal (https://developers.looker.com/).

## Why Use Visualization Components?

Visualization components improve and simplify the process of rendering a visualization from Looker within an application, free up developer time, and give developers more options to customize and extend their visualizations from Looker.

Improved embedding - Visualization components allow developers to embed a Looker visualization in an application without an iframe. This can improve performance, monitoring, and the ability to customize.

Easy integration - Visualization components can then be combined with other components from @looker/components to create entirely new compositions and front-end experiences.

Customization - It is easier to customize embedded visualizations when using visualization components than when using iframes. Additionally, with visualization components, developers can create highly customized applications much faster, without having to create a visualization layer from scratch. Simplification - Visualization components improve the portability of Looker visualizations and simplify interactions with the Looker API.

# Installing Visualization Components

To get started, add the Looker Visualization Components NPM package (https://www.npmjs.com/package/@looker/visualizations):
NPM: npm install @looker/visualizations YARN: yarn add @looker/visualizations You'll also need to satisfy a few peer dependencies - Looker/components, React, and Styled Components:
NPM: npm install @looker/components react react-dom styled-components YARN: yarn add @looker/components react react-dom styled-components Information on installing and using the visualization components package can be found in the README document, available in GitHub (https://github.com/looker-open-source/components/tree/main/packages/visualizations) and NPM (https://www.npmjs.com/package/@looker/visualizations).

## Next Steps

Using visualization components and the dashboard property to render a simple visualization
 (/looker/docs/components-vis-dashboard-id)
Using visualization components and the query property to render a simple visualization
 (/looker/docs/components-vis-qid)
Using visualization components to render custom visualizations
 (/looker/docs/components-vis-render-custom-vis)
Using visualization components to build a custom visualization
 (/looker/docs/components-vis-custom)
Visualization and Query property tables (/looker/docs/components-vis-prop-tables)
Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License
 (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies
 (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2022-08-17 UTC.