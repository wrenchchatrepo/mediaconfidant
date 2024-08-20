# Import Existing Cloud Infrastructure | Pulumi Docs

## Importing Resources

Most infrastructure as code (IaC) projects require working with existing cloud resources, whether those resources were originally created with another IaC tool or manually provisioned with a cloud provider console or CLI. Interacting with a previously created cloud resource with Pulumi typically happens in one of two ways:

1. **Referencing the properties** of the existing cloud resource to use those properties to configure a Pulumi-managed resource.
2. **Adopting the existing resource** to bring it under management by Pulumi.

The first scenario is sometimes called **coexistence**. The second scenario is called **adoption or import**.

### Two Ways to Import a Resource

There are two ways to import an existing cloud resource into a Pulumi project:

1. **With the `pulumi import` CLI command:** This command imports the resource into the currently selected stack and generates code describing the resource’s current configuration for you to add to your Pulumi program.
2. **In code, with the `import` resource option:** This option is supplied as an additional property on a resource declaration that you write into your Pulumi program.

Both approaches allow you to adopt and begin managing existing cloud resources with Pulumi, but they work in slightly different ways and are suited to slightly different use cases.

### How Resource Import Works

Import uses the selected stack’s configured provider to look up the desired resource in the cloud provider, read its current configuration, and add the resource to the stack to bring it under management by Pulumi from that point forward. For this, it requires two pieces of information:

1. **The type of cloud resource to import:** Either as a type token (a string that uniquely identifies a Pulumi resource type) when using the CLI or as a resource declaration when importing in code. For example, the type token of an Amazon S3 Bucket resource is `aws:s3/bucket:Bucket`.
2. **The name and value of the property to use for the resource lookup:** Lookup properties vary by resource. For an Amazon S3 bucket, the property used for lookup is `bucket`, so the value to use for the lookup would be the bucket’s globally unique name.

### Where to Find the Type Token and Lookup Property

You’ll find the type token and lookup property in the **Import** section of the resource’s API documentation in the Pulumi Registry. The type token is quoted in the `pulumi import` example, and the lookup property can be found in the description just above it.

### Importing Resources with the CLI

The `pulumi import` command looks up the resource using the specified type token and resource identifier, adds the resource to the stack’s current state, and emits the code required to manage the resource with Pulumi from that point forward. This option requires the least manual effort and is best suited to projects consisting of only one stack.

To import an existing cloud resource with the Pulumi CLI, use the following syntax:

`$ pulumi import`

- **Type:** The Pulumi type token for the imported resource.
- **Name:** The resource name to apply to the resource once it’s imported. This name must be unique among all resources for this type within the scope of the containing project.
- **ID:** The value to use for the resource lookup in the cloud provider.

#### Example

In this example, a previously provisioned Amazon S3 bucket named `company-infra-logs` is imported into a Pulumi stack named `dev` (the currently selected stack) and given a resource name of `infra-logs`:

`$ pulumi import aws:s3/bucket:Bucket infra-logs company-infra-logs`

### Importing Resources in Code

Another way to import existing cloud resources into a Pulumi project is in code, using the `import` resource option. This approach involves writing the code to define the resource yourself, which may be preferable in scenarios that call for importing multiple resources of the same type across multiple stacks and/or deployment environments.

When Pulumi encounters a resource with the `import` option set, it looks up the resource in the cloud provider using the specified ID. On the next `pulumi up`, if the resource is found, it will be imported.

#### Example

```typescript
import * as aws from "@pulumi/aws";

const group = new aws.ec2.SecurityGroup("my-sg", {
    name: "my-sg-62a569b",
    ingress: [{
        protocol: "tcp",
        fromPort: 80,
        toPort: 80,
        cidrBlocks: ["0.0.0.0/0"]
    }],
}, {
    import: "sg-04aeda9a214730248"
});
```

### Bulk Import Operations

If you need to import multiple resources, the CLI import command can be used with a JSON file that contains references to existing cloud resources. Using a JSON file with the import command can be helpful as part of scripting large bulk imports of cloud resources.

Pass the path to the JSON file using the --file ( -f ) option:

`$ pulumi import --file ./my-resources.json`

**Example JSON File**

```JSON
{
    "resources": [
        {
            "type": "aws:ec2/vpc:Vpc",
            "name": "application-vpc",
            "id": "vpc-0ad77710973388316"
        },
        {
            "type": "aws:ec2/subnet:Subnet",
            "name": "public-1",
            "id": "subnet-0fb5fdff92b9e5a3b"
        },
        {
            "type": "aws:ec2/subnet:Subnet",
            "name": "private-1",
            "id": "subnet-0a39d25dd9f7b7808"
        }
    ]
}
```

### Mismatched State

An important part of importing resources using the import resource option is that the resulting Pulumi program will faithfully generate the same desired state as your existing infrastructure’s actual state. After the import, you may edit your program to generate and apply new desired states to update your infrastructure.

If you forget to specify a property, or that property’s value is incorrect, you’ll first receive a warning during preview and then an error during the actual import update.

### Retaining Imported Resources

Be aware that once an imported resource has been brought under management with Pulumi, destroying its containing stack will delete the imported resource as well. If you wish to ensure that an imported resource survives through pulumi destroy, consider using the retainOnDelete resource option.

fter the “Retaining Imported Resources” section, the document discusses Mismatched State. This section emphasizes that when importing resources using the import resource option, the Pulumi program should accurately reflect the existing infrastructure’s actual state. If any properties are missing or incorrect, you will receive warnings during the preview and errors during the import update.

An example is provided where an incorrect ingress rule is specified, which triggers a warning and subsequent failure during the import operation. The document also covers how to handle bulk imports using a JSON file to reference multiple resources for import, along with details on the required schema for the JSON file.

Additionally, the document advises on how to generate a placeholder import file for every resource that would be created by running:

`pulumi preview --import-file <file>`

For the full content and further details, you would need to refer to the specific sections in the Pulumi documentation ￼.