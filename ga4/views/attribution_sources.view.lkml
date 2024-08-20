include: "/views/attribution_sources/*.view.lkml"
view: attribution_sources {
dimension: attribution_source_channel {
  group_label: "Session Traffic Source"
  label: "Channel"
  type: string
  sql: COALESCE(${paid_shopping.source},
  ${paid_social.source},${paid_search.source},
  ${paid_video.source},${organic_shopping.source},${organic_social.source},
  ${organic_video.source},${organic_search.source},${others.source},"Other");;
}
}
