Note that you are viewing Looker documentation. For Looker Studio documentation, visit https://support.google.com/looker-studio (https://support.google.com/looker-studio).

## Fields (For Joins)

This page refers to the fields parameter that is part of a join (/looker/docs/reference/param-explore-join). fields can also be used as part of an Explore, described on the fields (for Explores)
 (/looker/docs/reference/param-explore-fields) parameter documentation page.

fields can also be used as part of a set, described on the set (/looker/docs/reference/param-view-set) parameter documentation page.

Usage explore: view_name_1 {
join: view_name_2 {
fields: [
field-or-set-specification, field-or-set-specification,
...

]
}
}
Hierarchy Model File (/looker/docs/reference/param-model)
explore
 (/looker/docs/reference/param-explore-explore)
join (/looker/docs/reference/param-explore-join)
fields Default Value All fields in the joined view Accepts Square brackets containing a comma-separated list of fields or sets Special Rules Set names always end with an asterisk (*)
At the join level, fields and sets can only be included, not excluded. You can, however, exclude all fields
 (\#exclude-all-fields) by using the fields parameter with an empty list, like this: fields: []

## Definition

fields at the join level lets you specify which fields from a joined view are brought into an Explore. If you do not use fields Looker defaults to adding all fields from the view.

A list of fields may be used, like [field_a, field_b].

You can also reference a set of fields (which are created by the set (/looker/docs/reference/param-view-set) parameter), like [set_a*]. The asterisk tells Looker that you are referencing a set name instead of a field name.

## Examples

Only add the field called name from the customer view to the order Explore:
explore: order {
join: customer {
sql_on: ${order.customer_id} = ${customer.id} ;; fields: [name]
}
}
Add the fields called name, address, and age from the customer view to the order Explore:
explore: order {
join: customer {
sql_on: ${order.customer_id} = ${customer.id} ;; fields: [name, address, age]
}
}
Add the set of fields called order_fields from the customer view to the order Explore:
explore: order {
join: customer {
sql_on: ${order.customer_id} = ${customer.id} ;;
fields: [order_fields* ]
}
}

## Common Challenges

fields can only reference fields from its own join fields will be a child of a join (/looker/docs/reference/param-explore-join), which references a view. Any dimensions or measures that are referenced in fields must be a part of that view. For example, suppose we have:
explore: order {
join: customer {
sql_on: ${order.customer_id} = ${customer.id} ;; fields: [name]
}
}
To work properly, a dimension or measure called name must exist in the customer view.

Things to know Use fields: [] with an empty list to exclude all fields You can exclude all fields from a joined view by using the fields parameter with an empty list in your join, like this:
explore: order {
join: customer {
fields: []
sql_on: ${order.customer_id} = ${customer.id} ;;
}
}
In this example, none of the fields from the customer view will be displayed in the order Explore.

The only way to remove fields at the join level is to exclude them all at once with fields: []. You cannot use the ALL_FIELDS* set to exclude all fields at the join level.

However, at the explore level, you can use the ALL_FIELDS* set to exclude individual items, as described in the You can exclude individual items by using fields with explore (\#all-fields) section on this page.

You can exclude individual items by using fields with explore When fields is nested under a join (/looker/docs/reference/param-explore-join) parameter, you can exclude all fields at once (\#exclude-all-fields) using fields: [] or you can include specific fields. But you cannot *exclude* specific fields one at a time. For example, if you had 100 fields, and you only wanted to exclude one of them, you would need to list out all 99 fields that you did want. However, you can instead nest fields under the explore (/looker/docs/reference/param-explore-explore) parameter in order to take advantage of the ALL_FIELDS* set and then exclude fields. For example:
explore: order {
fields: [
ALL_FIELDS*,
-customer.unwanted_field_a, -customer.unwanted_field_b
] join: customer {
sql_on: ${order.customer_id} = ${customer.id} ;;
}
}
Notice how we were able to reference fields from the joined view customer in the Explore level's fields parameter by using the syntax view_name.field_name.

## Different Types Of Fields Parameters Are Applied At Different Times

This page describes fields when it is nested under a join (/looker/docs/reference/param-explore-join) parameter. There is also a similar fields (/looker/docs/reference/param-explore-fields) parameter that is nested under explore (/looker/docs/reference/param-explore-explore). When both are used at the same time, they are applied in a specific order, which affects the resultant behavior: First, all the fields parameters under join (/looker/docs/reference/param-explore-join) are applied. This creates the set of fields that the Explore can choose from. Consider this example:
explore: orders {
join: users {
fields: [name]
sql_on: ${orders.user_id} = ${users.id} ;;
}
}
In this case, the fields that will be available are everything from orders, and name from users. This is the group of fields that would be in the ALL_FIELDS* set (described in the section on excluding individual items (\#all-fields)).

Now, if we add a fields (/looker/docs/reference/param-explore-fields) parameter under explore (/looker/docs/reference/param-explore-explore), we're adding a restriction on top of that set. Suppose we did this:
explore: orders {
fields: [orders.price, users.address] join: users {
fields: [name]
sql_on: ${orders.user_id} = ${users.id} ;;
}
}
In this case:
price from orders will show up as expected, because it is in the ALL_FIELDS* set we created.

address from users *won't* show up, because it wasn't included when users was joined in (only name was).

name from users won't show up either, because we didn't add it to the Explore in the row fields: [orders.price, users.address].

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License
 (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-06-14 UTC.