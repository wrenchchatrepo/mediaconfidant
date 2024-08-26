# Spectacles.dev: A Must-Have for Small Startups Using Looker

For small startups leveraging Looker, Spectacles.dev is a game-changer. It revolutionizes Looker integration by automating the testing of your LookML code through a continuous integration (CI) tool specifically designed for Looker. Spectacles ensures that your data models remain accurate and reliable, preventing costly errors from reaching your dashboards.

Backed by a team with deep experience in Looker development, Spectacles.dev offers SQL and content validation directly through the Looker API, making it an essential addition to your development workflow. The tool integrates seamlessly with your existing processes, and its flexible pricing model makes it accessible even for smaller businesses.

With positive feedback from the community and the ability to streamline and safeguard your Looker instance, Spectacles.dev is a vital tool for any startup serious about data accuracy and efficient Looker development.

## Why Choose Spectacles.dev?

+ Automated Testing: Ensure error-free LookML code with continuous integration.

+ Developer Confidence: Reduce the risk of errors and enhance workflow efficiency.

+ Flexible Pricing: Accessible plans for startups of all sizes.

+ Proven Expertise: Developed by a team with extensive Looker experience.

For more information, visit Spectacles.dev.

## Spectacles Looker GenAI Guide

### Ready Your Looker Instance for GenAI: Spectacles’ Guide to Success

**Looker + GenAI**

The dawn of GenAI in Looker presents a huge opportunity for enterprise customers. Data teams will add conversational interfaces to BI that enable their internal stakeholders to ask direct questions of Looker and augment their Looker developers with generative tools like the LookML Assistant.

The industry has proven that Large Language Models (LLMs) respond best to questions when they have a semantic model like LookML to draw from. But the output of these GenAI-enabled tools is only as effective as the quality of the semantic model supporting them.

When someone asks an LLM a question to inform a business decision, it’s vital the LLM gets the answer right. We want to maximize the potential of GenAI in your Looker instance, and give you the confidence to roll out new tech in your organization, without having to cross your fingers every time you make a change to LookML. Here’s where Spectacles comes in.

### What Spectacles Brings to the Table

Spectacles is on a mission to help businesses make the most of their Looker instances. We built Spectacles to solve our own problems as Looker developers - now we’re dedicated to sharing what we have learned with other organizations.

Our customers use Spectacles to take complex Looker instances and curate them, so they are free of errors, up to date, and laser-focused. Our suite of tools helps Looker developers and admins identify errors in development, enforce code quality standards, and remove unused LookML and content, delivering a fast and functional Looker instance. For those looking to fully leverage Looker’s GenAI tools, Spectacles enables Looker Developers to create ‘golden’ Explores that are primed and ready for GenAI integration.

### Preparation is Key

What do the perfect chocolate cake and a successful GenAI-powered conversational interface have in common? You’ve got it, preparation.

Even the most innovative, future-thinking companies need to engage in a data readiness exercise (preparing their ingredients) to make the most of these tools. Like any great recipe, the magic is in the prep.

### What is Holding Companies Back?

Looker instances can be challenging for LLMs to navigate, leading to embarrassing hallucinations, incorrect outcomes, and a data team looking sheepish with support tickets coming out of their ears.

### Key Barriers to Success:

+ Scale: Complex, unoptimized LookML projects, with thousands of dimensions and measures, are enormous repositories for LLMs to search through, increasing the likelihood of hallucinations.

+ Duplication: Duplicated fields, legacy fields, or fields without enough metadata to differentiate them, can confuse the LLM. Humans may be able to tell the difference, but LLMs cannot.

+ Lack of documentation: Without labels, descriptions, and tags, the LLM is forced to choose the right fields based solely on the field names.

+ Hidden errors: 45% of all LookML changes contain a hidden SQL, data test, or content error (from our own data testing over 50,000 LookML changes). This means that the LLM can choose broken fields without knowing, resulting in an error for the end user.

Here’s a good heuristic for assessing your AI readiness: Ask yourself, could a new hire on my team answer this question using only the information present in our LookML project? If the answer is no, you shouldn’t expect an LLM to do any better.

### The No-Brainer

Our Spectacles proprietary tools help Looker teams curate their LookML, detect SQL errors, and produce AI-ready instances. Our team has nearly a decade of experience consulting with companies on Looker development, which means we are uniquely qualified to provide bespoke solutions for each customer and guide them through integration with GenAI/Looker tools as they are released. We are trusted guides to walk alongside companies who are curious about these tools but don’t know where to start when it comes to getting their instances in order.

If you are curious about how Looker’s AI-enabled tools can supercharge your instance, visit spectacles.dev/book-demo and book in a 15-minute call with our co-founder, Dylan (dylan@spectacles.dev).

## Security at Spectacles

Contact: security@spectacles.dev

### Our Security Model

+ We don’t connect directly to your database: Spectacles uses a Looker service account with a Looker API key to interact with your Looker instance and query your database. This means you can leverage Looker’s flexible and robust security model to restrict access to functionality or data as needed. We also support Looker’s IP Allowlist for customers who want to restrict traffic to trusted sources.

+ We never access or store your company’s data: When Spectacles runs SQL queries via Looker to test your LookML, we mandate a LIMIT 0 clause on all queries so data is never retrieved. Spectacles only stores metadata, like the error messages we uncover.

+ Transparent, open core: Our core functionality exists as an open-source command line interface (CLI) with source code available for review on GitHub. We review changes and contributions to our open-source codebase with the same scrutiny and high standards as our proprietary codebase.

+ Serverless cloud architecture: Our infrastructure is managed by Google Cloud, our cloud provider. We leverage serverless cloud resources to ensure systems are automatically and regularly updated, continually monitored, and assessed for vulnerabilities.

### Standards and Compliance

Spectacles is SOC 2 Type I certified and has obtained a HIPAA attestation. We are currently undergoing our SOC 2 Type II audit and expect to have our report in hand by August 2022.

We have also completed and continue to maintain compliance with the CIS Google Cloud Level 1 Benchmark.

For more information, please refer to:

+ Looker Permissions Documentation

+ Looker IP Allowlist Documentation

+ Spectacles GitHub Repository
