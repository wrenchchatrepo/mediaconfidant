Note that you are viewing Looker documentation. For Looker Studio documentation, visit https://support.google.com/looker-studio (https://support.google.com/looker-studio).

## Fields (For Explores)

This page refers to the fields parameter that is part of an Explore (/looker/docs/reference/param-explore-explore). fields can also be used as part of a join, described on the fields (for joins)
 (/looker/docs/reference/param-explore-join-fields) parameter documentation page.

fields can also be used as part of a set, described on the set (/looker/docs/reference/param-view-set) parameter documentation page.

Usage explore: explore_name {
fields: [
field-or-set-specification, field-or-set-specification,
...

]
}
Hierarchy Model File (/looker/docs/reference/param-model)
explore
 (/looker/docs/reference/param-explore-explore)
fields Default Value ALL_FIELDS*
Accepts Square brackets containing a comma-separated list of fields or sets Special Rules All fields and sets must be fully scoped (use view_name.field_name syntax)
Fields and sets may be excluded by preceding them with a hyphen (-)
Set names always end with an asterisk (*)
You may use the built-in set name ALL_FIELDS*,
which includes all fields in the Explore You may use the built-in set name view_name*,
which includes all fields in the referenced view.

## Definition

fields lets you specify which fields from an Explore (/looker/docs/reference/param-explore-explore) are exposed in the Explore UI. These fields can be in the Explore's base view or fields available from the Explore's joins. If you do not use fields, Looker defaults to exposing all fields.

A list of fields may be used like this: [view_name.field_a, view_name.field_b].

You can also reference a set of fields (which is defined in a view's set (/looker/docs/reference/param-view-set) parameter), like [view_name.set_a*]. The asterisk tells Looker that you are referencing a set name, rather than a field name.

In both cases, please note that the field or set must be fully scoped. In other words, you must include both the view name and the field name.

Looker automatically creates a set called ALL_FIELDS*, which contains all the fields in the Explore's base view and joins. This is particularly helpful for excluding a handful of unwanted fields, like this:
explore: view_name {
fields: [ALL_FIELDS*, -joined_view_name.unwanted_field]
}
Looker also automatically creates sets that contain all the fields in a given view, which can be referenced with the format view_name*. For example, the following Explore includes only fields in the customers view:
explore: all_people {
fields: [customers*]
}

## Examples

Only show the field called name from the customer view in the customer Explore:
explore: customer {
fields: [customer.name]
}
Only show the fields called name, address, and age from the customer view in the customer Explore:
explore: customer {
fields: [customer.name, customer.address, customer.age]
}
Only show the set of fields in the export_fields set, from the customer view, in the customer Explore:
explore: customer {
fields: [customer.export_fields*]
}
Exclude the field called status in the customer view from the order Explore:
explore: order {
fields: [ALL_FIELDS*, -customer.status]
join: customer {
sql_on: ${order.customer_id} = ${customer.id} ;;
}
}
Things to know You can exclude individual items or sets of items by using fields with explore You can use fields under the explore (/looker/docs/reference/param-explore-explore) parameter in order to take advantage of the ALL_FIELDS* set and then exclude fields. For example:
explore: order {
fields: [
ALL_FIELDS*,
-customer.unwanted_field_a, -customer.unwanted_field_b
]
join: customer {
sql_on: ${order.customer_id} = ${customer.id} ;;
}
}
We were able to reference fields from the joined view customer in the Explore level's fields parameter by using the syntax view_name.field_name. Using the - syntax, you can also exclude defined sets of fields:
explore: orders {
fields: [ALL_FIELDS*, -users.statezip*]
join: users {
sql_on: ${orders.user_id} = ${users.id} ;; relationship: many_to_one
}
} view: users {
set: statezip {
fields:[state, zip]
}
}
The fields parameter that is part of a join cannot use the ALL_FIELDS set This page refers to the fields parameter that is a child of explore
 (/looker/docs/reference/param-explore-explore). When you use the fields parameter in this way, you can access the ALL_FIELDS* set and then exclude unwanted fields, as shown previously.

There is also a fields (/looker/docs/reference/param-explore-join-fields) parameter that is a child of join
 (/looker/docs/reference/param-explore-join). When used in that fashion, you cannot use the ALL_FIELDS* set.

The ALL_FIELDS set is limited by the fields parameter that is part of a join This page describes fields when it is nested under an explore (/looker/docs/reference/param-explore-explore) parameter. There is also a similar fields
 (/looker/docs/reference/param-explore-join-fields) parameter that is nested under join (/looker/docs/reference/param-explore-join). It's important to understand the implications of applying fields to both levels at the same time.

First, all the fields (/looker/docs/reference/param-explore-join-fields) parameters under join (/looker/docs/reference/param-explore-join) are applied. This creates the set of fields that the Explore can choose from. Consider this example:
explore: orders {
join: users {
fields: [name]
sql_on: ${orders.user_id} = ${users.id} ;;
}
}
In this case:
All fields from orders will be available, and included in ALL_FIELDS*. name from users will be available, and included in ALL_FIELDS*. Other fields in users would not be available or included in the ALL_FIELDS* set.

Now, if we add a fields parameter under explore (/looker/docs/reference/param-explore-explore), we're adding a restriction on top of that set. Suppose we did this:
explore: orders {
fields: [orders.price, users.address]
join: users {
fields: [name]
sql_on: ${orders.user_id} = ${users.id} ;;
}
}
In this case:
price from orders will show up as expected, because it is in the ALL_FIELDS* set we created. address from users *won't* show up, because it wasn't included when users was joined in (only name was).

name from users won't show up either, because we didn't add it to the Explore in the row fields: [orders.price, users.address].

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-06-10 UTC.