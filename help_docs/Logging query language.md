# Logging Query Language

Release Notes This document describes, at a high level, the Logging query language that you use to query and filter Cloud Logging data. For in-depth information about the Logging query language design, see the Google API formal specifications for filtering  (https://google.aip.dev/160). For examples of common queries you might want to use, see Sample queries using the Logs Explorer (/logging/docs/view/query-library-preview).

## Overview

You can use the Logging query language in the Logs Explorer in the Google Cloud console, the Logging API (/logging/docs/reference/v2/rest/v2/entries/list), or the command-line interface (/logging/docs/api/gcloud-logging\#v2_api_commands). You can use the Logging query language to query data and to write filters to create sinks (/logging/docs/routing/overview\#sinks) and log-based metrics (/logging/docs/logs-based-metrics). A query is a Boolean expression that specifies a subset of all the log entries in your selected Google Cloud resource, such as a Google Cloud project or folder. You can build queries based on the LogEntry (/logging/docs/reference/v2/rest/v2/LogEntry) indexed field (\#indexed-fields) using the logical operators AND and OR. Using the resource.type field in the following examples, the Logging query language grammar looks like this:
Simple restriction: resource.type = "gae_app" Conjunctive restriction: resource.type = "gae_app" AND severity = "ERROR" Disjunctive restriction: resource.type = "gae_app" OR resource.type =
"gce_instance" Alternatively: resource.type = ("gae_app" OR "gce_instance")
Complex conjunctive/disjunctive expression: resource.type = "gae_app" AND
(severity = "ERROR" OR "error")
Following is a simple example of a query:
resource.type = "gce_instance" AND severity >= "ERROR" AND NOT textPayload:robot This query matches log entries from Compute Engine that have severity values of at least ERROR and whose textPayload field doesn't contain the string robot anywhere inside it. String comparisons aren't case sensitive. The names resource, severity, and textPayload are defined in the LogEntry (/logging/docs/reference/v2/rest/v2/LogEntry) type.

## Syntax Notation

The following sections provide an overview of the Logging query language syntax, and discuss in detail how queries are structured and how matching is performed. Some of the examples use comments (\#comments) to provide explanatory text. Note the following:
The length of a query can't exceed 20,000 characters. The Logging query language is case-insensitive, with the exception of regular expressions.

## Syntax Summary

The Logging query language syntax can be thought of in terms of *queries* and *comparisons*. A *query* is a string containing an *expression*:
expression = ["NOT"] comparison { ("AND" | "OR") ["NOT"] comparison }
A *comparison* is either a single value or a Boolean expression:
"The cat in the hat" resource.type = "gae_app" The first line is an example of a comparison that is a single value. These types of comparisons are *global restrictions*. Each field of a log entry is compared to the value by implicitly using the has operator. For this example, if any field in a LogEntry, or if its payload, contains the phrase "The cat in the hat", then the comparison is successful. The second line is an example of a comparison that is a Boolean expression of the form [FIELD_NAME] [OP] [VALUE]. The elements of the comparison are described below:
[FIELD_NAME] is a field in a log entry. For example, resource.type. [OP] is a comparison operator. For example, =. [VALUE] is a number, string, function, or parenthesized expression. For example, "gae_app". For JSON null values, use NULL_VALUE (https://developers.google.com/protocol-buffers/docs/reference/google.protobuf\#nullvalue).

## Boolean Operators

The Boolean operators AND and OR are short-circuit operators (https://en.wikipedia.org/wiki/Short-circuit_evaluation). The NOT operator has the highest precedence, followed by OR and AND in that order. For example, the following two expressions are equivalent:
"a" OR NOT "b" AND NOT "c" OR "d" ("a" OR (NOT "b")) AND ((NOT "c") OR "d")
You can omit the AND operator between comparisons. You can also replace the NOT operator with the - (minus) operator. For example, the following two queries are the same:
a="b" AND c="d" AND NOT e="f" This documentation always uses AND and NOT. For all filters except filters used by log views (/logging/docs/logs-views), you can use AND, OR, and NOT operators. Log views only support AND and NOT operations. To combine AND and OR rules in the same expression, you must nest the rules using parentheses. If you don't use parentheses, your query might not work as intended. Boolean operators always need to be capitalized. Lowercase and, or, and not are parsed as search terms.

Comparisons Comparisons have the following form:
[FIELD_NAME] [OP] [VALUE]
The elements of the comparison are described below:
[FIELD_NAME]: is the path name of a field in a log entry. Examples of the field name are:
resource.type resource.labels.zone resource.labels.project_id insertId jsonPayload.httpRequest.protocol labels."compute.googleapis.com/resource_id" If a component of a path name has special characters, the path name needs to be double-quoted. For example, compute.googleapis.com/resource_id needs to be double quoted because it contains a forward slash /. For details, see field path identifiers (\#field_path_identifiers) in this document.

| =         | -- equal                                              |
|-----------|-------------------------------------------------------|
| !=        | -- not equal                                          |
| > < >= <= | -- numeric ordering                                   |
| :         | -- "has" matches any substring in the log entry field |
| =~        | -- regular expression search for a pattern            |
| !~        | -- regular expression search not for a pattern        |

To learn how to search log entries using regular expressions, see Using regular expressions (\#regular-expressions).

[VALUE]: is a number, string, function, or *parenthesized* expression. Strings are used to represent arbitrary text, plus Boolean, enumeration, and byte-string values. The [VALUE] is converted to the field's type prior to the comparison. For JSON null values, use NULL_VALUE
 (https://developers.google.com/protocol-buffers/docs/reference/google.protobuf\#nullvalue).

To filter for a JSON null value, use the following syntax:
jsonPayload.field = NULL_VALUE -- includes "field" with null value NOT jsonPayload.field = NULL_VALUE -- excludes "field" with null value If [VALUE] is a parenthesized Boolean combination of comparisons, then the field name and the comparison operator are applied to each element. For example:
jsonPayload.cat = ("longhair" OR "shorthair") jsonPayload.animal : ("nice" AND "pet")
The first comparison checks that the field cat has the value "longhair" or "shorthair". The second checks that the value of the field animal contains both of the words "nice" and "pet", in any order.

Note: If a query is written with comparisons on multiple lines, as in the previous example, the comparisons are joined together using the Boolean AND operator.

## Field Path Identifiers

All log entries are instances of type LogEntry. The identifier that is (or begins) the left-hand side of a comparison must be a field defined in the LogEntry type. For details on the possible identifiers and their values, see the LogEntry type (/logging/docs/reference/v2/rest/v2/LogEntry). Here is the current list of log entry fields. Each field is followed by the next level of names for that field, if applicable:
httpRequest: { cacheFillBytes, cacheHit, cacheLookup, cacheValidatedWithOriginServer, latency, protocol, referer, remoteIp, requestMethod, requestSize, requestUrl, responseSize, serverIp, status, userAgent }
insertId jsonPayload { *variable* } labels { *variable* }
logName metadata { systemLabels, userLabels }
operation{ id, producer, first, last }
protoPayload { @type, *variable* }
receiveTimestamp resource { type, labels }
severity sourceLocation: { file, line, function }
spanId textPayload timestamp Following are examples of field path identifiers you can use in your comparisons:
resource.type: If your first path identifier is resource, then the next identifier must be a field in the MonitoredResource (/logging/docs/reference/v2/rest/v2/MonitoredResource) type. httpRequest.latency: If your first path identifier is httpRequest, then the next identifier must be a field in the HttpRequest (/logging/docs/reference/v2/rest/v2/LogEntry\#HttpRequest) type. labels.[KEY] If your first path identifier is labels, then the next identifier, [KEY], must be one of the keys from the key-value pairs appearing in the labels field. logName: Since the logName field is a string, you can't follow it by any subfield names.

When you query map (https://developers.google.com/protocol-buffers/docs/reference/proto3-spec\#map_field) or struct
 (https://developers.google.com/protocol-buffers/docs/reference/google.protobuf\#google.protobuf.Struct)
fields, you must preserve their keys' letter case and formatting in your expression. For example, jsonPayload is a struct field, so a field name nested inside jsonPayload like jsonPayload.end_time differs from jsonPayload.endTime. Similarly, for a map field like labels, the label key labels.env_name is different than labels.envName. In contrast, when querying the regular protocol buffer field protoPayload (/logging/docs/reference/v2/rpc/google.logging.v2\#logentry), you don't need to preserve case. For information on the LogEntry field types, see the google.logging.v2
 (/logging/docs/reference/v2/rpc/google.logging.v2) reference.

Special characters If a LogEntry field contains special characters, the log field must be quoted. For example:
jsonPayload.":name":apple jsonPayload."foo.bar":apple jsonPayload."\"foo\"":apple For the list of special characters, see the string section in Values and conversions (/logging/docs/view/logging-query-language\#values_conversions). For more information on using field path identifiers that reference objects or arrays, see Object and array types (\#object_array_types) in this document.

Monitored resource types For faster queries, specify a monitored resource type. For a list of resource types, see Monitored resource types (/logging/docs/api/v2/resource-list). For example, Compute Engine VMs use the resource type gce_instance and Amazon EC2 instances use aws_ec2_instance. The following example shows how to limit your queries to both type of VMs:
resource.type = ("gce_instance" OR "aws_ec2_instance")
The monitored resource type values in logs are indexed. Using substring matches for them results in slower queries.

## Missing Fields

If you use a field name in a query, and that field doesn't appear in a log entry, then the field is missing, **undefined**, or **defaulted**:
If the field is part of the log entry's payload (jsonPayload or protoPayload), or if it is in a label in the labels section of the log entry, then the field is **missing**. Using a missing field won't display an error, but all comparisons using missing fields fail silently. Examples: jsonPayload.nearest_store, protoPayload.name.nickname If the field is defined in the LogEntry (/logging/docs/reference/v2/rest/v2/LogEntry) type, then the field is **defaulted**. Comparisons are performed as if the field were present and had its default value. Examples: httpRequest.remoteIp, trace, operation.producer Otherwise, the field is **undefined**, which is an error that is detected before the query is used. Examples: thud, operation.thud, textPayload.thud To test if a missing or defaulted field exists without testing for a particular value in the field, use the :* comparison. For example, the following comparison succeeds if the field operation.id is explicitly present in a log entry:
operation.id:*
Note the behavior of the following queries:
When you use the Boolean NOT operator on a missing field, the result is TRUE:
-- Returns TRUE NOT missingField=foo When you use the not equal comparison operator != on a missing field, the result is FALSE:
-- Returns FALSE missingField!=foo Object and array types Each log entry field can hold a scalar, *object*, or *array*.

A scalar (https://developers.google.com/protocol-buffers/docs/proto3\#scalar) field stores a single value, like 174.4 or -1. A string is also considered a scalar. Fields that can be converted to (or from) a string, such as Duration and Timestamp are also scalar types. An object type stores a collection of named values, like the following JSON value:
{"age": 24, "height": 67}
You can refer to value inside an object. For example, if jsonPayload.x contained the preceding value, then jsonPayload.x.age would have the value 24. An array field stores a list of values—all of the same type. For example, a field holding measurements might have an array of numbers:
{8.5, 9, 6}
When comparisons are performed and [FIELD_NAME] is an array field, each member of the array is compared to [VALUE] and the results are joined together using the OR operator. For example, if jsonPayload.shoeSize is an array field that stores {8.5, 9, 6}, the comparison:
jsonPayload.shoeSize < 7 is equivalent to:
8.5 < 7 OR 9 < 7 OR 6 < 7 In this example, the overall comparison evaluates to successful.

## Values And Conversions

The first step in evaluating a comparison is to convert the right-hand side value to the type of the log entry field. Scalar field types are permitted in comparisons, along with two additional types whose values are represented as strings: Duration and Timestamp. For a list of scalar types, see the scalar protocol buffer types (https://developers.google.com/protocol-buffers/docs/proto3\#scalar) list. The following table explains what values can be converted to the log field types:

| Field type                                                   | Permitted query value                                                                                                                                                                                                                                                                                                                                                                                                                           |
|--------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| bool                                                         | "True" or "false" in any letter case. Examples: "True", "true"                                                                                                                                                                                                                                                                                                                                                                                  |
| bytes                                                        | A string containing any sequence of bytes. Example: "\377\377".                                                                                                                                                                                                                                                                                                                                                                                 |
| Duration                                                     | A string containing a signed decimal number followed by one of the units "ns", "us", "ms", "s", "m", or "h". Durations are accurate to nanoseconds. Example: "3.2s".                                                                                                                                                                                                                                                                            |
| enum                                                         | The name of an enumeration type literal, case-insensitive. Examples: "WARNING", which is a value of type LogSeverity  (/logging/docs/reference/v2/rest/v2/LogEntry#logseverity).                                                                                                                                                                                                                                                                |
| double                                                       | Any number, with or without a sign and an exponent part, or the special value strings "NaN", "-Infinity", and "Infinity" (either capitalized or not). Examples: "-3.2e-8", "nan".                                                                                                                                                                                                                                                               |
| intNN                                                        | Any signed integer that doesn't exceed the size of the type. Example: "-3".                                                                                                                                                                                                                                                                                                                                                                     |
| string                                                       | Any string that contains UTF-8 encoded or 7-bit ASCII text. Embedded quotation marks must be escaped with a backslash. String values must be double-quoted to escape the following special characters: Strings starting with + (plus), - (minus), or . (period). Strings with ~ (tilde), = (equals), () (parentheses), : (colon), > (greater than), < (less than), , (comma), . (period), or * (asterisk). Any escape sequence, for example \t. |
| Timestamp                                                    | A string in RFC 3339 (https://www.ietf.org/rfc/rfc3339.txt) or ISO 8601  (https://en.wikipedia.org/wiki/ISO_8601) format. Examples: "2014-10- 02T15:01:23.045Z" (RFC 3339), "2014-10-02" (ISO 8601). In query expressions, timestamps in RFC 3339 format can specify a timezone with "Z" or ±hh:mm. Timestamps are represented to nanosecond accuracy.                                                                                          |
| uintNN                                                       | Any unsigned integer that doesn't exceed the size of the type. Example: "1234".                                                                                                                                                                                                                                                                                                                                                                 |
| If an attempted conversion fails, then the comparison fails. |                                                                                                                                                                                                                                                                                                                                                                                                                                                 |

When a conversion requires a string, you can also use a number or unquoted text if they don't contain special characters such as spaces and operators. Similarly, when a conversion requires a number, you can use a string whose content is a number.

The types intNN and uintNN represent integer types of various sizes, such as int32 and uint64. When writing a value to be converted to a 64-bit integer type, you write the value as a string, such as "9223372036854775807".

## Types Of Log Fields

Here is how the type of a log entry field is determined:
Log fields defined in the type LogEntry (/logging/docs/reference/v2/rest/v2/LogEntry), and in the component type are protocol buffer fields (https://developers.google.com/protocol-buffers/docs/proto3\#scalar). Protocol buffer fields have explicit types. Log fields that are part of protoPayload objects are also protocol buffer (https://developers.google.com/protocol-buffers/docs/proto3) fields and have explicit types. The name of the protocol buffer type is stored in the field "@type" of protoPayload. For more information, see the JSON mapping (https://developers.google.com/protocol-buffers/docs/proto3\#json). When you are filtering on a field that is associated with the Any (https://github.com/protocolbuffers/protobuf/blob/main/src/google/protobuf/any.proto) message type, the value field is automatically traversed. Therefore, don't include it in the query. For more information, see Troubleshooting (\#filter-on-any). Log fields inside of jsonPayload have types that are inferred from the field's value when the log entry is received:
Fields whose values are unquoted numbers have type double. Fields whose values are true or false have type bool. Fields whose values are strings have type string.

Long (64-bit) integers are stored in string fields, because they can't be represented exactly as double values. The Duration and Timestamp types are recognized only in protocol buffer fields (https://developers.google.com/protocol-buffers/docs/proto3). Elsewhere, those values are stored in string fields.

## Comments

Comments start with two dashes (--), and any text following the dashes is ignored until the end of the line. Comments can be placed at the beginning of a filter, in between terms, and at the end of a filter. You might use comments for the following cases:
To annotate your complex filters with information about what a clause does:
-- All of our target users are emitted by Compute Engine instances. resource.type = "gce_instance" -- Looking for logs from "alex". jsonPayload.targetUser = "alex" To quickly enable or disable a clause by adding or removing the comment prefix:
resource.type = "gce_instance" -- jsonPayload.targetUser = "alex" jsonPayload.targetUser = "kiran" -- jsonPayload.targetUser = "sasha" Note: Comments count towards the maximum filter character limit of 20,000 characters.

Comparison operators The meaning of the equality (=, !=) and inequality (<, <=, >, >=) operators depends on the underlying type of the left-hand field name.

All numeric types: Equality and inequality have their normal meaning for numbers. bool: Equality means the same Boolean value. Inequality is defined by true>false. enum: Equality means the same enumeration value. Inequality uses the underlying numeric values of the enumeration literals. Duration: Equality means the same duration length. Inequality is based on the length of the duration. Example: as durations, "1s">"999ms".

Timestamp: Equality means the same instant in time. If a and b are Timestamp values, a < b means a is earlier in time than b. bytes: Operands are compared byte by byte, left-to-right. string: Comparisons ignore letter case. Specifically, both operands are first normalized using NFKC_CF Unicode normalization (http://unicode.org/reports/tr44/\#NFKC_Casefold) and then use lexicographic comparisons. However, regular expression searches aren't normalized. For more information on searching log entries using regular expressions, see Using regular expressions (\#regular-expressions).

The substring operator (:) is applicable to string and bytes, and is handled like equality except that the right-hand operand need only equal some part of the left-hand field. Substring matches on indexed fields don't take advantage of log indexes.

## Global Restrictions

If the comparison consists of a single value, it is called a *global restriction*. Logging uses the has (:) operator to determine if any field in a log entry, or if its payload, contains the global restriction. If it does, then the comparison succeeds. The simplest query written in terms of a global restriction is a single value:
"The Cat in The Hat" You can combine global restrictions using the AND and OR operators for a more interesting query. For example, if you want to display all log entries that have a field that contains cat and a field that contains either hat or bat, write the query as:
("cat" AND ("hat" OR "bat"))
In this case, there are three global restrictions: cat, hat and bat. These global restrictions are applied separately and the results are combined, just as if the expression had been written without parentheses.

A global restriction is an easy way to query your logs for a particular value. For example, if you are looking in your activity log for entries containing any mention of GCE_OPERATION_DONE, you can use the following query:
logName = "projects/my-project-id/logs/compute.googleapis.com%2Factivity_log" AN "GCE_OPERATION_DONE"
Although global restrictions are easy, they can be slow; for more information, see Finding log entries quickly (\#finding-quickly) in this document.

Functions You can use built-in functions as global restrictions in queries:
function = identifier ( [ argument { , argument } ] )
where argument is a value, field name, or a *parenthesized* expression. The functions are described in the following sections.

log_id The log_id function returns log entries that match the given [LOG_ID] argument from the logName (/logging/docs/reference/v2/rest/v2/LogEntry) field:
log_id([LOG_ID])
For example, the following query returns all log entries with a cloudaudit.googleapis.com%2Factivity [LOG_ID]:
log_id("cloudaudit.googleapis.com/activity") Note: When using the log_id function, you don't need to URL escape the [LOG_ID]. The log_id function is useful when creating a custom log view (/logging/docs/logs-views) on a log bucket (/logging/docs/buckets) that contains log entries from many Google Cloud projects, folders, or organizations.

cast The cast function accepts two parameters; the LogEntry (/logging/docs/reference/v2/rest/v2/LogEntry) field to be casted, and the data type in which the field is converted to:
cast([FIELD], [TYPE][, OPTION])
The parameters of the previous expression are defined as follows:
[FIELD]: The name of a field in the log entry, such as logName or jsonPayload.a_field. [TYPE]: The data type, such as STRING, INT64, FLOAT64, BOOL.

TIMESTAMP, or DURATION: Some data types offer additional options, such as specifying an IANA Timezone Database (https://www.iana.org/time-zones) timezone for the TIMESTAMP data type.

For example, the following query casts the timestamp field into a STRING and specifies the America/New_York timezone:
cast(timestamp, STRING, TIMEZONE("America/New_York")) =~ "^2023-01-02.*"
regexp_extract Use the regexp_extract function to find the first substring that matches a regular expression:
REGEXP_EXTRACT([FIELD], [REGULAR_EXPRESSION])
In the previous expression, the fields are defined as follows:
[FIELD]: The name of a field in the log entry, such as logName or jsonPayload.a_field. [REGULAR_EXPRESSION]: The RE2 regular expression (https://github.com/google/re2/wiki/Syntax) that must contain one capture group ((...)). A non-capturing group (?:...) must be used if additional grouping is required for the regular expression. Multiple capture groups or no capture groups result in an error.

You can chain the cast and regexp_extract functions:
CAST(REGEXP_EXTRACT(CAST(timestamp, STRING), "\\d+:\\d+:\\d+\\.(\\d+)"), INT64)
The previous example casts the timestamp field as a string. The regular expression captures the millisecond portion of the timestamp string and casts it into an integer to perform a numeric comparison. All log entries that contain timestamps where the millisecond field is less than 500 are returned.

## Source

The source function matches log entries from a particular resource in the organizations, folders, and Google Cloud projects hierarchy. The source function doesn't match child resources. For example, using source(folders/folder_123) matches logs from the folder_123 resource, and not logs from the Google Cloud project resources within folder_123. To query for logs at a particular resource level, use the following syntax:
source(RESOURCE_TYPE edit/RESOURCE_ID edit)

| Resource              | Example query                         |
|-----------------------|---------------------------------------|
| Organization          | source(organizations/ORGANIZATION_ID) |
| Folder                | source(folders/FOLDER_ID)             |
| Google Cloud projects | source(projects/PROJECT_ID)           |

Note: The source function is useful when creating a custom log view (/logging/docs/logs-views) on a log bucket (/logging/docs/buckets) that contains log entries from many Google Cloud projects, folders, or organizations.

sample The sample function selects a fraction of the total number of log entries:
sample([FIELD], [FRACTION])
[FIELD] is the name of a field in the log entry, such as logName or jsonPayload.a_field. The value of the field determines whether the log entry is in the sample. The field type must be a string or numeric value. Setting [FIELD] to insertId is a good choice, because every log entry has a different value for that field. [FRACTION] is the fraction of log entries that have values for [FIELD] to include. It is a number greater than 0.0 and no greater than 1.0. For example, if you specify 0.01, then the sample contains roughly one percent of all log entries that have values for [FIELD]. If [FRACTION] is 1, then all the log entries that have values for [FIELD] are chosen. Example: The following query returns 25 percent of the log entries from log syslog:
logName = "projects/my-project/logs/syslog" AND sample(insertId, 0.25)
Details: A deterministic algorithm, based on hashing, is used to determine if a log entry is included, or excluded, from the sample. The accuracy of the resulting sample is dependent on the distribution of the hashed values. If the hashed values aren't uniformly distributed, then the resulting sample can be skewed. In the worst case, when [FIELD] always contains the same value, the resulting sample contains either the [FRACTION] of all log entries or no log entries. If [FIELD] does appear in a log entry, then:
A hash of the value is computed. The hashed value, which is a number, is divided by the maximum possible hashed value. If the resulting fraction is less than or equal to [FRACTION], the log entry is included in the sample; otherwise it is excluded from the sample.

If [FIELD] doesn't appear in a log entry, then:
If [FIELD] is part of the log entry's payload or labels sections, the log entry isn't selected for the sample, even if [FRACTION] is 1. Otherwise, the log entry is treated as if [FIELD] is in the log entry and the value of [FIELD] is the default value. The default value is determined by the LogEntry (/logging/docs/reference/v2/rest/v2/LogEntry) type. For more information on missing and defaulted fields, see Missing fields (\#missing_fields) in this document.

To exclude log entries with defaulted fields from the sample, use the field-exists operator, :*. The following query produces a 1 percent sample of log entries that have explicitly supplied a value for field:
field:* AND sample(field, 0.01)

## Ip_In_Net

The ip_in_net function determines if an IP address in a log entry is contained in a subnet. You might use this to tell if a request comes from an internal or external source. For example:
ip_in_net([FIELD], [SUBNET])
[FIELD] is a string-valued field in the log entry that contains an IP address or range. The field can be repeating, in which case only one of the repeated fields has to have an address or range contained in the subnet. [SUBNET] is a string constant for an IP address or range. It is an error if [SUBNET] isn't a legal IP address or range, as described later in this section. Example: The following query tests an IP address in the payload of log entries from the log my_log:
logName = "projects/my_project/logs/my_log" AND ip_in_net(jsonPayload.realClientIP, "10.1.2.0/24")
Details: If, in a log entry, [FIELD] is missing, defaulted, or it does not contain a legal IP address or range, then the function returns false. For more information on missing and defaulted fields, see Missing fields (\#missing_fields) in this document. Examples of the supported IP addresses and ranges follow:
IPv4: 10.1.2.3 IPv4 subnet: 10.1.2.0/24 CIDR IPv6: 1234:5678:90ab:cdef:1234:5678:90ab:cdef CIDR IPv6 subnet: 1:2::/48

## Search Function

Note: If you use the search bar to perform text searches and if you don't wrap your search terms in double quotes, then the SEARCH function is used. For example, if you enter world in the search bar, then Logging runs the query SEARCH("world").

You can use the built-in SEARCH function to find strings in your log data:
SEARCH([query]) SEARCH([field], [query])
Both forms of the SEARCH function contain a query argument, which must be formatted as a string literal. In the first form, the entire log entry is searched. In the second form, you specify the field in the log entry to search. You must specify the query field. If this field isn't specified, then an error is returned. When the SEARCH function is processed, the query string is processed by a text analyzer that splits the string into tokens. Cloud Logging always performs case-insensitive comparisons, even for tokens wrapped with backticks. This behavior differs from that of BigQuery, which preserves case in tokens wrapped with backticks. For information about the analyzer rules, see the BigQuery document Text analyzer rules (/bigquery/docs/reference/standard-sql/text-analysis). When constructing a search, consider the following:
Tokens are case-insensitive. The following functions produce the same results:
SEARCH("world") SEARCH("World")
The previous functions match a log entry when a single field contains the token "world". Because SEARCH performs exact matches and not substring matches, the previous functions don't match a field whose value is "worldwide". If you don't specify the field to search, then the SEARCH function matches a log entry when that log entry contains all tokens. However, the order of tokens doesn't matter and the tokens aren't required to be found in the same field of the log entry. The following functions produce the same results, and they match a log entry that contains the tokens "hello" and "world":
SEARCH("hello world") SEARCH("World hello")
If you specify the field to search, then the SEARCH function only searches that field. A match occurs when that field contains all tokens; however, the order of tokens doesn't matter. The following functions produce a match only when the textPayload field contains the tokens "hello" and "world":
SEARCH(textPayload, "hello world")
To impose a case-insensitive but exact match on a phrase, enclose the phrase in backticks. For example, the following functions match the string "hello world":
SEARCH("`hello world`") SEARCH("`Hello World`") SEARCH("`HELLO WORLD`")
Because backticks are used in the following functions, they produce different results:
SEARCH("`hello world`") SEARCH("`world hello`")
The Logging query language supports different ways that you can search your log data. When searching for a string, it is more efficient to use the SEARCH function than to perform a global search or a substring search. However, you can't use use the SEARCH function to match nontext fields. For guidance on performing search operations, see Minimize global and substring searches (\#minimize-searching).

## Searching By Time

In the interface, you can set specific limits on the date and time of log entries to show. For example, if you add the following conditions to your query, the preview displays exactly the log entries in the indicated 30-minute period and you won't be able to scroll outside of that date range:
timestamp >= "2016-11-29T23:00:00Z" timestamp <= "2016-11-29T23:30:00Z"
When writing a query with a timestamp, you must use dates and times in the format shown above. You can also search log entries using timestamp shortcuts. For example, you can enter a date with a comparison operator to get all log entries after a certain day:
timestamp > "2016-11-29" Note: Logging interprets query expressions that use the YYYY-MM-DD format as YYYY-MM-DDT00:00:00Z.

## Using Regular Expressions

You can use regular expressions to build queries and create filters for sinks, metrics, and wherever log filters are used. You can use regular expressions in the **Query builder** (/logging/docs/view/logs-viewer-interface) and with Google Cloud CLI (/logging/docs/reference/tools/gcloud-logging). A regular expression is a sequence of characters that define a search. The Logging query language uses the RE2 syntax. For a complete explanation of the RE2 syntax, see the RE2 wiki on GitHub (https://github.com/google/re2/wiki/Syntax). Regular expression queries have the following characteristics:
Only fields of the string type can be matched with a regular expression. String normalization isn't performed; for example, kubernetes isn't considered the same as KUBERNETES. For more information, see the Comparison operators (\#comparison-operators) section.

Queries are case sensitive and not anchored by default.

Boolean operators can be used between multiple regular expressions on the right side of the regular expression comparison operator, =~ and !~.

A regular expression query has the following structure: Match a pattern:
jsonPayload.message =~ "regular expression pattern" Does not match a pattern:
jsonPayload.message !~ "regular expression pattern" The =~ and !~ changes the query to a regular expression query, and the pattern you're trying to match must be within double quotation marks. To query for patterns that *contain* double quotation marks, escape them using a backslash.

Note: Regular expression queries offer a potential speed increase over a regular text query. For example, querying for log entries that contain both foo and bar can be faster using the regular expression query jsonPayload.message =~ "foo.*bar|bar.*foo" than the substring query jsonPayload.message : ("foo" AND "bar").

| Query type     | Example                      |
|----------------|------------------------------|
| Standard query | sourceLocation.file =~ "foo" |

Examples querying logs using regular expressions Query type **Example**

| Query with case-insensitive search labels.subnetwork_name =~ "(?i)foo" Query containing quotation marks jsonPayload.message =~ "field1=\"bar.*\"" Query using a boolean or labels.pod_name =~ "(foo|bar)" Query using anchors logName =~ "/my%2Flog$" Query not matching a pattern labels.pod_name !~ "foo" Query using boolean operator labels.env =~ ("^prod.*server" OR "^staging.*server") Query that begins with a value logName =~ "^foo" Query that ends with a value logName =~ "foo$"   |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

Note: For a detailed explanation of the RE2 syntax, see the RE2 wiki page (https://github.com/google/re2/wiki/Syntax).

## Finding Log Entries Quickly

To find log entries more efficiently, do the following:
Query using indexed fields. Minimize the number of log entries that must be searched.

## Use Indexed Fields

Logging always indexes the following LogEntry (/logging/docs/reference/v2/rest/v2/LogEntry) fields:
resource.type (/logging/docs/reference/v2/rest/v2/LogEntry) resource.labels.* (/logging/docs/reference/v2/rest/v2/LogEntry) logName (/logging/docs/reference/v2/rest/v2/LogEntry) severity (/logging/docs/reference/v2/rest/v2/LogEntry) timestamp (/logging/docs/reference/v2/rest/v2/LogEntry) insertId (/logging/docs/reference/v2/rest/v2/LogEntry) operation.id (/logging/docs/reference/v2/rest/v2/LogEntry\#LogEntryOperation) trace (/logging/docs/reference/v2/rest/v2/LogEntry) httpRequest.status (/logging/docs/reference/v2/rest/v2/LogEntry\#HttpRequest) labels.* (/logging/docs/reference/v2/rest/v2/LogEntry) split.uid (/logging/docs/reference/v2/rest/v2/LogEntry)
You can also add custom indexed fields (/logging/docs/analyze/custom-index) to any log bucket. The next sections explain how to use indexed fields to minimize the number of log entries to be searched.

## Optimize Your Queries

Make your searches faster by reducing the number of logs, the number of log entries, or the time span of your searches. Even better, you can reduce all three.

## Example: Use The Right Log Name

Specify the log containing the log entries you're interested in. Be sure you know the actual log name by inspecting one of your log entries. For example, the preview shows that there is a log in the Compute Engine section named "activity". On closer inspection of the Admin Activity audit log entries, the log is actually named "cloudaudit.googleapis.com/activity". The following comparison is **incorrect**. It doesn't match anything because it uses the wrong log name:
logName = "projects/my-project-id/logs/activity" -- WRONG!

The following comparison is **correct**. It chooses log entries from the Admin Activity audit log entries. You must URL-encode the log name, as shown:
logName = "projects/my-project-id/logs/cloudaudit.googleapis.com%2Factivity" Example: Choose the right log entries If you know that the log entries you want are coming from a particular VM instance, then specify it. Check for the right label names by inspecting one of the log entries that you want to search for. In the following example, instance_id is one of the indexed labels:
resource.type = "gce_instance" AND resource.labels.instance_id = "6731710280662790612" logName = "projects/my-project-id/logs/cloudaudit.googleapis.com%2Factivity" Example: Choose the right time period Specify a time period to search in. A quick way of determining useful timestamps in RFC 3339 format is to use the GNU/Linux date command:
$ date --rfc-3339=s 2016-06-27 17:39:00-04:00 $ date --rfc-3339=s --date="3 hours ago" 2016-06-27 14:40:00-04:00 $ date --rfc-3339=s --date="5 hours ago" 2016-06-27 12:40:00-04:00 Use the values of these timestamps in the following queries. To create a timestamp acceptable to Logging, replace the space between the date and time with the letter T. For example, to search within the last three hours:
timestamp >= "2016-06-27T14:40:00-04:00" As another example, to search between three and five hours ago:
timestamp >= "2016-06-27T12:40:00-04:00" AND timestamp <= "2016-06-27T14:40:00-04:00" Minimize global and substring searches Avoid the temptation to take shortcuts when typing queries. Example: Don't use global searches If you're searching for a log entry with "Hello Kitty" in the payload:
Don't use a global search. For one reason, they are all substring searches:
"Hello Kitty" -- THIS CAUSES A SLOW SEARCH!

Do limit the search to a single field, even if you must keep the substring search:
textPayload:"Hello Kitty" Do use an equality test if you can:
textPayload = "Hello Kitty" Do reference individual fields in a payload, if your log entries have structured payloads:
jsonPayload.my_favorite_cat = "Hello Kitty" Do use an indexed field to restrict the search:
logName = "projects/my-project_id/logs/somelog" AND jsonPayload.my_favorite_cat = "Hello Kitty" Do use the SEARCH function and specify the complete text to match. The SEARCH function performs a case-insensitive match:
SEARCH("Hello Kitty")
Don't use the SEARCH function and specify partial text. For example, the following function doesn't match "Hello Kitty".

SEARCH("Hello Kit")
Searching examples The log entries shown are the ones that match a query. If the **Jump to time** menu contains a value, then the display scrolls to that point in time. Here are some query examples:
resource.type=gae_app Finds all App Engine log entries. For a list of resource types, see Monitored resource list (/logging/docs/api/v2/resource-list). As you type, the preview suggests completions for fields like resource.type.

resource.type=gae_app AND logName:request_log Finds log entries for App Engine apps from log names containing request_log. Note several things:
The = operator is exact equality. The resource type must be exactly "gae_app" except for letter case. The : operator means "has". The logName field must contain request_log, in any letter case. The actual log name is much longer. Using : might result in slower searches. The two comparisons are joined by AND. You can also use OR, but AND is assumed if you leave out the operator.

resource.type = (gce_instance OR aws_ec2_instance) AND severity >= ERROR
Finds log entries with either of two resource types: Compute Engine VM instance or AWS EC2 VM instance. The log entries must have severity of at least ERROR, which is equivalent to selecting **ERROR** in the query interface's severity menu.

logName = "projects/[PROJECT_ID]/logs/cloudaudit.googleapis.com%2Factivity" Finds all the Admin Activity audit log entries in the project [PROJECT_ID]. Audit logs all use the same log name in a project, but have different resource types. The log ID,
cloudaudit.googleapis.com/activity must be URL-encoded in the log name. Using equality in the comparison speeds up the search. For more information, see Understanding audit logs (/logging/docs/audit/understanding-audit-logs).

unicorn Finds log entries containing unicorn in any field, in any letter case. A search term that isn't part of a field comparison is an "all fields" query.

unicorn phoenix Finds log entries that contain unicorn in some field and phoenix in some field.

textPayload:(unicorn phoenix)
Finds log entries whose textPayload field contains both unicorn and phoenix in any order—the AND is implicit between the two words.

textPayload:"unicorn phoenix" Finds log entries whose textPayload field contains the string "unicorn phoenix".

NOT textPayload: "unicorn phoenix" Finds log entries whose textPayload field does *not contain* the string "unicorn phoenix". This type of query reduces unwanted log entries.

timestamp >= "2016-11-29T23:00:00Z" timestamp <= "2016-11-29T23:30:00Z"
Finds log entries within a 30-minute period.

## Troubleshooting

Syntax issues If you have problems with your queries' expressions, check the following:
Your query obeys the syntax rules, with matched parentheses and quotation marks. Your log entry field names are correctly spelled.

Boolean operations are in uppercase letters (AND, OR, NOT).

Ensure that you're using NULL_VALUE (https://developers.google.com/protocol-buffers/docs/reference/google.protobuf\#nullvalue) to represent JSON null values. Boolean expressions as global restrictions or as the right-hand side of comparisons should be parenthesized for clarity. For example, the two queries below look the same, but are not:
insertId = "ABC-1" OR "ABC-2" -- ERROR!? insertId = ("ABC-1" OR "ABC-2")
star Unquoted text must not contain any special characters. When in doubt, add double quotation marks. For example, the first comparison below is illegal because of the embedded substring operator (:). The comparison must be written with quotation marks:
insertId = abc:def -- ILLEGAL! insertId = "abc:def" Note: If you use the search bar and if you don't wrap the search terms in double quotes, then the SEARCH function (/logging/docs/view/logging-query-language\#search-functions) is used. The SEARCH
function performs a search along token boundaries. For example, if you enter world in the search bar, then Logging runs the query SEARCH("world"). The previous query matches world but it doesn't match worlds.

The Google Cloud CLI (/logging/docs/reference/tools/gcloud-logging) requires the query to be in double quotes. To use double quotes for escaping special characters using the gcloud logging command, wrap the entire query with single quotes instead:
gcloud logging read 'resource.type=gce_instance AND jsonPayload.message="Sto gcloud logging read 'timestamp>="2020-06-17T21:00:00Z"'
When you are filtering on a field that is associated with the Any
 (https://github.com/protocolbuffers/protobuf/blob/main/src/google/protobuf/any.proto) message type, the value field is automatically traversed. Therefore, don't include value in the query. For example, the Status
 (https://github.com/grpc/grpc/blob/master/src/proto/grpc/status/status.proto) field in an AuditLog (/logging/docs/reference/audit/auditlog/rest/Shared.Types/AuditLog) message has a details field that is of type google.protobuf.Any. To query the details field, omit the value field when specifying the filter:
checkDo protoPayload.status.details.conditionNotMet.userVisibleMessage =~ "Spec not_interested**Don't**
protoPayload.status.details.value.conditionNotMet.userVisibleMessage =~
Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-04-16 UTC.

# Filtering

Often, when listing resources (using a list method as defined in AIP-132 or something reasonably similar), it is desirable to filter over the collection and only return results that the user is interested in.

It is tempting to define a structure to handle the precise filtering needs for each API. However, filtering requirements evolve frequently, and therefore it is prudent to use a string field with a structured syntax accessible to a non-technical audience. This allows updates to be able to be made transparently, without waiting for UI or client updates. Note: Because list filters are intended for a potentially non-technical audience, they sometimes borrow from patterns of colloquial speech rather than common patterns found in code.

## Guidance

APIs may provide filtering to users on **List** methods (or similar methods to query a collection, such as Search). If they choose to do so, they **should** follow the common specification for filters discussed here. The syntax is formally defined in the EBNF grammar.

When employing filtering, a request message **should** have exactly one filtering field, **string filter**.

Filtering of related objects is handled through traversal or functions. Note: List Filters have fuzzy matching characteristics with support for result ranking and scoring. For developers interested in deterministic evaluation of list filters, see CEL.

## Literals

A bare literal value (examples: "42", "Hugo") is a value to be matched against. Literals appearing alone (with no specified field) **should** usually be matched anywhere it may appear in an object's field values. However, a service may choose to only consider certain fields; if so, it **must** document which fields it considers. A service may include new fields over time, but **should** do so judiciously and consider impact on existing users.

Note: Literals separated by whitespace are considered to have a fuzzy variant of AND. Therefore, Victor Hugo is roughly equivalent to **Victor AND Hugo**.

Logical Operators Filtering implementations **should** provide the binary operators:

| Operator   | Example                                      | Meaning                   |
|------------|----------------------------------------------|---------------------------|
| AND        | a AND b                                      | True if a and b are true. |
| OR         | a OR b OR c True if any of a, b, c are true. |                           |

Note: To match common patterns of speech, the OR operator has higher precedence than AND, unlike what is found in most programming languages. The expression **a AND b OR c** evaluates: **a AND (b**
OR c). API documentation and examples **should** encourage the use of explicit parentheses to avoid confusion, but **should not** require explicit parentheses.

## Negation Operators

Filtering implementations **should** provide the unary operators NOT and -. These are used interchangeably, and a service that supports negation **must** support both formats.

Operator Example **Meaning**

| NOT   | NOT a   | True if a is not true.   |
|-------|---------|--------------------------|

- -a True if a is not true.

## Comparison Operators

Filtering implementations **should** provide the binary comparison operators =, !=, <, >, <=, and >= for string, numeric, timestamp, and duration fields (but **should not** provide them for booleans or enums). Note: Unlike in most programming languages, field names **must** appear on the left-hand side of a

| Operator   | Example                                               | Meaning                                       |
|------------|-------------------------------------------------------|-----------------------------------------------|
| =          | a = true                                              | True if a is true.                            |
| !=         | a != 42                                               | True unless a equals 42.                      |
| <          | a < 42                                                | True if a is a numeric value below 42.        |
| >          | a > "foo"                                             | True if a is lexically ordered after "foo".   |
| <=         | a <= "foo" True if a is "foo" or lexically before it. |                                               |
| >=         | a >= 42                                               | True if a is a numeric value of 42 or higher. |

comparison operator; the right-hand side only accepts literals and logical operators. Because filters are accepted as query strings, type conversion takes place to translate the string to the appropriate strongly-typed value:
Enums expect the enum's string representation (case-sensitive).

Booleans expect **true** and **false** literal values.

Numbers expect the standard integer or float representations. For floats, exponents are supported
(e.g. **2.997e9**).

Durations expect a numeric representation followed by an s suffix (for seconds). Examples: 20s, 1.2s.

Timestamps expect an RFC-3339 formatted string (e.g. **2012-04-21T11:30:00-04:00**). UTC
offsets are supported.

Warning: The identifiers true, **false**, and **null** only carry intrinsic meaning when used in the context of a typed field reference.

Additionally, when comparing strings for equality, services **should** support wildcards using the *
character; for example, **a = "*.foo"** is true if a ends with ".foo".

## Traversal Operator

Filtering implementations **should** provide the . operator, which indicates traversal through a message, map, or struct.

## Example **Meaning**

a.b = true True if a has a boolean b field that is true. a.b > 42 True if a has a numeric b field that is above 42. a.b.c = "foo" True if a.b has a string c field that is "foo".

Traversal **must** be written using the field names from the resource. If a service wishes to support "implicit fields" of some kind, they **must** do so through well-documented functions. A service may specify a subset of fields that are supported for traversal. If a user attempts to traverse to a field that is not defined on the message, the service **should** return an error with **INVALID_ARGUMENT**. A service may permit traversal to undefined keys on maps and structs, and **should** document how it behaves in this situation.

Important: The . operator **must not** be used to traverse through a repeated field or list, except for specific use with the : operator.

## Has Operator

Filtering implementations **must** provide the : operator, which means "has". It is usable with collections
(repeated fields or maps) as well as messages, and behaves slightly differently in each case. Repeated fields query to see if the repeated structure contains a matching element:
Example **Meaning**
r:42 True if r contains 42.

r.foo:42 True if r contains an element e such that **e.foo = 42**.

Important: Filters can not query a specific element on a repeated field for a value. For example, e.0.foo = 42 and **e[0].foo = 42** are not valid filters.

Maps, structs, messages can query either for the presence of a field in the map or a specific value:
Example **Meaning**
m:foo True if m contains the key "foo". m.foo:* True if m contains the key "foo". m.foo:42 True if **m.foo** is 42.

There are two slight distinctions when parsing messages:
When traversing messages, a field is only considered to be present if it has a non-default value. When traversing messages, field names are snake case, although implementations may choose to support automatic conversion between camel case and snake case.

## Functions

The filtering language supports a function call syntax in order to support API-specific extensions. An API
may define a function using the **call(arg...)** syntax, and **must** document any specific functions it supports.

## Limitations

A service may specify further structure or limitations for filter queries, above what is defined here. For example, a service may support the logical operators but only permit a certain number of them (to avoid "queries of death" or other performance concerns). Further structure or limitations **must** be clearly documented, **must not** violate requirements set forth in this document, and a non-compliant filter query **must** error with **INVALID_ARGUMENT**.

# Sample Queries

This document provides you with suggested queries to make it easier to find important logs using the Logs Explorer in the Google Cloud console. The listed queries are written in the Logging query language (/logging/docs/view/logging-query-language), and they can be used in the Logs Explorer (/logging/docs/view/building-queries), the Logging API
 (/logging/docs/reference/v2/rest/v2/entries/list), or the command-line interface
 (/logging/docs/api/gcloud-logging\#v2_api_commands).

The Logs Explorer uses Boolean expressions to specify a subset of all the log entries in your project. You can use these queries to choose log entries from specific logs or log services, or that satisfy conditions on metadata or user-defined fields.

## Before You Begin

To view the logs that you're sending from an Amazon Web Services (AWS) account to Logging, select the AWS connector project (/monitoring/settings/aws-accounts\#connector-project) in the Google Cloud console resource picker and then use the Logs Explorer
 (/logging/docs/view/logs-explorer-interface). The AWS connector project stores the Amazon Resource Name (ARN) for your AWS account and links your AWS account to Google Cloud services. For more information, see Collect metrics from AWS accounts
 (/monitoring/settings/aws-accounts). Ensure that you have the correct Identity and Access Management permissions or roles for building queries using the Logs Explorer. For details on the necessary IAM permissions, see Permissions for the Google Cloud console (/logging/docs/access-control\#console_permissions).

## Get Started

1. In the navigation panel of the Google Cloud console, select **Logging**, and then select **Logs**
Explorer:
Go to Logs Explorer (https://console.cloud.google.com/logs/query)
2. Select the appropriate Google Cloud project or other Google Cloud resource for which you want to view logs.

# Use The Sample Queries

To apply a query from the following tables, click the content_copy**Content Copy** icon for the expression,

![38_image_0.png](38_image_0.png)

and then paste the copied expression into the Logs Explorer query-editor field:
If you don't see the query-editor field, enable **Show query**. After you review your query expression, click **Run query**. Logs that match your query are listed under **Query results**.

Some of the queries listed later on this page include variables that you should replace with valid values. For example, when a query includes logName, then the *PROJECT_ID* you supply must refer to the currently selected Google Cloud project; otherwise, the query won't work. Note the following:
If you have a query with a timestamp, then the time-range selector
 (/logging/docs/view/building-queries\#time-range) is disabled, and the query uses the timestamp expression as its time-range restriction. If a query doesn't use a timestamp expression, then the query uses the time-range selector as its time-range restriction.

The length of a query can't exceed 20,000 characters.

The Logging query language (/logging/docs/view/logging-query-language) is case-insensitive, with the exception of regular expressions.

You can use the log_id function for queries with a log_name expression. For example, the expression log_name="projects/PROJECT_ID/logs/cloudaudit.googleapis.com%2Fdata_access
" is the same as log_id("cloudaudit.googleapis.com/data_access"). For more information about the log_id function, see Logging query language: Functions
 (/logging/docs/view/logging-query-language\#functions).

For instructions about querying in the Google Cloud console, see Build queries in the Logs Explorer (/logging/docs/view/building-queries). The following sections group queries by Google Cloud services.

## App Engine Queries

Query/filter

name**Expression**

App Engine logs from New Year's Eve (in UTC
time)
resource.type="gae_app" AND
severity>=ERROR AND
timestamp>="2018-12-31T00:00:00Z" AND timestamp<="2019-01-01T00:00:00Z"
App Engine request logs with server errors resource.type="gae_app" AND log_id("appengine.googleapis.com/request_log") AND
httpRequest.status>=500 App Engine logs

| Sampled HTTP error logs                                                                                          | resource.type="gae_app" AND protoPayload.status >= 400 AND sample(insertId, 0.1)   |
|------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| Search for App Engine trace ID resource.type="gae_app" AND trace="projects/PROJECT_ID edit/traces/TRACE_ID edit" |                                                                                    |

resource.type="gae_app" AND
resource.labels.module_id=" " AND
resource.labels.version_id=" "
MODULE_ID edit VERSION_ID edit Recent App Engine deployments resource.type="gae_app" AND
protoPayload."@type"="type.googleapis.com/google.cloud.audit.AuditLog" A protoPayload.serviceName="appengine.googleapis.com" API enable and disable queries Query/filterExpression Audit API enable logs protoPayload.methodName="google.api.serviceusage.v1.ServiceUsage.EnableSe Audit API
disable logs protoPayload.methodName="google.api.serviceusage.v1.ServiceUsage.DisableSe

## Bigquery Queries

Query/filter name**Expression**
BigQuery audit logs resource.type=("bigquery_dataset" OR "bigquery_project") AND
logName:"cloudaudit.googleapis.com" BigQuery audit logs for a dataset

| BigQuery audit logs for a project resource.type="bigquery_project" AND logName:"cloudaudit.googleapis.com"   |
|--------------------------------------------------------------------------------------------------------------|

resource.type="bigquery_dataset" AND logName:"cloudaudit.googleapis.com" BigQuery audit logs for BI Engine Model resource.type="bigquery_biengine_model" AND logName:"cloudaudit.googleapis.com" BigQuery audit logs for a Data Transfer Service Run.

resource.type="bigquery_dts_run" AND
logName:"cloudaudit.googleapis.com" BigQuery audit logs for a Data Transfer Service configuration.

resource.type="bigquery_dts_config" AND
logName:"cloudaudit.googleapis.com"

| BigQuery data transfer service jobs resource.type=("bigquery_project") AND protoPayload.requestMetadata.callerSuppliedUserAgent= "BigQuery Data Transfer Service" AND protoPayload.methodName=("google.cloud.bigquery.v2.JobService.InsertJob" "google.cloud.bigquery.v2.JobService.Query") BigQuery transfer run logs resource.type="bigquery_dts_config" AND RUN_ID edit labels.run_id=" " AND CONFIG_ID edit resource.labels.config_id=" " BigQuery dataset updates resource.type="bigquery_dataset" AND log_id("cloudaudit.googleapis.com/activity") AND protoPayload.methodName= "google.cloud.bigquery.v2.DatasetService.UpdateDataset" BigQuery jobs completed resource.type="bigquery_project" AND log_id("cloudaudit.googleapis.com/data_access") AND protoPayload.methodName=("google.cloud.bigquery.v2.JobService.InsertJob" OR "google.cloud.bigquery.v2.JobService.Query") BigQuery large queries resource.type="bigquery_project" AND protoPayload.metadata.jobChange.job.jobStats.queryStats.totalBilledBytes > 1073741824 BigQuery quota exceeded resource.type=("bigquery_dataset" OR "bigquery_project") AND protoPayload.status.code=8 AND severity>=WARNING BigQuery query started resource.type="bigquery_project" AND protoPayload.metadata.jobInsertion.reason:* BigQuery concurrent load/extract jobs resource.type="bigquery_resource" AND protoPayload.methodName="jobservice.insert" AND protoPayload.serviceData.jobInsertRequest.resource.jobConfiguration.quer "extract"   |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

## Dataflow Queries

| Query/filter name                                                                                                      | Expression   |
|------------------------------------------------------------------------------------------------------------------------|--------------|
| Errors and warnings in Dataflow workers resource.type="dataflow_step" AND log_id("dataflow.googleapis.com/worker") AND |              |

## Dataproc Queries

| Query/filter name           | Expression   |
|-----------------------------|--------------|
| Dataproc Apache Hadoop logs |              |

| resource.type="cloud_dataproc_cluster" AND jsonPayload.class:"org.apache.hadoop.mapreduce"   |
|----------------------------------------------------------------------------------------------|

## Cloud Deployment Manager

| Query/filter name         | Expression                                     |
|---------------------------|------------------------------------------------|
| Deployment Manager errors | resource.type="deployment" AND severity>=ERROR |

## Cloud Functions Queries

Query/filter name **Expression**

| Cloud function errors   |
|-------------------------|

## Cloud Monitoring Queries

| resource.type="cloud_function" AND log_id("cloudfunctions.googleapis.com/cloud-functions") AND severity>=ERROR   |
|------------------------------------------------------------------------------------------------------------------|

| Query/filter name                    | Expression   |
|--------------------------------------|--------------|
| Show all notification channel errors |              |

| resource.type="stackdriver_notification_channel" AND severity>=ERROR   |
|------------------------------------------------------------------------|

| Query/filter name                                    | Expression                                                                                                                      |
|------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| Show notification channel errors due to throttling   | resource.type="stackdriver_notification_channel" AND severity>=ERROR AND jsonPayload.summary="Notification delivery throttled." |
| Show logs written by the uptime resource             | resource.type="uptime_url"                                                                                                      |
| Show requests received from the uptime-check service | "GoogleStackdriverMonitoring-UptimeChecks"                                                                                      |

## Cloud Run Queries

| Query/filter name                                                                                                                                                                                                                                           | Expression   |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------|
| Cloud Run logs for a specific job resource.type="cloud_run_job" AND resource.labels.service_name="JOB_NAME edit" Cloud Run logs for a specific revision and service resource.type="cloud_run_revision" AND resource.labels.service_name="SERVICE_NAME edit" |              |

## Cloud Source Repositories Queries

| Query/filter name            | Expression                                                                     |
|------------------------------|--------------------------------------------------------------------------------|
| Cloud Source Repository logs | resource.type="csr_repository" AND resource.labels.name="REPOSITORY_NAME edit" |

## Spanner Queries

| Query/filter name                                                                                                                           | Expression   |
|---------------------------------------------------------------------------------------------------------------------------------------------|--------------|
| Cloud Spanner logs for a specific spanner instance resource.type="spanner_instance" AND resource.labels.instance_id="SPANNER_INSTANCE edit" |              |

# Cloud Sql Queries

| Query/filter name                                                                                                                                                                                                                                                                                    | Expression                                                                        |       |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|-------|
| Cloud SQL audit logs                                                                                                                                                                                                                                                                                 | resource.type="cloudsql_database" AND resource.labels.database_id="               | " AND |
| DATABASE_ID edit                                                                                                                                                                                                                                                                                     |                                                                                   |       |
| log_id("cloudaudit.googleapis.com/activity")                                                                                                                                                                                                                                                         |                                                                                   |       |
| Cloud SQL MySQL error logs                                                                                                                                                                                                                                                                           | resource.type="cloudsql_database" AND log_id("cloudsql.googleapis.com/mysql.err") |       |
| Cloud SQL MySQL-based databases                                                                                                                                                                                                                                                                      | resource.type="cloudsql_database" AND resource.labels.database_id="               | " AND |
| DATABASE_ID edit                                                                                                                                                                                                                                                                                     |                                                                                   |       |
| log_id("cloudsql.googleapis.com/mysql")                                                                                                                                                                                                                                                              |                                                                                   |       |
| Cloud SQL Postgres-based databases                                                                                                                                                                                                                                                                   | resource.type="cloudsql_database" AND resource.labels.database_id="               | " AND |
| DATABASE_ID edit                                                                                                                                                                                                                                                                                     |                                                                                   |       |
| log_id("cloudsql.googleapis.com/postgres.log")                                                                                                                                                                                                                                                       |                                                                                   |       |
| Cloud SQL SQL Server error logs resource.type="cloudsql_database" AND log_id("cloudsql.googleapis.com/sqlserver.err") Cloud SQL SQL Server-based databases resource.type="cloudsql_database" AND resource.labels.database_id=" " AND DATABASE_ID edit log_id("cloudsql.googleapis.com/sqlagent.out") |                                                                                   |       |

## Cloud Storage Queries

| Query/filter name        | Expression                                                                                                                        |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| GCS bucket logs          | resource.type="gcs_bucket" AND resource.labels.bucket_name="BUCKET_NAME edit"                                                     |
| GCS bucket audit logs    | resource.type="gcs_bucket" AND logName:"cloudaudit.googleapis.com"                                                                |
| GCS bucket creation logs | resource.type="gcs_bucket" AND log_id("cloudaudit.googleapis.com/activity") AND protoPayload.method_name="storage.buckets.create" |
| GCS bucket deletion logs | resource.type="gcs_bucket" AND log_id("cloudaudit.googleapis.com/activity") AND                                                   |

## Cloud Tasks Queries

| Query/filter name      | Expression                                                                     |
|------------------------|--------------------------------------------------------------------------------|
| Cloud Tasks queue logs | resource.type="cloud_tasks_queue" AND resource.labels.queue_id="QUEUE_ID edit" |

## Compute Engine Queries

| Query/filter name                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Expression                                                                                                                        |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| Compute Engine Admin Activity logs                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | resource.type="gce_instance" AND log_id("cloudaudit.googleapis.com/activity")                                                     |
| Compute Engine firewall rule deletion                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | resource.type="gce_firewall_rule" AND log_id("cloudaudit.googleapis.com/activity") AND protoPayload.methodName:"firewalls.delete" |
| Compute Engine VM syslogs                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | resource.type="gce_instance" AND log_id("syslog")                                                                                 |
| Compute Engine VM authlogs                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | resource.type="gce_instance" AND log_id("authlog")                                                                                |
| Compute Engine Host Error resource.type="gce_instance" protoPayload.serviceName="compute.googleapis.com" (protoPayload.methodName:"OnHostMaintenance" OR operation.producer:"OnHostMaintenance") log_id("cloudaudit.googleapis.com/system_event") resource.labels.instance_id=" " INSTANCE_ID edit severity=INFO Compute Engine Host Migrated resource.type="gce_instance" protoPayload.serviceName="compute.googleapis.com" (protoPayload.methodName: "compute.instances.migrateOnHostMaintenance" OR operation.producer: |                                                                                                                                   |

| "compute.instances.migrateOnHostMaintenance") log_id("cloudaudit.googleapis.com/system_event") resource.labels.instance_id=" " INSTANCE_ID edit severity=INFO                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Compute Engine VM Terminated/Preempted resource.type="gce_instance" protoPayload.methodName= ~"compute\.instances\.(guestTerminate|preempted)" log_id("cloudaudit.googleapis.com/system_event") resource.labels.instance_id="INSTANCE_ID edit" Compute Engine VM Instance Created resource.type="gce_instance" protoPayload.methodName:"compute.instances.insert" log_id("cloudaudit.googleapis.com/activity") protoPayload.request.name="INSTANCE_NAME edit" Compute Engine VM Instance Deleted with Name resource.type="gce_instance" protoPayload.methodName:"compute.instances.delete" log_id("cloudaudit.googleapis.com/activity") protoPayload.resourceName:"INSTANCE_NAME edit" Compute Engine VM Instance Deleted with ID resource.type="gce_instance" protoPayload.methodName:"compute.instances.delete" log_id("cloudaudit.googleapis.com/activity") resource.labels.instance_id="INSTANCE_ID edit" Compute Engine VM Instance Restarted resource.type="gce_instance" protoPayload.methodName=~"compute\.instances\.( stop|reset|automaticRestart|guestTerminate| instanceManagerHaltForRestart)" (log_id("cloudaudit.googleapis.com/activity") OR log_id("cloudaudit.googleapis.com/system_event")) resource.labels.instance_id="INSTANCE_ID edit" Compute Engine Shielded VM Boot Integrity Failure resource.type="gce_instance" log_id("compute.googleapis.com/shielded_vm_integrity") jsonPayload.earlyBootReportEvent.policyEvaluationPassed="false" resource.labels.instance_id="INSTANCE_ID edit" Compute Engine VM instance stopped by Guest OS resource.type="gce_instance" protoPayload.serviceName="compute.googleapis.com" (protoPayload.methodName:"compute.instances.guestTerminate" OR operation.producer:"compute.instances.guestTerminate") log_id("cloudaudit.googleapis.com/system_event") INSTANCE_ID editresource.labels.instance_id=" " severity=INFO |

| Compute Engine Shielded VM boot file was blocked   | resource.type="gce_instance" log_id("serialconsole.googleapis.com/serial_port_1_output") textPayload:("Security Violation") resource.labels.instance_id="INSTANCE_ID edit"                                                                            |
|----------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Persistent Disk Created                            | resource.type="gce_disk" AND protoPayload.methodName:"compute.disks.insert" AND log_id("cloudaudit.googleapis.com/activity") AND protoPayload.resourceName: "PERSISTENT_DISK_NAME edit"                                                               |
| Nodes added in Sole Tenant Node                    | resource.type="gce_node_group" log_id("cloudaudit.googleapis.com/activity") protoPayload.methodName=~("compute.nodeGroups.addNodes" OR "compute.nodeGroups.insert") NODE_GROUP_ID edit resource.labels.node_group_id=" " severity="INFO"              |
| Autoscale events in Sole Tenant Node               | resource.type="gce_node_group" log_id("cloudaudit.googleapis.com/system_event") protoPayload.methodName=~("compute.nodeGroups.deleteNodes" OR "compute.nodeGroups.addNodes") resource.labels.node_group_id="NODE_GROUP_ID edit"                       |
| Manual Snapshot Taken                              | resource.type="gce_snapshot" log_id("cloudaudit.googleapis.com/activity") protoPayload.methodName:"compute.snapshots.insert" protoPayload.resourceName:"SNAPSHOT_NAME edit"                                                                           |
| Scheduled Snapshot Taken                           | resource.type="gce_disk" log_id("cloudaudit.googleapis.com/system_event") protoPayload.methodName="ScheduledSnapshots" protoPayload.response.operationType="createSnapshot" protoPayload.response.targetLink="PERSISTENT_DISK_NAME edit"              |
| Snapshot Schedule Created                          | resource.type="gce_resource_policy" log_id("cloudaudit.googleapis.com/activity") protoPayload.methodName:"compute.resourcePolicies.insert" protoPayload.request.name="SCHEDULE_NAME edit"                                                             |
| Snapshot Schedule Attached                         | resource.type="gce_disk" log_id("cloudaudit.googleapis.com/activity") protoPayload.methodName:"compute.disks.addResourcePolicies" protoPayload.request.resourcePolicys:" " SCHEDULE_NAME edit protoPayload.resourceName:" " PERSISTENT_DISK_NAME edit |
| Quota Exceeded                                     | resource.type="gce_instance" protoPayload.methodName:"compute.instances.insert"                                                                                                                                                                       |

protoPayload.status.message:"QUOTA_EXCEEDED" severity=ERROR

| severity=ERROR                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |                                    |                           |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------|---------------------------|
| Query unhealthy instances in instance group                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | resource.type="gce_instance_group" | INSTANCE_GROUP_NAME" edit |
| resource.labels.instance_group_name=" jsonPayload.healthCheckProbeResult.healthState="UNHEALTHY"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |                                    |                           |
| Query instance group members within a time frame in UTC time format resource.type="gce_instance_group_manager" resource.labels.instance_group_manager_name=" jsonPayload.@type= "type.googleapis.com/compute.InstanceGroupManagerEvent" jsonPayload.instanceHealthStateChange.detailedHealthState="HEALTH timestamp >= timestamp <= INSTANCE_GROUP_NAME START_TIME edit END_TIME edit Instances removed from Instance Group resource.type="gce_instance_group" protoPayload.methodName:"compute.instanceGroups.removeInstances" log_id("cloudaudit.googleapis.com/activity") resource.labels.instance_group_name="INSTANCE_GROUP_NAME edit" Instance template set or updated resource.type="gce_instance_group_manager" log_id("cloudaudit.googleapis.com/activity") protoPayload.methodName= "v1.compute.instanceGroupManagers.setInstanceTemplate" resource.labels.instance_group_manager_name="INSTANCE_GROUP_MANAG Firewall rule deleted resource.type="gce_firewall_rule" log_id("cloudaudit.googleapis.com/activity") protoPayload.methodName:"firewalls.delete" Firewall logs resource.type="gce_subnetwork" log_id("compute.googleapis.com/firewall") jsonPayload.instance.vm_name="INSTANCE_NAME edit" |                                    |                           |

## Google Cloud Observability Queries

| Query/filter name                            | Expression                                                                                                                               |
|----------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| Log sink activities                          | resource.type="logging_sink" AND log_id("cloudaudit.googleapis.com/activity")                                                            |
| Log-based metric create or update activities | resource.type="metric" AND log_id("cloudaudit.googleapis.com/activity") AND protoPayload.methodName:(UpdateLogMetric OR CreateLogMetric) |

Uptime URL checks for a host resource.type="uptime_url" AND
resource.labels.host="URL edit"

# Identity And Access Management Queries

| Query/filter name Expression Service account creation logs resource.type="service_account" AND log_id("cloudaudit.googleapis.com/activity") AND protoPayload.methodName="google.iam.admin.v1.CreateServiceAccount" Service account creation key logs resource.type="service_account" AND log_id("cloudaudit.googleapis.com/activity") AND protoPayload.methodName="google.iam.admin.v1.CreateServiceAccountKey" Set access control policy logs resource.type="project" AND log_id("cloudaudit.googleapis.com/activity") AND protoPayload.methodName="SetIamPolicy" External principal granted access to organization resource.type="project" AND log_id("cloudaudit.googleapis.com/activity") AND protoPayload.@type="type.googleapis.com/google.cloud.audit.AuditLog" AND protoPayload.request.@type:"IamPolicy" AND protoPayload.serviceData.policyDelta.bindingDeltas.member:* AND NOT protoPayload.serviceData.policyDelta.bindingDeltas.member:"@DOMAIN_N Resource creation, modification, or deletion log_id("cloudaudit.googleapis.com/activity") AND protoPayload.methodName:("create" OR "delete" OR "update") Role granted to principal log_id("cloudaudit.googleapis.com/activity") AND resource.type="project" AND protoPayload.serviceName="cloudresourcemanager.googleapis.com" AND protoPayload.methodName="SetIamPolicy" AND protoPayload.serviceData.policyDelta.bindingDeltas.action="Add" AND protoPayload.serviceData.policyDelta.bindingDeltas.member:"EMAIL_ID edit" Role removed from principal log_id("cloudaudit.googleapis.com/activity") AND resource.type="project" AND protoPayload.serviceName="cloudresourcemanager.googleapis.com" AND protoPayload.methodName="SetIamPolicy" AND   |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

Kubernetes cluster operations and events in protoPayload.serviceData.policyDelta.bindingDeltas.action="Remove" AND
protoPayload.serviceData.policyDelta.bindingDeltas.member:"EMAIL_ID edit" Permission updated in a custom role log_id("cloudaudit.googleapis.com/activity") AND resource.type="iam_role" AND
protoPayload.serviceName="iam.googleapis.com" AND
protoPayload.methodName:"UpdateRole" AND
resource.labels.role_name:"ROLE_ID edit"

## Kubernetes-Related Queries

For an overview and examples of Admin Activity audit log queries, see those provided on the GKE
Audit logging page (/kubernetes-engine/docs/how-to/audit-logging).

Cluster-level queries Query/filter name**Expression**
resource.type="gke_cluster" AND
log_id("cloudaudit.googleapis.com/activity")
Google Kubernetes Engine cluster operations resource.type="gke_cluster" AND
log_id("cloudaudit.googleapis.com/activity") AND
protoPayload.methodName="google.container.v1.ClusterManager.CreateClust Google Kubernetes Engine cluster creation resource.type="k8s_cluster" AND
log_id("cloudaudit.googleapis.com/activity") AND
protoPayload.methodName:"deployments" Kubernetes cluster deployment resource.type="k8s_cluster" AND
log_id("cloudaudit.googleapis.com/activity") AND protoPayload.authenticationInfo.principalEmail="system:anonymous" Kubernetes cluster authentication failure resource.type="k8s_cluster" AND
resource.labels.location="us-central1-b" uscentral1-b Kubernetes pod requests from users Kubernetes events resource.type="k8s_cluster" AND
log_id("events")

Kubernetes Endpoints

update

resource.type="k8s_cluster" AND
log_id("cloudaudit.googleapis.com/activity") AND protoPayload.request.kind="Endpoints" Kubernetes control plane logs resource.type="k8s_cluster" AND
log_id("cloudaudit.googleapis.com/activity") AND
protoPayload.serviceName="k8s.io" Kubernetes Engine control plane logs resource.type="k8s_cluster" AND
log_id("cloudaudit.googleapis.com/activity") AND
protoPayload.serviceName="container.googleapis.com" Pod deletion resource.type="k8s_cluster" AND log_id("cloudaudit.googleapis.com/activity") AND protoPayload.methodName=~"io\.k8s\.core\.v1\.pods\.(create|delete)"
Kubernetes pod evictions resource.type="k8s_cluster" AND log_id("cloudaudit.googleapis.com/activity") AND
protoPayload.methodName:"io.k8s.core.v1.pods" AND
protoPayload.authenticationInfo.principalEmail="USER_EMAIL edit" Kubernetes pod audit logs from control plane resource.type="k8s_cluster" AND resource.labels.location=" " AND
resource.labels.cluster_name=" " AND
log_id("cloudaudit.googleapis.com/activity") AND
protoPayload.resourceName="core/v1/namespaces/ /pods/
CLUSTER_LOCATION edit CLUSTER_NAME edit POD_NAMESPACE edit POD_
resource.type="k8s_cluster" AND resource.labels.location=" " AND
resource.labels.cluster_name=" " AND
log_id("cloudaudit.googleapis.com/activity") AND
protoPayload.methodName="io.k8s.core.v1.pods.eviction.create" CLUSTER_LOCATION edit CLUSTER_NAME edit

| Kubernetes node audit logs from the control plane resource.type="k8s_cluster" AND resource.labels.location="                                                     | " AND                                                      |       |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------|-------|
| resource.labels.cluster_name="                                                                                                                                   | " AND                                                      |       |
| log_id("cloudaudit.googleapis.com/activity") AND protoPayload.methodName:"io.k8s.core.v1.nodes" CLUSTER_LOCATION edit CLUSTER_NAME edit                          |                                                            |       |
| Kubernetes cluster control plane for Addon Manager Activity resource.type="k8s_cluster" AND resource.labels.location="                                           | " AND                                                      |       |
| resource.labels.cluster_name="                                                                                                                                   | " AND                                                      |       |
| log_id("cloudaudit.googleapis.com/activity") AND protoPayload.authenticationInfo.principalEmail="system:addon-manager" CLUSTER_LOCATION edit CLUSTER_NAME edit   |                                                            |       |
| Kubernetes control plane errors (excluding Conflict, which is normal) resource.type="k8s_cluster" AND resource.labels.location="                                 | " AND                                                      |       |
| resource.labels.cluster_name="                                                                                                                                   | " AND                                                      |       |
| log_id("cloudaudit.googleapis.com/activity") AND protoPayload.status.message!="Conflict" AND protoPayload.status.code!=0 CLUSTER_LOCATION edit CLUSTER_NAME edit |                                                            |       |
| Ingress Controller events                                                                                                                                        | resource.type="k8s_cluster" AND resource.labels.location=" | " AND |
| resource.labels.cluster_name="                                                                                                                                   | " AND                                                      |       |
| log_id("events") AND jsonPayload.source.component="loadbalancer-controller" CLUSTER_LOCATION edit CLUSTER_NAME edit                                              |                                                            |       |
| Service Controller events (kubecontrollermanager) resource.type="k8s_cluster" AND resource.labels.location="                                                                                                                                                                  | " AND                                                      |       |
| resource.labels.cluster_name="                                                                                                                                   | " AND                                                      |       |
| log_id("events") AND jsonPayload.source.component="service-controller" CLUSTER_LOCATION edit CLUSTER_NAME edit                                                   |                                                            |       |
| Cluster Autoscaler events                                                                                                                                        | resource.type="k8s_cluster" AND resource.labels.location=" | " AND |
| resource.labels.cluster_name="                                                                                                                                   | " AND                                                      |       |
| log_id("events") AND jsonPayload.source.component="cluster-autoscaler" CLUSTER_LOCATION edit CLUSTER_NAME edit                                                   |                                                            |       |

| Filter name                                                                                                                                      | Expression                                                                                  |       |
|--------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|-------|
| Query pod during creation                                                                                                                        | resource.type="k8s_pod" AND POD_NAME edit resource.labels.pod_name=" " AND log_id("events") |       |
| Query pod terminated due to resource pressure                                                                                                    | resource.type="k8s_pod" AND log_id("events") AND jsonPayload.reason="Evicted"               |       |
| Scheduler events                                                                                                                                 | resource.type="k8s_pod" AND resource.labels.location="                                      | " AND |
| resource.labels.cluster_name="                                                                                                                   | " AND                                                                                       |       |
| log_id("events") AND jsonPayload.source.component="default-scheduler" CLUSTER_LOCATION edit CLUSTER_NAME edit                                    |                                                                                             |       |
| Scheduler events (preemptions) resource.type="k8s_pod" AND resource.labels.location="                                                            | " AND                                                                                       |       |
| resource.labels.cluster_name="                                                                                                                   | " AND                                                                                       |       |
| log_id("events") AND jsonPayload.source.component="default-scheduler" AND jsonPayload.reason="Preempted" CLUSTER_LOCATION edit CLUSTER_NAME edit |                                                                                             |       |

| Node-level queries Filter name   | Expression                                               |
|----------------------------------|----------------------------------------------------------|
| Node events                      | resource.type="k8s_node" AND log_id("events")            |
| Looking at Kube-proxy logs       | resource.type="k8s_node" AND log_id("kube-proxy")        |
| Looking at dockerd logs          | resource.type="k8s_node" AND log_id("container-runtime") |

| Looking at kubelet errors or failures    | resource.type="k8s_node" AND log_id("kubelet") AND jsonPayload.MESSAGE:("error" OR "fail")                                                                                                                                                                                                                              |
|------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Looking at node logs for GKE system logs | resource.type = "k8s_node" logName:( "logs/container-runtime" OR "logs/docker" OR "logs/kube-container-runtime-monitor" OR "logs/kube-logrotate" OR "logs/kube-node-configuration" OR "logs/kube-node-installation" OR "logs/kubelet" OR "logs/kubelet-monitor" OR "logs/node-journal" OR "logs/node-problem-detector") |

## Namespace Queries

| Namespace queries Filter name                                                                                                                                                                                                                                                                                    | Expression   |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------|
| Container and pod logs for GKE system logs resource.type = ("k8s_container" OR "k8s_pod") resource.labels.namespace_name = ( "cnrm-system" OR "config-management-system" OR "gatekeeper-system" OR "gke-connect" OR "gke-system" OR "istio-system" OR "knative-serving" OR "monitoring-system" OR "kube-system") |              |

## Container Queries

| Filter name                                                       | Expression                                         |
|-------------------------------------------------------------------|----------------------------------------------------|
| Stdout container logs across all pods and containers in a cluster | resource.type="k8s_container" AND log_id("stdout") |

Container error logs across all pods and containers in a cluster

resource.type="k8s_container" AND

log_id("stderr") AND

severity=ERROR

| cluster                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | severity=ERROR   |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------|
| Container error logs for a pod with a specific name resource.type="k8s_container" AND POD_NAME edit resource.labels.pod_name=" " AND severity=ERROR Container error logs for a specific container in a specific pod resource.type="k8s_container" AND resource.labels.pod_name=" " AND resource.labels.container_name="server" AND severity=ERROR POD_NAME edit Container error logs for a specific namespace and container resource.type="k8s_container" AND resource.labels.namespace_name="istio-system" AND resource.labels.container_name="egressgateway" AND severity=ERROR Container logs for a pod with a specific label resource.type="k8s_container" AND labels."k8s-pod/app"="loadgenerator" AND severity=ERROR Container error logs for pods running on a specific node resource.type="k8s_container" AND labels."compute.googleapis.com/resource_name"=NODE_NAME AND severity=ERROR Container logs for a pod with a label generated using skaffold resource.type="k8s_container" AND labels."k8s-pod/app"="loadgenerator" AND labels."k8s-pod/skaffold_dev/run-id"= SKAFFOLD_RUN_ID edit severity=ERROR Container error logs for a specific pod containing a POST in the textPayload resource.type="k8s_container" AND resource.labels.pod_name=" " AND textPayload:"POST" AND severity=ERROR POD_NAME edit Container error logs for a specific pod containing a GET in the structured JSON resource.type="k8s_container" AND resource.labels.pod_name=" " AND POD_NAME editjsonPayload."http.req.method"="GET" AND |                  |

severity=ERROR

| Container errors logs in the kube-system namespace   | resource.type="k8s_container" AND resource.labels.namespace_name="kube-system" AND severity=ERROR   |
|------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| Container error in the container insights log        | resource.type="k8s_container" AND log_id("clouderrorreporting.googleapis.com/insights")             |
| Kubernetes container logs                            | resource.type="k8s_container" AND resource.labels.container_name="CONTAINER_NAME edit"              |

Control plane queries Note: GKE control plane logs must be enabled.

| Filter name                             | Expression                                                                                                                                                                                            |    |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----|
| Kubernetes API server logs              | resource.type="k8s_control_plane_component" resource.labels.component_name="apiserver" CLUSTER_LOCATION edit resource.labels.location=" " CLUSTER_NAME edit resource.labels.cluster_name=" "          |    |
| Kubernetes Scheduler logs               | resource.type="k8s_control_plane_component" resource.labels.component_name="scheduler" resource.labels.location="                                                                                     | "  |
| CLUSTER_LOCATION edit CLUSTER_NAME edit |                                                                                                                                                                                                       |    |
| resource.labels.cluster_name="          | "                                                                                                                                                                                                     |    |
| Kubernetes Controller Manager logs      | resource.type="k8s_control_plane_component" resource.labels.component_name="controller-manager" resource.labels.location=" " CLUSTER_LOCATION edit resource.labels.cluster_name=" " CLUSTER_NAME edit |    |

Logging agent application queries

| Query/filter name   | Expression                                                                             |
|---------------------|----------------------------------------------------------------------------------------|
| Apache logs         | resource.type="gce_instance" AND (logName:"/apache-access" OR logName:"/apache-error") |
| Cassandra logs      | resource.type="gce_instance" AND log_id("cassandra")                                   |
| Chef logs           | resource.type="gce_instance" AND logName:"projects/PROJECT_ID edit/logs/chef-"         |
| Gitlab logs         | resource.type="gce_instance" logName:"projects/PROJECT_ID edit/logs/gitlab-"           |
| Jenkins logs        | resource.type="gce_instance" AND log_id("jenkins")                                     |
| Jetty logs          | resource.type="gce_instance" AND logName:"projects/PROJECT_ID edit/logs/jetty-"        |
| Joomla logs         | resource.type="gce_instance" AND log_id("joomla")                                      |
| Linux syslogs       | resource.type="gce_instance" AND log_id("syslog")                                      |
| Magneto logs        | resource.type="gce_instance" AND logName:"projects/PROJECT_ID edit/logs/magneto-"      |
| Mediawiki logs      | resource.type="gce_instance" AND log_id("mediawiki")                                   |
| memcached logs      | resource.type="gce_instance" AND log_id("memcached")                                   |
| MongoDB logs        | resource.type="gce_instance" AND log_id("mongodb")                                     |
| MySQL logs          | resource.type="gce_instance" AND log_id("mysql")                                       |
| Nginx logs          | resource.type="gce_instance" AND logName:"projects/PROJECT_ID edit/logs/nginx-"        |
| PostgreSQL logs     | resource.type="gce_instance" AND log_id("postgresql")                                  |

| Puppet logs        | resource.type="gce_instance" AND logName:"projects/PROJECT_ID edit/logs/puppet-"   |
|--------------------|------------------------------------------------------------------------------------|
| RabbitMQ logs      | resource.type="gce_instance" AND logName:"projects/PROJECT_ID edit/logs/rabbitmq-" |
| Redmine logs       | resource.type="gce_instance" AND log_id("redmine")                                 |
| Salt logs          | resource.type="gce_instance" AND logName:"projects/PROJECT_ID edit/logs/salt-"     |
| Slow MySQL queries | resource.type="gce_instance" AND log_id("mysql-slow")                              |
| Solr logs          | resource.type="gce_instance" AND log_id("solr")                                    |
| SugarCRM logs      | resource.type="gce_instance" AND log_id("sugarcrm")                                |
| Tomcat logs        | resource.type="gce_instance" AND log_id("tomcat")                                  |
| Zookeeper logs     | resource.type="gce_instance" AND log_id("zookeeper")                               |

## Networking Queries

| Query/filter name                                                                                                                                                                                                                                                                                                                                                                                                                                | Expression                                                                   |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------|
| Firewall- all logs                                                                                                                                                                                                                                                                                                                                                                                                                               | resource.type="gce_subnetwork" AND log_id("compute.googleapis.com/firewall") |
| Firewall logs for a given country resource.type="gce_subnetwork" AND log_id("compute.googleapis.com/firewall") AND jsonPayload.remote_location.country=COUNTRY_ISO_ALPHA_3 edit Firewall logs from a VM resource.type="gce_subnetwork" AND log_id("compute.googleapis.com/firewall") AND jsonPayload.instance.vm_name="INSTANCE_NAME edit" Firewall subnet logs resource.type="gce_subnetwork" AND log_id("compute.googleapis.com/firewall") AND |                                                                              |

| resource.labels.subnetwork_name="SUBNET_NAME edit"                                                                                                                                                                                                                                                                                                                                                                                                                                 |                                                                                                                                                                                          |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Compute Engine subnetwork traffic logs to a subnet                                                                                                                                                                                                                                                                                                                                                                                                                                 | resource.type="gce_subnetwork" AND ip_in_net(jsonPayload.connection.dest_ip, "SUBNET_IP edit")                                                                                           |
| VPC Flow logs                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | resource.type="gce_subnetwork" AND log_id("compute.googleapis.com/vpc_flows")                                                                                                            |
| VPC Flow logs for specific port and protocol                                                                                                                                                                                                                                                                                                                                                                                                                                       | resource.type="gce_subnetwork" AND log_id("compute.googleapis.com/vpc_flows") AND jsonPayload.connection.src_port=" " AND PORT_ID edit jsonPayload.connection.protocol=" " PROTOCOL edit |
| VPC Flow logs for specific subnet                                                                                                                                                                                                                                                                                                                                                                                                                                                  | resource.type="gce_subnetwork" AND log_id("compute.googleapis.com/vpc_flows") AND resource.labels.subnetwork_name"=SUBNET_NAME edit"                                                     |
| VPC Flow logs for specific subnet prefix                                                                                                                                                                                                                                                                                                                                                                                                                                           | resource.type="gce_subnetwork" AND log_id("compute.googleapis.com/vpc_flows") AND ip_in_net(jsonPayload.connection.dest_ip,SUBNET_IP edit)                                               |
| VPC Flow logs for a specific VM resource.type="gce_subnetwork" AND log_id("compute.googleapis.com/vpc_flows") AND jsonPayload.src_instance.vm_name="VM_NAME edit" VPN gateway logs resource.type="vpn_gateway" AND resource.labels.gateway_id="GATEWAY_ID edit" HTTP Load Balancer 5xx errors resource.type="http_load_balancer" AND httpRequest.status>=500 HTTP Load Balancer requests to PHPMyAdmin resource.type="http_load_balancer" AND httpRequest.request_url:"phpmyadmin" |                                                                                                                                                                                          |

## Security Logging Queries

| Query/filter name                                                                             | Expression                          |
|-----------------------------------------------------------------------------------------------|-------------------------------------|
| Audit logs—all                                                                                | logName:"cloudaudit.googleapis.com" |
| Audit logs- Access Transparency (AXT) log_id("cloudaudit.googleapis.com/access_transparency") |                                     |

| Audit logs- Admin Activity   | log_id("cloudaudit.googleapis.com/activity")     |
|------------------------------|--------------------------------------------------|
| Audit logs- Data Access      | log_id("cloudaudit.googleapis.com/data_access")  |
| Audit logs- System Event     | log_id("cloudaudit.googleapis.com/system_event") |

## Troubleshooting

For instructions about troubleshooting common issues when using the Logs Explorer, see Using the Logs Explorer: Troubleshooting (/logging/docs/view/logs-explorer-interface\#troubleshooting).

## What'S Next

For more information about the query syntax, which you can use to customize these queries, see Logging query language (/logging/docs/view/logging-query-language). For more information about querying in the Google Cloud console, see Build queries by using the Logging query language (/logging/docs/view/building-queries).

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License
 (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-04-16 UTC.