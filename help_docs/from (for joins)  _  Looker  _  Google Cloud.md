Note that you are viewing Looker documentation. For Looker Studio documentation, visit https://support.google.com/looker-studio (https://support.google.com/looker-studio).

## From (For Joins)

This page refers to the from parameter that is part of a join (/looker/docs/reference/param-explore-join) from can also be used as part of an Explore, described on the from (for Explores)
 (/looker/docs/reference/param-explore-from) parameter documentation page.

Usage explore: view_name {
join: join_name {
from: view_name_2
}
}
Hierarchy Model File (/looker/docs/reference/param-model)
explore (/looker/docs/reference/param-explore-explore)
join (/looker/docs/reference/param-explore-join)
from Default Value A view whose name matches the join's name Accepts The name of an existing view

## Definition

from specifies the view (/looker/docs/reference/param-view) to use in a join. If from is omitted, Looker will assume that the underlying view name is the same as the join name.

Typically from is used only if you want the join and its fields to have a different name than the underlying view. To make this clearer, consider an example where a dimension called order_value has been created in a view called underlying_view:
This field would typically appear as **UNDERLYING VIEW Order Value** in the Explore UI and would be referenced in LookML with ${underlying_view.order_value}. If the LookML in the **Usage** section (\#usage) was applied to this example, the field would appear instead as **NEW ALIAS NAME Order Value** and be referenced as ${new_alias_name.order_value}.

This technique is particularly useful when the same view needs to be joined to an Explore in several different ways.

## Examples

Join the view person to the Explore order, but call it customer instead:
explore: order {
join: customer {
from: person sql_on: ${order.customer_id} = ${customer.id} ;;
}
}
Join the view person to the Explore order two different times -- once as customer and once as representative:
explore: order {
join: customer {
from: person sql_on: ${order.customer_id} = ${customer.id} ;;
} join: representative {
from: person sql_on: ${order.representative_id} = ${representative.id} ;;
}
}

## Things To Consider

from changes the way fields are referenced within an Explore As noted previously, using from has an important impact on the way that fields are referenced. This can cause some challenges when a view (/looker/docs/reference/param-view) is used in many different places. Consider this example:
explore: order {
join: customer {
from: person sql_on: ${order.customer_id} = ${customer.id} ;;
}
}
Here person is being joined to order, but it is being called customer. So, if you needed to reference a field from customer within order, you would use ${customer.field_name}. If, in a second Explore, you join person to order again - but *don't* rename it to customer - the ${customer.field_name} reference will not work in that second Explore. The general approach to this issue is to exclude the problematic field from the second Explore using fields (/looker/docs/reference/param-explore-fields). It would look something like this:
explore: the_second_explore {
fields: [ALL_FIELDS*, -person.problem_field] join: person {
sql_on: ${the_second_explore.some_field} = ${person.some_field} ;;
}
}
from is most often used to join the same table more than once to an Explore In cases where a single table contains different types of entities, it is possible to join a view to an Explore more than once. Suppose you had an order Explore and needed to join a person view to it twice - once for the customer and once for the customer service representative. You might do something like this:
explore: order {
join: customer {
from: person sql_on: ${order.customer_id} = ${customer.id} ;;
}
join: representative {
from: person sql_on: ${order.representative_id} = ${representative.id} ;;
}
}
The SQL that Looker would generate from this LookML is:
SELECT ...

FROM order LEFT JOIN person AS customer ON customer.id = order.customer_id LEFT JOIN person AS representative ON representative.id = order.representative_id Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License
 (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies
 (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-06-10 UTC.