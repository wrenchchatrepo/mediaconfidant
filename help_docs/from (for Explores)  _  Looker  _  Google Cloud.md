Note that you are viewing Looker documentation. For Looker Studio documentation, visit https://support.google.com/looker-studio (https://support.google.com/looker-studio).

## From (For Explores)

This page refers to the from parameter that is part of an Explore (/looker/docs/reference/param-explore-explore). from can also be used as part of a join, described on the from (for joins)
 (/looker/docs/reference/param-explore-join-from) parameter documentation page.

Usage explore: explore_name {
from: view_name
}
Hierarchy Model File (/looker/docs/reference/param-model)
explore (/looker/docs/reference/param-explore-explore)
from Default Value A view whose name matches the Explore's name Accepts The name of an existing view

## Definition

from determines the view that will define the fields of an Explore. If from is omitted, Looker will assume that the underlying view name is the same as the Explore name. Typically from is only used if you want the Explore *and its fields* to have a different name than the underlying view.

To make this more clear, consider an example where a dimension called order_value has been created in a view called underlying_view:
This field would typically appear as **UNDERLYING VIEW Order Value** in the Explore UI, and would be referenced in LookML with ${underlying_view.order_value}.

In the usage example given, the field would appear instead as **NEW ALIAS NAME Order Value** and be referenced as ${new_alias_name.order_value}.

## Examples

Add an option to the Explore menu called **Customer** based on the view called user:
explore: customer {
from: user
}

## Common Challenges

from, view, and label are often confused but have different behaviors As seen in the preceding examples, from has many effects on the way that an Explore is labeled and the way that fields are referenced. There is also a view (/looker/docs/reference/param-explore-view) parameter and a label (/looker/docs/reference/param-explore-label) parameter that have similar, but different, effects.

Using from You should use this option if you want to create multiple Explores from the same view and also want to reference fields *differently* for each Explore:
explore: customer {
from: user
}
\# Would appear in the Explore menu as 'Customer' \# Fields would appear like 'Customer Name'
\# You would reference fields like ${customer.name}
explore: buyer {
from: user
}
\# Would appear in the Explore menu as 'Buyer'
\# Fields would appear like 'Buyer Name' \# You would reference fields like ${buyer.name}
The underlying reason for this behavior is that with from: user, the generated SQL *aliases* the original table name, like this: FROM schema.users AS customer.

Using view You should use this option if you want to create multiple Explores from the same view, and you want to reference fields the *same* way for each Explore:
explore: customer {
view_name: user
} \# Would appear in the Explore menu as 'Customer'
\# Fields would appear like 'User Name'
\# You would reference fields like ${user.name}
explore: buyer {
view_name: user
} \# Would appear in the Explore menu as 'Buyer'
\# Fields would appear like 'User Name'
\# You would reference fields like ${user.name}
The underlying reason for this behavior is that with view_name: user, the generated SQL uses the original table name, like this: FROM schema.users AS users.

Using label You should use this option if you *don't* need to create multiple Explores from the same view, but want the Explore's name to appear *differently* in the Explore menu:
explore: user {
label: "Customer"
}
\# Would appear in the Explore menu as 'Customer'
\# Fields would appear like 'User Name'
\# You would reference fields like ${user.name}

## Things To Know

from is rarely used with explore It's not very common to use from to re-name an Explore. Although there are legitimate use cases, if you find yourself wanting to use this parameter, consider if you can simply rename the underlying view instead. It's much more common to rename joins using the join-level from (/looker/docs/reference/param-explore-join-from) parameter.

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-06-05 UTC.